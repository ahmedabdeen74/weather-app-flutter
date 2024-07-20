import 'package:equatable/equatable.dart';

class Alerts extends Equatable {
	final List<dynamic>? alert;

	const Alerts({this.alert});

	factory Alerts.fromJson(Map<String, dynamic> json) => Alerts(
				alert: json['alert'] as List<dynamic>?,
			);

	Map<String, dynamic> toJson() => {
				'alert': alert,
			};

	@override
	List<Object?> get props => [alert];
}
