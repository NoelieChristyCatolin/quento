import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quento/feed_details/bloc/feed_details_cubit.dart';
import 'package:quento/feed_details/bloc/feed_details_state.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedDetailsScreen extends StatefulWidget {

  @override
  _FeedDetailsScreenState createState() => _FeedDetailsScreenState();
}

class _FeedDetailsScreenState extends State<FeedDetailsScreen> {
  List<PageViewModel> pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedDetailsCubit, FeedDetailsState>(
        builder: (BuildContext context, FeedDetailsState state) {
          if(state.feeds.isNotEmpty){
            state.feeds.forEach((element) {
              pages.add(PageViewModel(title: element.title,
                  image: Image.network(element.image, height: 150,),
                  bodyWidget: Column(
                    children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(alignment: Alignment.centerLeft, child: Text('Date: ${element.date}', style: TextStyle(fontSize: 12)),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(alignment: Alignment.centerLeft, child: Text('Author: ${element.author}', style: TextStyle(fontSize: 12)),),
                        ),
                        Align(alignment: Alignment.centerLeft,
                          child: Html(data: element.description,
                            style: {
                              'h1': Style(fontSize: FontSize.large, fontWeight: FontWeight.normal),
                              'p': Style(display: Display.NONE)
                            },),),
                        TextButton(onPressed: () => _launchURL(element.link), child: Text('Read on site', style: TextStyle(fontSize: 14, color: Colors.cyan)))],),

                    ],)
              ));
            });
          }
        return Scaffold(
            backgroundColor: Colors.white,
            body: state.feeds.isNotEmpty
                ? SafeArea(
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
            )
                : Container()
        );
        });
  }

  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch link';
}
