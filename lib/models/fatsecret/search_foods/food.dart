part of '../../models.dart';

class SearchFood extends Equatable {
	final String? brandName;
	final String? foodDescription;
	final String? foodId;
	final String? foodName;
	final String? foodType;
	final String? foodUrl;

	const SearchFood({
		this.brandName, 
		this.foodDescription, 
		this.foodId, 
		this.foodName, 
		this.foodType, 
		this.foodUrl, 
	});

	factory SearchFood.fromMap(Map<String, dynamic> data) => SearchFood(
				brandName: data['brand_name'] as String?,
				foodDescription: data['food_description'] as String?,
				foodId: data['food_id'] as String?,
				foodName: data['food_name'] as String?,
				foodType: data['food_type'] as String?,
				foodUrl: data['food_url'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'brand_name': brandName,
				'food_description': foodDescription,
				'food_id': foodId,
				'food_name': foodName,
				'food_type': foodType,
				'food_url': foodUrl,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SearchFood].
	factory SearchFood.fromJson(String data) {
		return SearchFood.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [SearchFood] to a JSON string.
	String toJson() => json.encode(toMap());

	SearchFood copyWith({
		String? brandName,
		String? foodDescription,
		String? foodId,
		String? foodName,
		String? foodType,
		String? foodUrl,
	}) {
		return SearchFood(
			brandName: brandName ?? this.brandName,
			foodDescription: foodDescription ?? this.foodDescription,
			foodId: foodId ?? this.foodId,
			foodName: foodName ?? this.foodName,
			foodType: foodType ?? this.foodType,
			foodUrl: foodUrl ?? this.foodUrl,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props {
		return [
				brandName,
				foodDescription,
				foodId,
				foodName,
				foodType,
				foodUrl,
		];
	}
}
