part of '../../models.dart';

class Servings extends Equatable {
	final List<Serving>? serving;

	const Servings({this.serving});

	factory Servings.fromMap(Map<String, dynamic> data) => Servings(
				serving: (data['serving'] as List<dynamic>?)
						?.map((e) => Serving.fromMap(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toMap() => {
				'serving': serving?.map((e) => e.toMap()).toList(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Servings].
	factory Servings.fromJson(String data) {
		return Servings.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Servings] to a JSON string.
	String toJson() => json.encode(toMap());

	Servings copyWith({
		List<Serving>? serving,
	}) {
		return Servings(
			serving: serving ?? this.serving,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [serving];
}
