import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImage() async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
  if(image !=null){
    return XFile(image.path);
  }else{
    print('No image available');
    return null;
  }
   
}
