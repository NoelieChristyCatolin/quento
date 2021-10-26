import 'package:flutter/material.dart';
import 'package:quento/home/components/feed_card.dart';
import 'package:quento/models/feed.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:introduction_screen/introduction_screen.dart';

class HomePage extends StatefulWidget {
  HomePage(this.title);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<PageViewModel> pages = [];

  //todo: move to helper class/bloc
  List<Feed> feeds = [Feed("10 ~Shy Girl~ Poses We're Copying From Angel Secillano", 'https://images.summitmedia-digital.com/cosmo/images/2021/08/05/angel-secillano-shy-girl-poses-1628157585.jpg', "https://www.cosmo.ph/beauty/angel-secillano-shy-girl-poses-a4462-20210805?ref=feed_1"),
    Feed("PSA: You Can Now *Hide* Likes On Instagram Posts (Finally!)", 'https://images.summitmedia-digital.com/cosmo/images/2021/06/02/instagram-feature-hide-like-counts-1622594647.jpg', "https://www.cosmo.ph/lifestyle/instagram-feature-hide-likes-a704-20210602?ref=feed_1"),
    Feed("Miles Ocampo's Instagram Is Proof That *Filler* Photos Make Your Feed Look #Aesthetic", 'https://images.summitmedia-digital.com/cosmo/images/2021/03/25/miles-ocampo-filler-photos-1616660627.jpg', "https://www.cosmo.ph/lifestyle/miles-ocampo-aesthetic-instagram-filler-photos-a1213-20210325?ref=feed_1"),
    Feed("James Reid Just Posted Photos Of His P80 Million House For Sale And JaDine Hearts Are *Breaking* All Over Again", 'https://images.summitmedia-digital.com/cosmo/images/2021/10/25/james-reid-sells-house-1635139156.jpg', "https://www.cosmo.ph/entertainment/james-reid-house-photos-jadine-hearts-are-breaking-again-a254-a2520-20211025?ref=article_featured_1"),
    Feed("10 ~Shy Girl~ Poses We're Copying From Angel Secillano", 'https://images.summitmedia-digital.com/cosmo/images/2021/08/05/angel-secillano-shy-girl-poses-1628157585.jpg', "https://www.cosmo.ph/beauty/angel-secillano-shy-girl-poses-a4462-20210805?ref=feed_1"),
    Feed("PSA: You Can Now *Hide* Likes On Instagram Posts (Finally!)", 'https://images.summitmedia-digital.com/cosmo/images/2021/06/02/instagram-feature-hide-like-counts-1622594647.jpg', "https://www.cosmo.ph/lifestyle/instagram-feature-hide-likes-a704-20210602?ref=feed_1")];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: feeds.length,
          itemBuilder: (context, index) => FeedCard(
            feeds[index].title,
            feeds[index].image,
            // () => _launchURL(feeds[index].link),
          ))
        
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //todo: move to helper class/bloc
  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch link';
}
