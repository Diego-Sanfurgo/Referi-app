import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:referi_app/controllers/user_controller.dart';

import '/API/params.dart';
import 'package:mime_type/mime_type.dart';

// Future<http.StreamedResponse> postImage(XFile file) async {
//   List<int> imageBytes = await file.readAsBytes();

//   if (file.name.isEmpty) throw Error();

//   final uri = Uri.parse(ImageUrls.postImage);
//   var request = http.MultipartRequest('POST', uri);
//   var extension = mime( file.name ).toString().split('/')[1];
//   request.files.add(
//       http.MultipartFile.fromBytes(
//           'file',
//           imageBytes,
//           filename: 'image.$extension',
//           contentType:  MediaType('image', extension)
//       )
//   );

//   request.headers['content-type'] = 'multipart/form-data';
//   request.headers.addAll(getUserToken());

//   var res = await request.send();
//   return res;
// }
Future<bool> postImage(XFile file) async {
  Dio dio = Dio();
  List<int> imageBytes = await file.readAsBytes();

  if (file.name.isEmpty) throw Error();

  final uri = Uri.parse(ImageUrls.postImage);
  var extension = mime(file.name).toString().split('/')[1];

  FormData body = FormData.fromMap({
    'file': MultipartFile.fromBytes(
      imageBytes,
      filename: 'image.$extension',
      contentType: MediaType('image', extension),
    )
  });

  return await dio
      .postUri(uri,
          data: body,
          options: Options(
            contentType: 'multipart/form-data',
            headers: getUserToken(),
          ))
      .then((value) {
    String imagePath = ImageUrls.urlToUserImage + value.data['path'];
    UserController.addValueToUser(imagePath, "fotoperfil");
    return true;
  }).onError((error, stackTrace) => false);
}
