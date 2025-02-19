import 'dart:io';
import 'package:camera/camera.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;

class CustomCameraScreen extends StatefulWidget {
  const CustomCameraScreen({super.key});

  @override
  State<CustomCameraScreen> createState() => _CustomCameraScreenState();
}

class _CustomCameraScreenState extends State<CustomCameraScreen> {
  CameraController? _controller;
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
    cameras = await availableCameras();

    _controller = CameraController(
      cameras![0], // Use the first available back camera
      ResolutionPreset.max,
      enableAudio: false,
    );

    await _controller!.initialize();

    if (!mounted) return;

    setState(() {
      isCameraInitialized = true;
      _updateCameraRotation();
    });
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

    if (capturedImage == null) return;

    // Get actual image resolution from the camera sensor
    double imageWidth = capturedImage.width.toDouble();
    double imageHeight = capturedImage.height.toDouble();

    // Get screen size to calculate pixel ratio
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    // **Increase Height of the Live Preview Square**
    double overlayWidth = screenWidth * 0.8; // Adjust width
    double overlayHeight = overlayWidth * (320 / 320); // Increased height

    // Convert overlay size to match actual image resolution
    double scaleX = imageWidth / screenWidth;
    double scaleY = imageHeight / screenHeight;

    int cropSizeX = (overlayWidth * scaleX).toInt();
    int cropSizeY = (overlayHeight * scaleY).toInt();

    // Ensure Crop Area is Centered
    int cropX = ((imageWidth / 2) - (cropSizeX / 2)).toInt();
    int cropY = ((imageHeight / 2) - (cropSizeY / 2)).toInt();

    // Prevent cropping out of bounds
    cropX = cropX.clamp(0, capturedImage.width - cropSizeX);
    cropY = cropY.clamp(0, capturedImage.height - cropSizeY);
    cropSizeX = cropSizeX.clamp(0, capturedImage.width - cropX);
    cropSizeY = cropSizeY.clamp(0, capturedImage.height - cropY);

    // Crop the image to match the preview area
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

    // Return the cropped image path
    Navigator.pop(context, croppedFile.path);
  }

  Future<String> _getImagePath() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    return '${directory.path}/captured_image_$timestamp.jpg';
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
    double overlayWidth = screenSize.width * 0.8; // Adjust width
    double overlayHeight = overlayWidth * (320 / 320); // Increased height

    // Hide status bar only while on the camera screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Full-Screen Camera Preview
          Positioned.fill(
            child: isCameraInitialized
                ? RotatedBox(
                    quarterTurns: quarterTurns,
                    child: CameraPreview(_controller!),
                  )
                : Center(child: CircularProgressIndicator()),
          ),

          // Loader Overlay
          if (isProcessing)
            Positioned.fill(
              child: Container(
                color: Colors.black.withAlpha((255 * 0.5).toInt()),
                child: Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
            ),

          // Apply Mask with Transparent Square
          OverlayMask(overlayWidth: overlayWidth, overlayHeight: overlayHeight),

          Positioned(
            top: 26,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(left: 18, right: 18),
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
          // Capture Button at the Bottom
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
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
    return Stack(
      children: [
        // Dark background with cutout effect
        Positioned.fill(
          child: ClipPath(
            clipper: OverlayClipper(overlayWidth, overlayHeight),
            child: Container(
              color: Color(0xB2040731), // Dark overlay color
            ),
          ),
        ),

        // White Border Box (Overlay Square)
        Center(
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
      ],
    );
  }
}

// Custom Clipper to Cut Out the Center Square
class OverlayClipper extends CustomClipper<Path> {
  final double overlayWidth;
  final double overlayHeight;

  OverlayClipper(this.overlayWidth, this.overlayHeight);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Cut out the center square with rounded corners
    Path cutoutPath = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: overlayWidth,
          height: overlayHeight,
        ),
        Radius.circular(10), // Keep corners rounded
      ))
      ..close();

    return Path.combine(PathOperation.difference, path, cutoutPath);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
