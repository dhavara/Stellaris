import 'dart:convert';

import 'package:equatable/equatable.dart';

class ScheduleItem extends Equatable {
	final String? id;
	final String? scheduleId;
	final String? scheduleTime;
	final String? foodId;
	final String? measurement;
	final String? quantity;
	final String? createdAt;
	final String? updatedAt;

	const ScheduleItem({
		this.id, 
		this.scheduleId, 
		this.scheduleTime, 
		this.foodId, 
		this.measurement, 
		this.quantity, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory ScheduleItem.fromMap(Map<String, dynamic> data) => ScheduleItem(
				id: data['id'] as String?,
				scheduleId: data['schedule_id'] as String?,
				scheduleTime: data['schedule_time'] as String?,
				foodId: data['food_id'] as String?,
				measurement: data['measurement'] as String?,
				quantity: data['quantity'] as String?,
				createdAt: data['created_at'] as String?,
				updatedAt: data['updated_at'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'schedule_id': scheduleId,
				'schedule_time': scheduleTime,
				'food_id': foodId,
				'measurement': measurement,
				'quantity': quantity,
				'created_at': createdAt,
				'updated_at': updatedAt,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ScheduleItem].
	factory ScheduleItem.fromJson(String data) {
		return ScheduleItem.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [ScheduleItem] to a JSON string.
	String toJson() => json.encode(toMap());

	ScheduleItem copyWith({
		String? id,
		String? scheduleId,
		String? scheduleTime,
		String? foodId,
		String? measurement,
		String? quantity,
		String? createdAt,
		String? updatedAt,
	}) {
		return ScheduleItem(
			id: id ?? this.id,
			scheduleId: scheduleId ?? this.scheduleId,
			scheduleTime: scheduleTime ?? this.scheduleTime,
			foodId: foodId ?? this.foodId,
			measurement: measurement ?? this.measurement,
			quantity: quantity ?? this.quantity,
			createdAt: createdAt ?? this.createdAt,
			updatedAt: updatedAt ?? this.updatedAt,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props {
		return [
				id,
				scheduleId,
				scheduleTime,
				foodId,
				measurement,
				quantity,
				createdAt,
				updatedAt,
		];
	}
}
