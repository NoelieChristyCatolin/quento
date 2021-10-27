import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quento/home/bloc/feed_cubit.dart';
import 'package:quento/home/bloc/feed_state.dart';
import 'package:quento/home/components/feed_card.dart';
import 'package:introduction_screen/introduction_screen.dart';

class HomePage extends StatefulWidget {
  HomePage(this.title);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
