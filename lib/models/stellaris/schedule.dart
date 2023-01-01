import 'dart:convert';

import 'package:equatable/equatable.dart';

class Schedule extends Equatable {
	final String? id;
	final String? userId;
	final String? scheduleDate;
	final String? createdAt;
	final String? updatedAt;

	const Schedule({
		this.id, 
		this.userId, 
		this.scheduleDate, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Schedule.fromMap(Map<String, dynamic> data) => Schedule(
				id: data['id'] as String?,
				userId: data['user_id'] as String?,
				scheduleDate: data['schedule_date'] as String?,
				createdAt: data['created_at'] as String?,
				updatedAt: data['updated_at'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'user_id': userId,
				'schedule_date': scheduleDate,
				'created_at': createdAt,
				'updated_at': updatedAt,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Schedule].
	factory Schedule.fromJson(String data) {
		return Schedule.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Schedule] to a JSON string.
	String toJson() => json.encode(toMap());

	Schedule copyWith({
		String? id,
		String? userId,
		String? scheduleDate,
		String? createdAt,
		String? updatedAt,
	}) {
		return Schedule(
			id: id ?? this.id,
			userId: userId ?? this.userId,
			scheduleDate: scheduleDate ?? this.scheduleDate,
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
				userId,
				scheduleDate,
				createdAt,
				updatedAt,
		];
	}
}
