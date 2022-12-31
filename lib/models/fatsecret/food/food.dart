part of '../../models.dart';

class Food extends Equatable {
	final String? foodId;
	final String? foodName;
	final String? foodType;
	final String? foodUrl;
	final Servings? servings;

	const Food({
		this.foodId, 
		this.foodName, 
		this.foodType, 
		this.foodUrl, 
		this.servings, 
	});

	factory Food.fromMap(Map<String, dynamic> data) => Food(
				foodId: data['food_id'] as String?,
				foodName: data['food_name'] as String?,
				foodType: data['food_type'] as String?,
				foodUrl: data['food_url'] as String?,
				servings: data['servings'] == null
						? null
						: Servings.fromMap(data['servings'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'food_id': foodId,
				'food_name': foodName,
				'food_type': foodType,
				'food_url': foodUrl,
				'servings': servings?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Food].
	factory Food.fromJson(String data) {
		return Food.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Food] to a JSON string.
	String toJson() => json.encode(toMap());

	Food copyWith({
		String? foodId,
		String? foodName,
		String? foodType,
		String? foodUrl,
		Servings? servings,
	}) {
		return Food(
			foodId: foodId ?? this.foodId,
			foodName: foodName ?? this.foodName,
			foodType: foodType ?? this.foodType,
			foodUrl: foodUrl ?? this.foodUrl,
			servings: servings ?? this.servings,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props {
		return [
				foodId,
				foodName,
				foodType,
				foodUrl,
				servings,
		];
	}
}
