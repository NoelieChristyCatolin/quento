import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quento/feed/bloc/feed_cubit.dart';
import 'package:quento/feed/bloc/feed_state.dart';
import 'package:quento/feed/components/feed_card.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen(this.title);

  final String title;

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  List<PageViewModel> pages = [];
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedCubit, FeedState>(
      builder: (BuildContext context, FeedState state) => Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: ListView.builder(
              itemCount: state.feeds.length,
              itemBuilder: (context, index) => FeedCard(
                state.feeds[index].title,
                state.feeds[index].image,
              ))
      ));
  }
}
