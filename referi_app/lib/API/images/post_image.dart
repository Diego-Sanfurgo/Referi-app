import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '/API/params.dart';
import 'package:mime_type/mime_type.dart';

Future<http.StreamedResponse> postImage(XFile file) async {
  List<int> imageBytes = await file.readAsBytes();

  if (file.name.isEmpty) throw Error();

  final uri = Uri.parse(ImageUrls.postImage);
  var request = http.MultipartRequest('POST', uri);
  var extension = mime( file.name ).toString().split('/')[1];
  request.files.add(
      http.MultipartFile.fromBytes(
          'file',
          imageBytes,
          filename: 'image.${extension}',
          contentType:  MediaType('image', extension)
      )
  );

  request.headers['content-type'] = 'multipart/form-data';
  request.headers.addAll(getUserToken());

  var res = await request.send();
  return res;
}
