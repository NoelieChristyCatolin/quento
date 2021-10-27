import 'package:quento/home/bloc/feed_state.dart';
import 'package:quento/repository/feed_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedCubit extends Cubit<FeedState>{
  FeedCubit({required this.feedRepository}) : super(FeedState()){
    getFeeds();
    print('getFeeds');
  }

  final FeedRepository feedRepository;

  void getFeeds() async{
    emit(state.copyWith(feeds: await feedRepository.fetchFeeds()));
  }
}