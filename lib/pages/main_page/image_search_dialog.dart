import 'dart:convert';
import 'dart:io';

import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ImageSearchDialog extends StatefulWidget {
  final Function(BuildContext context, String base64Image) onSearch;

  const ImageSearchDialog({super.key, required this.onSearch});

  @override
  State<ImageSearchDialog> createState() => _ImageSearchDialogState();
}

class _ImageSearchDialogState extends State<ImageSearchDialog> {
  final ImagePicker _picker = ImagePicker();
  File? _capturedImage;
  String? _base64Image = "";
  final int maxFileSize = 1 * 1024 * 1024;

  Future<void> _captureImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _capturedImage = File(image.path);
      });

      // Check the file size
      int fileSize = await _capturedImage!.length();
      if (fileSize > maxFileSize) {
        _capturedImage = null;
        // Show an alert or message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Image size exceeds 10MB. Please select a smaller image.',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'DM Sans',
                    color: FlutterFlowTheme.of(context).info,
                    fontSize: 14.0,
                    letterSpacing: 0.18,
                    lineHeight: 1.33,
                  ),
            ),
          ),
        );
        return; // Stop further processing
      }

      // Convert the image to base64
      _convertImageToBase64(_capturedImage!).then((image) {
        setState(() {
          _base64Image = image;
        });
      });
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _capturedImage = File(image.path);
      });
      // Check the file size
      int fileSize = await _capturedImage!.length();
      if (fileSize > maxFileSize) {
        _capturedImage = null;
        // Show an alert or message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Image size exceeds 10MB. Please select a smaller image.',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'DM Sans',
                    color: FlutterFlowTheme.of(context).info,
                    fontSize: 14.0,
                    letterSpacing: 0.18,
                    lineHeight: 1.33,
                  ),
            ),
          ),
        );
        return; // Stop further processing
      }
      // Convert the image to base64
      _convertImageToBase64(_capturedImage!).then((image) {
        setState(() {
          _base64Image = image;
        });
      });
    }
  }

  Future<String> _convertImageToBase64(File imageFile) async {
    // Read the image file
    final inputPath = imageFile.path;

    // Compress and convert the image to WebP
    final compressedBytes = await FlutterImageCompress.compressWithFile(
      inputPath,
      format: CompressFormat.webp,
      quality: 80,
      minWidth: 800,
      minHeight: 600,
    );

    if (compressedBytes == null) {
      throw Exception("Failed to compress the image.");
    }

    // Convert the compressed bytes to base64
    String base64String = base64Encode(compressedBytes);

    // Return the WebP data URI
    return 'data:image/webp;base64,$base64String';
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'AI Image Search',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'DM Sans',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 18.0,
                        letterSpacing: 0.18,
                        fontWeight: FontWeight.bold,
                        lineHeight: 1.33,
                      ),
                ),
                SizedBox(height: 50),
                if (_capturedImage == null) ...[
                  Text(
                    'Open Camera or Select Image',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'DM Sans',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 16.0,
                          letterSpacing: 0.18,
                          fontWeight: FontWeight.bold,
                          lineHeight: 1.33,
                        ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    '(JPG, PNG, WebP formats supported)',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'DM Sans',
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 14.0,
                          letterSpacing: 0.18,
                          lineHeight: 1.33,
                        ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Maximum file size: 10MB.',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'DM Sans',
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 12.0,
                          letterSpacing: 0.18,
                          lineHeight: 1.33,
                        ),
                  ),
                ],
                if (_capturedImage != null)
                  Image.file(
                    _capturedImage!,
                    width: 200, // Adjust size as needed
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                SizedBox(height: 34),
                if (_base64Image == "") ...[
                  Padding(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: FFButtonWidget(
                      onPressed: _pickImage,
                      text: 'Upload from gallery',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 44.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.12,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.47,
                                ),
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                  Padding(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: FFButtonWidget(
                      onPressed: _captureImage,
                      text: 'Take a Picture',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 44.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'DM Sans',
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  letterSpacing: 0.12,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.47,
                                ),
                        borderSide: const BorderSide(
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ] else ...[
                  SizedBox(height: 14),
                  Padding(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: FFButtonWidget(
                      onPressed: () => widget.onSearch(context, _base64Image!),
                      text: 'Search',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 44.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'DM Sans',
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  letterSpacing: 0.12,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.47,
                                ),
                        borderSide: const BorderSide(
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ],
                SizedBox(height: 24),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: SvgPicture.asset(
                'assets/icons/dialog_cancel.svg',
                width: 12,
                height: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
