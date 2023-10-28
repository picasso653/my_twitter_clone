import 'dart:io';
import 'package:image_cropper/image_cropper.dart';

Future<CroppedFile?> cropImage(File imageFile) async {
  // Create an ImageCropper instance.
  final imageCropper = ImageCropper();

  // Crop the image.
  final croppedImage = await imageCropper.cropImage(
    sourcePath: imageFile.path,
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.ratio16x9,
    ],
  );

  // If the user cancelled the cropping operation, return null.
  if (croppedImage == null) {
    return null;
  }

  // Return the cropped image file.
  return croppedImage;
}