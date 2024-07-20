import 'package:equatable/equatable.dart';
import 'package:weather_app/core/utils/function/weather_condition_image.dart';

class Condition extends Equatable {
	final String? text;
	final String? icon;
	final int? code;

	const Condition({this.text, this.icon, this.code});
	factory Condition.fromJson(Map<String, dynamic> json) => Condition(
				text: json['text'] as String?,
				icon: weatherConditionImage(json['text']),
				code: json['code'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'text': text,
				'icon': icon,
				'code': code,
			};

	@override
	List<Object?> get props => [text, icon, code];
}
