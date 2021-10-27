import 'package:quento/models/feed.dart';
import 'package:quento/service/api_service.dart';
import 'package:webfeed/webfeed.dart';

class FeedRepository {
  FeedRepository({required this.apiService});

  final ApiService apiService;

  Future<List<Feed>> fetchFeeds() async {
    List<Feed> feeds = [];
    final _response = await apiService.getFeeds();
    var feed = RssFeed.parse(_response.body);
    var items = feed.items!;
    items.forEach((element) {
      feeds.add(Feed(title: element.title!,description: element.description!, image: element.media!.thumbnails!.first.url!, link: element.link!, date: element.pubDate.toString(), author: element.dc!.creator!));
    });
    return feeds;
  }
}