import '../API/params.dart';

abstract class NetworkAssets {
  // static const String loadingChangingBall =
  //     "https://assets3.lottiefiles.com/packages/lf20_lz5rbiit.json";
  // static const String noDataFound =
  //     "https://assets3.lottiefiles.com/packages/lf20_wnqlfojb.json";
}

String? getImageUrl(String url) {
  if (url == '') {
    return null;
  }
  String fileName = url.split('/').last;
  return ImageUrls.getImage + fileName;
}
