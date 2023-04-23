class ApiEndpoint {
  static const String baseUrl = 'https://truyen-clone.getdata.one';

  /// for category service
  static const String category = '/category';
  static const String storyByCategory = '/category/id/{?}/story';

  /// for story service
  static const String story = '/story/id/';
  static const String chapterByStory = '/story/{?}/chapters';

  /// for chapter service
  static const String chapter = '/chapter/id/';
}
