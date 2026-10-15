import 'package:collection/collection.dart';

class SentimentStats {
  double? negative;
  double? neutral;
  double? positive;

  SentimentStats({this.negative, this.neutral, this.positive});

  factory SentimentStats.fromJson(Map<String, dynamic> json) {
    return SentimentStats(
      negative: (json['negative'] as num?)?.toDouble(),
      neutral: (json['neutral'] as num?)?.toDouble(),
      positive: (json['positive'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'negative': negative,
    'neutral': neutral,
    'positive': positive,
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SentimentStats) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => negative.hashCode ^ neutral.hashCode ^ positive.hashCode;
}
