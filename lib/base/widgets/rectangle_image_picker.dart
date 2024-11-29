import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locate_me/base/widgets/custom_text.dart';
import 'package:locate_me/theme/theme_colors.dart';
import 'package:locate_me/utils/pick_image.dart';

class RectangleImagePicker extends StatefulWidget {
  const RectangleImagePicker({
    super.key,
    this.height,
    this.width,
    this.image,
    required this.onImagePicked,
  });

  final double? height;
  final double? width;
  final XFile? image;
  final Function(XFile?) onImagePicked;

  @override
  State<RectangleImagePicker> createState() => _RectangleImagePickerState();
}

class _RectangleImagePickerState extends State<RectangleImagePicker> {
  late XFile? _image;

  @override
  void initState() {
    super.initState();
    _image = widget
        .image; // Inicializar la imagen con la pasada desde el widget padre
  }

  Future<void> _pickAndSetImage() async {
    final XFile? pickedFile = await PickImage.pickImageFromCamera();
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
      widget.onImagePicked(_image); // Notificar la selección de la imagen
    }
  }

  Future<void> _removeImage() async {
    setState(() {
      _image = null;
    });
    widget.onImagePicked(_image); // Notificar la selección de la imagen
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickAndSetImage,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: widget.width ?? 220,
          height: widget.height ?? 200,
          decoration: BoxDecoration(
            color: ThemeColors.secondary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(16),
          ),
          child: _image == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/image.svg",
                      width: 60,
                      height: 60,
                      colorFilter: const ColorFilter.mode(
                        ThemeColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                      text: 'Suba su imagen aquí',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      color: ThemeColors.primary,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ],
                )
              : Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        File(_image!.path),
                        width: widget.width ?? 220,
                        height: widget.height ?? 200,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Center(
                            child: Image.asset("assets/images/logo.png"),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: _removeImage,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
