import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quento/models/feed.dart';

part 'feed_details_state.freezed.dart';

@freezed
class FeedDetailsState with _$FeedDetailsState{

  factory FeedDetailsState({@Default([]) List<Feed> feeds}) = _FeedDetailsState;

}

