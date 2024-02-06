import 'package:freezed_annotation/freezed_annotation.dart';

part 'youtube_entity.freezed.dart';

@freezed
class YoutubeEntity with _$YoutubeEntity {
  const factory YoutubeEntity({
    @JsonKey(name: "name") required String? name,
    @JsonKey(name: "key") required String? key,
    @JsonKey(name: "site") required String? site,
    @JsonKey(name: "type") required String? type,
    @JsonKey(name: "official") required bool? official,
    @JsonKey(name: "id") required String? id,
  }) = _YoutubeEntity;
}
