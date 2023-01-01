import 'dart:convert';

import 'package:equatable/equatable.dart';

class CalculateHistory extends Equatable {
	final String? id;
	final String? userId;
	final String? age;
	final String? gender;
	final String? height;
	final String? weight;
	final String? activity;
	final String? calorie;
	final String? createdAt;
	final String? updatedAt;

	const CalculateHistory({
		this.id, 
		this.userId, 
		this.age, 
		this.gender, 
		this.height, 
		this.weight, 
		this.activity, 
		this.calorie, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory CalculateHistory.fromMap(Map<String, dynamic> data) {
		return CalculateHistory(
			id: data['id'] as String?,
			userId: data['user_id'] as String?,
			age: data['age'] as String?,
			gender: data['gender'] as String?,
			height: data['height'] as String?,
			weight: data['weight'] as String?,
			activity: data['activity'] as String?,
			calorie: data['calorie'] as String?,
			createdAt: data['created_at'] as String?,
			updatedAt: data['updated_at'] as String?,
		);
	}



	Map<String, dynamic> toMap() => {
				'id': id,
				'user_id': userId,
				'age': age,
				'gender': gender,
				'height': height,
				'weight': weight,
				'activity': activity,
				'calorie': calorie,
				'created_at': createdAt,
				'updated_at': updatedAt,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CalculateHistory].
	factory CalculateHistory.fromJson(String data) {
		return CalculateHistory.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [CalculateHistory] to a JSON string.
	String toJson() => json.encode(toMap());

	CalculateHistory copyWith({
		String? id,
		String? userId,
		String? age,
		String? gender,
		String? height,
		String? weight,
		String? activity,
		String? calorie,
		String? createdAt,
		String? updatedAt,
	}) {
		return CalculateHistory(
			id: id ?? this.id,
			userId: userId ?? this.userId,
			age: age ?? this.age,
			gender: gender ?? this.gender,
			height: height ?? this.height,
			weight: weight ?? this.weight,
			activity: activity ?? this.activity,
			calorie: calorie ?? this.calorie,
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
				age,
				gender,
				height,
				weight,
				activity,
				calorie,
				createdAt,
				updatedAt,
		];
	}
}
