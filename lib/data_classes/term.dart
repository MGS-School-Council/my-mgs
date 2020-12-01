import 'package:json_annotation/json_annotation.dart';

part 'term.g.dart';

@JsonSerializable()
class Term {
  @JsonKey(nullable: false)
  int startWeek;
  @JsonKey(nullable: false)
  int endWeek;

  @JsonKey(nullable: true)
  int cateringWeek;

  Term();
  factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);
  Map<String, dynamic> toJson() => _$TermToJson(this);
}