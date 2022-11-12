import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';

import '../../models/turno.dart';

Future<Turno?> getShift(String shiftId) async {
  Dio dio = Dio();

  return await dio
      .get(ShiftUrls.getShiftById + shiftId,
          options: Options(headers: getUserToken()))
      .then((value) {
    return Turno.fromJson(value.data['data']);
  });
  // .onError((error, stackTrace) {
  //   return null;
  // }).timeout(
  //   const Duration(seconds: 40),
  //   onTimeout: () => null,
  // );
}
