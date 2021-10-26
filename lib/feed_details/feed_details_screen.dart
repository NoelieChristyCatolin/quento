import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quento/models/feed.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedDetailsScreen extends StatefulWidget {
  const FeedDetailsScreen({Key? key}) : super(key: key);

  @override
  _FeedDetailsScreenState createState() => _FeedDetailsScreenState();
}

class _FeedDetailsScreenState extends State<FeedDetailsScreen> {
  List<PageViewModel> pages = [];
  //todo: move to helper class/bloc
  List<Feed> feeds = [Feed("10 ~Shy Girl~ Poses We're Copying From Angel Secillano", 'https://images.summitmedia-digital.com/cosmo/images/2021/08/05/angel-secillano-shy-girl-poses-1628157585.jpg', "https://www.cosmo.ph/beauty/angel-secillano-shy-girl-poses-a4462-20210805?ref=feed_1"),
    Feed("PSA: You Can Now *Hide* Likes On Instagram Posts (Finally!)", 'https://images.summitmedia-digital.com/cosmo/images/2021/06/02/instagram-feature-hide-like-counts-1622594647.jpg', "https://www.cosmo.ph/lifestyle/instagram-feature-hide-likes-a704-20210602?ref=feed_1"),
    Feed("Miles Ocampo's Instagram Is Proof That *Filler* Photos Make Your Feed Look #Aesthetic", 'https://images.summitmedia-digital.com/cosmo/images/2021/03/25/miles-ocampo-filler-photos-1616660627.jpg', "https://www.cosmo.ph/lifestyle/miles-ocampo-aesthetic-instagram-filler-photos-a1213-20210325?ref=feed_1"),
    Feed("James Reid Just Posted Photos Of His P80 Million House For Sale And JaDine Hearts Are *Breaking* All Over Again", 'https://images.summitmedia-digital.com/cosmo/images/2021/10/25/james-reid-sells-house-1635139156.jpg', "https://www.cosmo.ph/entertainment/james-reid-house-photos-jadine-hearts-are-breaking-again-a254-a2520-20211025?ref=article_featured_1"),
    Feed("10 ~Shy Girl~ Poses We're Copying From Angel Secillano", 'https://images.summitmedia-digital.com/cosmo/images/2021/08/05/angel-secillano-shy-girl-poses-1628157585.jpg', "https://www.cosmo.ph/beauty/angel-secillano-shy-girl-poses-a4462-20210805?ref=feed_1"),
    Feed("PSA: You Can Now *Hide* Likes On Instagram Posts (Finally!)", 'https://images.summitmedia-digital.com/cosmo/images/2021/06/02/instagram-feature-hide-like-counts-1622594647.jpg', "https://www.cosmo.ph/lifestyle/instagram-feature-hide-likes-a704-20210602?ref=feed_1"),];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    feeds.forEach((element) {
      pages.add(PageViewModel(title: element.title,
        image: Image.network(element.image, height: 150,),
        bodyWidget: Column(
          children: [
            Column(children: [
              Align(alignment: Alignment.centerLeft, child: Text('Date', style: TextStyle(fontSize: 10)),),
              Align(alignment: Alignment.centerLeft, child: Text('Author', style: TextStyle(fontSize: 10)),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(alignment: Alignment.centerLeft, child: Text('Inquirer.net, the first news and information website in the Philippines, provides the most comprehensive and up-to-the-minute coverage of both local and international news.', style: TextStyle(fontSize: 16)),),
              ),
              TextButton(onPressed: () => _launchURL(element.link), child: Text('Read on site', style: TextStyle(fontSize: 10, color: Colors.cyan)))],),

          ],)
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            IntroductionScreen(
              globalBackgroundColor: Colors.white,
              pages: pages,
              showDoneButton: false,
              showNextButton: false,
            ),
            IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.close, color: Colors.black,))
            // Icon(Icons.close, color: Colors.red,)
          ],
        ),
      ),
    );
  }

  //todo: move to helper class/bloc
  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch link';
}
