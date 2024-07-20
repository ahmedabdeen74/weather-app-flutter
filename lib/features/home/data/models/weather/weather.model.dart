import 'package:equatable/equatable.dart';
import 'alerts.model.dart';
import 'current.model.dart';
import 'forecast.model.dart';
import 'location.model.dart';
class WeatherModel extends Equatable {

	final Location? location;
	final Current? current;
	final Forecast? forecast;
	final Alerts? alerts;

	 const WeatherModel({this.location, this.current, this.forecast, this.alerts});

	factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
				location: json['location'] == null
						? null
						: Location.fromJson(json['location'] as Map<String, dynamic>),
				current: json['current'] == null
						? null
						: Current.fromJson(json['current'] as Map<String, dynamic>),
				forecast: json['forecast'] == null
						? null
						: Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
				alerts: json['alerts'] == null
						? null
						: Alerts.fromJson(json['alerts'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'location': location?.toJson(),
				'current': current?.toJson(),
				'forecast': forecast?.toJson(),
				'alerts': alerts?.toJson(),
			};

	@override
	List<Object?> get props => [location, current, forecast, alerts];
}
