import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quento/feed_details/bloc/feed_details_cubit.dart';
import 'package:quento/home/bloc/feed_cubit.dart';
import 'package:quento/repository/feed_repository.dart';
import 'package:quento/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<FeedCubit>(
            create: (BuildContext context) => FeedCubit(feedRepository: FeedRepository())
          ),
          BlocProvider<FeedDetailsCubit>(
              create: (BuildContext context) => FeedDetailsCubit(feedRepository: FeedRepository())
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage('Quento'),
        ));
  }
}
