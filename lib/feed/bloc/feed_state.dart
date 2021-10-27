import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quento/models/feed.dart';

part 'feed_state.freezed.dart';

@freezed
class FeedState with _$FeedState{

  factory FeedState({@Default([]) List<Feed> feeds}) = _FeedState;

}

