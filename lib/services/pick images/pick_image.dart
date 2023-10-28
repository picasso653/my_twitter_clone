import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImage() async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
  return image;
}
