import 'package:flutter_test/flutter_test.dart';

import 'package:referi_app/API/assistance/post_attendance.dart';

void main() {
  const validUrl =
      'https://referiapp.com.ar/v1/asistencias/3fa85f64-5717-4562-b3fc-2c963f66afa6';

  group('isValidAttendanceUrl', () {
    test('accepts the attendance URL the web panel encodes', () {
      expect(isValidAttendanceUrl(validUrl), isTrue);
    });

    test('rejects another host', () {
      expect(
        isValidAttendanceUrl(
            'https://attacker.example/v1/asistencias/3fa85f64-5717-4562-b3fc-2c963f66afa6'),
        isFalse,
      );
    });

    test('rejects a host that merely starts with ours', () {
      expect(
        isValidAttendanceUrl(
            'https://referiapp.com.ar.attacker.example/v1/asistencias/3fa85f64-5717-4562-b3fc-2c963f66afa6'),
        isFalse,
      );
    });

    test('rejects plain http', () {
      expect(
        isValidAttendanceUrl(
            'http://referiapp.com.ar/v1/asistencias/3fa85f64-5717-4562-b3fc-2c963f66afa6'),
        isFalse,
      );
    });

    test('rejects another endpoint on our own host', () {
      expect(
        isValidAttendanceUrl('https://referiapp.com.ar/v1/usuarios/3fa85f64-5717-4562-b3fc-2c963f66afa6'),
        isFalse,
      );
    });

    test('rejects anything appended after the organización id', () {
      expect(isValidAttendanceUrl('$validUrl/../usuarios'), isFalse);
      expect(isValidAttendanceUrl('$validUrl?redirect=https://attacker.example'),
          isFalse);
    });

    test('rejects an organización id that is not a uuid', () {
      expect(
        isValidAttendanceUrl('https://referiapp.com.ar/v1/asistencias/1'),
        isFalse,
      );
    });

    test('rejects a missing organización id', () {
      expect(
        isValidAttendanceUrl('https://referiapp.com.ar/v1/asistencias/'),
        isFalse,
      );
    });

    test('rejects non-URL payloads', () {
      expect(isValidAttendanceUrl(null), isFalse);
      expect(isValidAttendanceUrl(''), isFalse);
      expect(isValidAttendanceUrl('hola'), isFalse);
    });
  });
}
