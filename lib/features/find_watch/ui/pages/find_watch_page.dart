import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:every_watch/app_state.dart';
import 'package:every_watch/backend/api_requests/api_calls.dart';
import 'package:every_watch/core/di/init_dependencies.dart';
import 'package:every_watch/features/find_watch/ui/cubit/image_search_cubit.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/pages/main_page/image_search_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class FindWatchPage extends StatefulWidget {
  const FindWatchPage({super.key});

  @override
  State<FindWatchPage> createState() => _FindWatchPageState();
}

class _FindWatchPageState extends State<FindWatchPage> {
  final ImageSearchCubit _imageSearchCubit = serviceLocator<ImageSearchCubit>();
  CameraController? _controller;
  final ImagePicker _picker = ImagePicker();
  List<CameraDescription>? cameras;
  bool isCameraInitialized = false;
  int quarterTurns = 0;
  int _selectedCameraIndex = 0; // Track selected camera (default: back camera)
  bool isProcessing = false;
  bool isFlashOn = false; // Track flash state

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _toggleFlashlight() async {
    if (_controller == null || !_controller!.value.isInitialized) return;

    try {
      // Toggle flash mode
      await _controller!
          .setFlashMode(isFlashOn ? FlashMode.off : FlashMode.torch);

      setState(() {
        isFlashOn = !isFlashOn; // Toggle state
      });
    } catch (e) {
      print("Error toggling flashlight: $e");
    }
  }

  Future<void> _flipCamera() async {
    if (cameras == null || cameras!.isEmpty) return;

    // Cycle through available cameras
    _selectedCameraIndex = (_selectedCameraIndex + 1) % cameras!.length;

    // Dispose old controller before switching
    await _controller?.dispose();

    // Initialize new camera
    _controller = CameraController(
      cameras![_selectedCameraIndex],
      ResolutionPreset.max,
      enableAudio: false,
    );

    await _controller!.initialize();

    if (!mounted) return;

    setState(() {
      _updateCameraRotation();
    }); // Refresh UI to show new camera
  }

  Future<void> _initializeCamera() async {
    try {
      // Fetch the available cameras
      cameras = await availableCameras();

      if (cameras!.isEmpty) {
        throw Exception("No cameras found on this device.");
      }

      _controller = CameraController(
        cameras![0], // Use the first available camera
        ResolutionPreset.max,
        enableAudio: false,
      );

      await _controller!.initialize();
      setState(() {}); // Refresh UI once camera is initialized

      if (!mounted) return;

      setState(() {
        isCameraInitialized = true;
        _updateCameraRotation();
      });
    } catch (e) {
      print(e);
    }
  }

  // Updates rotation dynamically
  void _updateCameraRotation() {
    final Orientation currentOrientation = MediaQuery.of(context).orientation;
    final CameraDescription camera = _controller!.description;
    setState(() {
      if (camera.lensDirection == CameraLensDirection.front) {
        // Front Camera (Invert if needed)
        quarterTurns = (currentOrientation == Orientation.portrait) ? 3 : 0;
      } else {
        // Back Camera
        quarterTurns = (currentOrientation == Orientation.portrait) ? 1 : 0;
      }
    });
  }

  Future<void> _captureAndCropImage() async {
    if (_controller == null || !_controller!.value.isInitialized) return;

    setState(() {
      isProcessing = true; // Show loader
    });

    XFile image = await _controller!.takePicture();
    File originalImage = File(image.path);

    // Load the image into memory
    Uint8List imageBytes = await originalImage.readAsBytes();
    img.Image? capturedImage = img.decodeImage(imageBytes);

    if (capturedImage == null) {
      setState(() {
        isProcessing = false;
      });
      return;
    }

    // Get actual image resolution from the camera sensor
    double imageWidth = capturedImage.width.toDouble();
    double imageHeight = capturedImage.height.toDouble();

    // Get screen size to calculate pixel ratio
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    // **Consider the Shifted Preview Square**
    double shiftUpFactor = screenSize.height * 0.10; // Moves crop area up
    if (Platform.isIOS) {
      shiftUpFactor *= 1.4; // iOS needs more adjustment
    }

    // **Updated Cropping Calculations**
    double overlayWidth = screenWidth * 0.8;
    double overlayHeight = overlayWidth * (320 / 320);

    double scaleX = imageWidth / screenWidth;
    double scaleY = imageHeight / screenHeight;

    // Convert screen shift to image scale
    int shiftY = (shiftUpFactor * scaleY).toInt();

    // Adjust Crop Area
    int cropSizeX =
        min(((overlayWidth * scaleX) * 1.4).toInt(), capturedImage.width);
    int cropSizeY =
        min(((overlayHeight * scaleY) * 1.4).toInt(), capturedImage.height);

    // Ensure Crop Area is Centered
    int cropX = ((imageWidth / 2) - (cropSizeX / 2)).toInt();
    int cropY = ((imageHeight / 2) - (cropSizeY / 2) - shiftY)
        .toInt(); // Adjusted for shift

    // **Prevent Cropping Out of Bounds**
    cropX = cropX.clamp(0, max(0, capturedImage.width - cropSizeX));
    cropY = cropY.clamp(0, max(0, capturedImage.height - cropSizeY));

    // Crop the image
    img.Image croppedImage = img.copyCrop(
      capturedImage,
      x: cropX,
      y: cropY,
      width: cropSizeX,
      height: cropSizeY,
    );

    // Save the cropped image
    final path = await _getImagePath();
    File croppedFile = File(path);
    await croppedFile.writeAsBytes(img.encodeJpg(croppedImage));

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ImageSearchDialog(
            onSearch: _searchImage, capturedImage: croppedFile);
      },
    );

    setState(() {
      isProcessing = false;
    });
  }

  Future<String> _getImagePath() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    return '${directory.path}/captured_image_$timestamp.jpg';
  }

  void _onGalleryOpen() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return ImageSearchDialog(
              onSearch: _searchImage, capturedImage: File(image.path));
        },
      );
    }
  }

  void _searchImage(BuildContext context, String base64Image) async {
    final response = await MutualWatchGroup.apiImageSearchPOSTCall.call(
      base64Image: base64Image,
      authorization: FFAppState().loginData.accessToken,
    );

    if (response.succeeded && mounted) {
      _imageSearchCubit.setFlag(true);
      _imageSearchCubit.setSearchText(response.jsonBody['data']);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    // Restore the system UI when exiting the camera screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double overlayWidth = screenSize.width * 0.8;
    double overlayHeight = overlayWidth * (320 / 320);
    double shiftUp = 66.0;

    // Hide status bar only while on the camera screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: isCameraInitialized
                  ? RotatedBox(
                      quarterTurns: quarterTurns,
                      child: CameraPreview(_controller!),
                    )
                  : Container(),
            ),

            // Loader Overlay
            if (isProcessing)
              Positioned(
                top: (screenSize.height - overlayHeight) / 2 - shiftUp,
                left: (screenSize.width - overlayWidth) / 2,
                child: Container(
                  width: overlayWidth,
                  height: overlayHeight,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3.0,
                  ),
                ),
              ),

            // Apply Mask with Transparent Square
            OverlayMask(
                overlayWidth: overlayWidth, overlayHeight: overlayHeight),

            // Top Bar (Close Button, Title, Flash Toggle)
            Positioned(
              top: 16,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                        'assets/icons/custom_camera_close.svg',
                        width: 42,
                        height: 42,
                      ),
                    ),
                    Text(
                      'AI Image Search',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'DM Sans',
                            color: Colors.white,
                            fontSize: 18.0,
                            letterSpacing: 0.12,
                            fontWeight: FontWeight.bold,
                            lineHeight: 1.47,
                          ),
                    ),
                    GestureDetector(
                      onTap: _toggleFlashlight,
                      child: SvgPicture.asset(
                        'assets/icons/custom_camera_flash.svg',
                        width: 42,
                        height: 42,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Capture Button
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom +
                  (Platform.isIOS ? 0 : 40),
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => _onGalleryOpen(),
                      child: SvgPicture.asset(
                        'assets/icons/custom_camera_gallery.svg',
                        width: 42,
                        height: 42,
                      ),
                    ),
                    GestureDetector(
                      onTap: _captureAndCropImage,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/search_tab.svg',
                              width: 28,
                              height: 28,
                              colorFilter: ColorFilter.mode(
                                FlutterFlowTheme.of(context).primary,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _flipCamera,
                      child: SvgPicture.asset(
                        'assets/icons/custom_camera_flip.svg',
                        width: 42,
                        height: 42,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OverlayMask extends StatelessWidget {
  final double overlayWidth;
  final double overlayHeight;

  const OverlayMask({
    super.key,
    required this.overlayWidth,
    required this.overlayHeight,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double shiftUp = screenSize.height *
        0.10; // Moves overlay slightly up (10% of screen height)

    return Stack(
      children: [
        // Dark background with cutout effect
        Positioned.fill(
          child: ClipPath(
            clipper: OverlayClipper(overlayWidth, overlayHeight, shiftUp),
            child: Container(
              color: Color(0xB2040731), // Dark overlay color
            ),
          ),
        ),

        // White Border Box (Overlay Square)
        Positioned(
          top: (screenSize.height - overlayHeight) / 2 -
              (Platform.isIOS ? shiftUp * 1.5 : shiftUp),
          left: (screenSize.width - overlayWidth) / 2,
          child: Container(
            width: overlayWidth,
            height: overlayHeight,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent, // Ensures live preview is not blocked
            ),
          ),
        ),

        // Instruction Text Below the Square
        Positioned(
          top: (screenSize.height / 2) +
              overlayHeight / 2 -
              (Platform.isIOS ? shiftUp * 1.5 : shiftUp) +
              16, // Adjust position
          left: 30, // Add padding from left
          right: 30, // Add padding from right
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 16, vertical: 10), // Add spacing inside
              decoration: BoxDecoration(
                color: Color(0x1FFFFFFF), // Semi-transparent dark background
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              child: Text(
                "Place watch dial in centre to recognise it",
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'DM Sans',
                      color: Colors.white,
                      fontSize: 14.0,
                      letterSpacing: 0.12,
                      fontWeight: FontWeight.bold,
                      lineHeight: 1.47,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Custom Clipper to Cut Out the Center Square
class OverlayClipper extends CustomClipper<Path> {
  final double overlayWidth;
  final double overlayHeight;
  final double shiftUp; // Pass shift value

  OverlayClipper(this.overlayWidth, this.overlayHeight, this.shiftUp);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Move the cutout up
    Path cutoutPath = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(
              size.width / 2, size.height / 2 - shiftUp), // Move cutout up
          width: overlayWidth,
          height: overlayHeight,
        ),
        Radius.circular(10),
      ))
      ..close();

    return Path.combine(PathOperation.difference, path, cutoutPath);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
