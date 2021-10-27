import 'package:quento/feed_details/bloc/feed_details_state.dart';
import 'package:quento/repository/feed_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedDetailsCubit extends Cubit<FeedDetailsState>{
  FeedDetailsCubit({required this.feedRepository}) : super(FeedDetailsState()){
    getFeeds();
    print('FeedDetailsCubit');
  }

  final FeedRepository feedRepository;

  void getFeeds() async {
    print(feedRepository.fetchFeeds());
    emit(state.copyWith(feeds: await feedRepository.fetchFeeds()));
  }
}