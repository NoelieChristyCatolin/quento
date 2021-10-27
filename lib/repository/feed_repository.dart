import 'package:quento/models/feed.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

class FeedRepository {
  Future<List<Feed>> fetchFeeds() async {
    List<Feed> feeds = [];
    final _response = await http.get(Uri.parse('https://www.buzzfeed.com/world.xml'));
    var feed = RssFeed.parse(_response.body);
    var items = feed.items!;
    items.forEach((element) {
      feeds.add(Feed(title: element.title!, image: element.media!.thumbnails!.first.url!, link: element.link!, date: element.pubDate.toString(), author: element.dc!.creator!));
    });
    return feeds;
  }
}