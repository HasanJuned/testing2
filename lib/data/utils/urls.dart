class Urls {
  static const String _flutterCourseBaseUrl = 'http://10.0.2.2:2001/flutterCourseByHasan';
  static const String fetchAllVideo = '$_flutterCourseBaseUrl/fetchVideo';
  static String playVideo(id) => '$_flutterCourseBaseUrl/fetchVideo/$id';
}