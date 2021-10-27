import 'package:quento/models/feed.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

class FeedRepository {


  // List<Feed> fetchFeeds() => [Feed(title: "10 ~Shy Girl~ Poses We're Copying From Angel Secillano", image: 'https://images.summitmedia-digital.com/cosmo/images/2021/08/05/angel-secillano-shy-girl-poses-1628157585.jpg',link: "https://www.cosmo.ph/beauty/angel-secillano-shy-girl-poses-a4462-20210805?ref=feed_1", date: "October 27, 2021", author: "cosmo Writer"),
  // Feed(title: "PSA: You Can Now *Hide* Likes On Instagram Posts (Finally!)", image:'https://images.summitmedia-digital.com/cosmo/images/2021/06/02/instagram-feature-hide-like-counts-1622594647.jpg', link: "https://www.cosmo.ph/lifestyle/instagram-feature-hide-likes-a704-20210602?ref=feed_1", date: "October 27, 2021", author: "cosmo Writer"),
  // Feed(title: "Miles Ocampo's Instagram Is Proof That *Filler* Photos Make Your Feed Look #Aesthetic", image:'https://images.summitmedia-digital.com/cosmo/images/2021/03/25/miles-ocampo-filler-photos-1616660627.jpg', link: "https://www.cosmo.ph/lifestyle/miles-ocampo-aesthetic-instagram-filler-photos-a1213-20210325?ref=feed_1",date: "October 27, 2021", author: "cosmo Writer"),
  // Feed(title: "James Reid Just Posted Photos Of His P80 Million House For Sale And JaDine Hearts Are *Breaking* All Over Again", image:'https://images.summitmedia-digital.com/cosmo/images/2021/10/25/james-reid-sells-house-1635139156.jpg', link: "https://www.cosmo.ph/entertainment/james-reid-house-photos-jadine-hearts-are-breaking-again-a254-a2520-20211025?ref=article_featured_1",date: "October 27, 2021", author: "cosmo Writer"),
  // Feed(title: "10 ~Shy Girl~ Poses We're Copying From Angel Secillano", image:'https://images.summitmedia-digital.com/cosmo/images/2021/08/05/angel-secillano-shy-girl-poses-1628157585.jpg', link: "https://www.cosmo.ph/beauty/angel-secillano-shy-girl-poses-a4462-20210805?ref=feed_1", date: "October 27, 2021", author: "cosmo Writer"),
  // Feed(title: "PSA: You Can Now *Hide* Likes On Instagram Posts (Finally!)", image:'https://images.summitmedia-digital.com/cosmo/images/2021/06/02/instagram-feature-hide-like-counts-1622594647.jpg', link: "https://www.cosmo.ph/lifestyle/instagram-feature-hide-likes-a704-20210602?ref=feed_1", date: "October 27, 2021", author: "cosmo Writer")];

  Future<List<Feed>> fetchFeeds() async {
    List<Feed> feeds = [];
    final _response = await http.get(Uri.parse('https://www.buzzfeed.com/world.xml'));
    var feed = RssFeed.parse(_response.body);
    var items = feed.items!;
    print(feed.title);
    print(feed.items?.length);
    items.forEach((element) {
      feeds.add(Feed(title: element.title!, image: element.media!.thumbnails!.first.url!, link: element.link!, date: element.pubDate.toString(), author: element.dc!.creator!));
    });
    print(feeds.length);
    return feeds;
  }
}