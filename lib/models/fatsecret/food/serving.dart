part of '../../models.dart';

class Serving extends Equatable {
	final String? calcium;
	final String? calories;
	final String? carbohydrate;
	final String? cholesterol;
	final String? fat;
	final String? fiber;
	final String? iron;
	final String? measurementDescription;
	final String? metricServingAmount;
	final String? metricServingUnit;
	final String? monounsaturatedFat;
	final String? numberOfUnits;
	final String? polyunsaturatedFat;
	final String? potassium;
	final String? protein;
	final String? saturatedFat;
	final String? servingDescription;
	final String? servingId;
	final String? servingUrl;
	final String? sodium;
	final String? sugar;
	final String? vitaminA;
	final String? vitaminC;

	const Serving({
		this.calcium, 
		this.calories, 
		this.carbohydrate, 
		this.cholesterol, 
		this.fat, 
		this.fiber, 
		this.iron, 
		this.measurementDescription, 
		this.metricServingAmount, 
		this.metricServingUnit, 
		this.monounsaturatedFat, 
		this.numberOfUnits, 
		this.polyunsaturatedFat, 
		this.potassium, 
		this.protein, 
		this.saturatedFat, 
		this.servingDescription, 
		this.servingId, 
		this.servingUrl, 
		this.sodium, 
		this.sugar, 
		this.vitaminA, 
		this.vitaminC, 
	});

	factory Serving.fromMap(Map<String, dynamic> data) => Serving(
				calcium: data['calcium'] as String?,
				calories: data['calories'] as String?,
				carbohydrate: data['carbohydrate'] as String?,
				cholesterol: data['cholesterol'] as String?,
				fat: data['fat'] as String?,
				fiber: data['fiber'] as String?,
				iron: data['iron'] as String?,
				measurementDescription: data['measurement_description'] as String?,
				metricServingAmount: data['metric_serving_amount'] as String?,
				metricServingUnit: data['metric_serving_unit'] as String?,
				monounsaturatedFat: data['monounsaturated_fat'] as String?,
				numberOfUnits: data['number_of_units'] as String?,
				polyunsaturatedFat: data['polyunsaturated_fat'] as String?,
				potassium: data['potassium'] as String?,
				protein: data['protein'] as String?,
				saturatedFat: data['saturated_fat'] as String?,
				servingDescription: data['serving_description'] as String?,
				servingId: data['serving_id'] as String?,
				servingUrl: data['serving_url'] as String?,
				sodium: data['sodium'] as String?,
				sugar: data['sugar'] as String?,
				vitaminA: data['vitamin_a'] as String?,
				vitaminC: data['vitamin_c'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'calcium': calcium,
				'calories': calories,
				'carbohydrate': carbohydrate,
				'cholesterol': cholesterol,
				'fat': fat,
				'fiber': fiber,
				'iron': iron,
				'measurement_description': measurementDescription,
				'metric_serving_amount': metricServingAmount,
				'metric_serving_unit': metricServingUnit,
				'monounsaturated_fat': monounsaturatedFat,
				'number_of_units': numberOfUnits,
				'polyunsaturated_fat': polyunsaturatedFat,
				'potassium': potassium,
				'protein': protein,
				'saturated_fat': saturatedFat,
				'serving_description': servingDescription,
				'serving_id': servingId,
				'serving_url': servingUrl,
				'sodium': sodium,
				'sugar': sugar,
				'vitamin_a': vitaminA,
				'vitamin_c': vitaminC,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Serving].
	factory Serving.fromJson(String data) {
		return Serving.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Serving] to a JSON string.
	String toJson() => json.encode(toMap());

	Serving copyWith({
		String? calcium,
		String? calories,
		String? carbohydrate,
		String? cholesterol,
		String? fat,
		String? fiber,
		String? iron,
		String? measurementDescription,
		String? metricServingAmount,
		String? metricServingUnit,
		String? monounsaturatedFat,
		String? numberOfUnits,
		String? polyunsaturatedFat,
		String? potassium,
		String? protein,
		String? saturatedFat,
		String? servingDescription,
		String? servingId,
		String? servingUrl,
		String? sodium,
		String? sugar,
		String? vitaminA,
		String? vitaminC,
	}) {
		return Serving(
			calcium: calcium ?? this.calcium,
			calories: calories ?? this.calories,
			carbohydrate: carbohydrate ?? this.carbohydrate,
			cholesterol: cholesterol ?? this.cholesterol,
			fat: fat ?? this.fat,
			fiber: fiber ?? this.fiber,
			iron: iron ?? this.iron,
			measurementDescription: measurementDescription ?? this.measurementDescription,
			metricServingAmount: metricServingAmount ?? this.metricServingAmount,
			metricServingUnit: metricServingUnit ?? this.metricServingUnit,
			monounsaturatedFat: monounsaturatedFat ?? this.monounsaturatedFat,
			numberOfUnits: numberOfUnits ?? this.numberOfUnits,
			polyunsaturatedFat: polyunsaturatedFat ?? this.polyunsaturatedFat,
			potassium: potassium ?? this.potassium,
			protein: protein ?? this.protein,
			saturatedFat: saturatedFat ?? this.saturatedFat,
			servingDescription: servingDescription ?? this.servingDescription,
			servingId: servingId ?? this.servingId,
			servingUrl: servingUrl ?? this.servingUrl,
			sodium: sodium ?? this.sodium,
			sugar: sugar ?? this.sugar,
			vitaminA: vitaminA ?? this.vitaminA,
			vitaminC: vitaminC ?? this.vitaminC,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props {
		return [
				calcium,
				calories,
				carbohydrate,
				cholesterol,
				fat,
				fiber,
				iron,
				measurementDescription,
				metricServingAmount,
				metricServingUnit,
				monounsaturatedFat,
				numberOfUnits,
				polyunsaturatedFat,
				potassium,
				protein,
				saturatedFat,
				servingDescription,
				servingId,
				servingUrl,
				sodium,
				sugar,
				vitaminA,
				vitaminC,
		];
	}
}
