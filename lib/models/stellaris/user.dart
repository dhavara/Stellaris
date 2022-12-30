import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
	final String? id;
	final String? name;
	final String? email;
	final String? password;
	final String? image;
	final String? createdAt;
	final String? updatedAt;

	const User({
		this.id, 
		this.name, 
		this.email, 
		this.password, 
		this.image, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory User.fromMap(Map<String, dynamic> data) => User(
				id: data['id'] as String?,
				name: data['name'] as String?,
				email: data['email'] as String?,
				password: data['password'] as String?,
				image: data['image'] as String?,
				createdAt: data['created_at'] as String?,
				updatedAt: data['updated_at'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'name': name,
				'email': email,
				'password': password,
				'image': image,
				'created_at': createdAt,
				'updated_at': updatedAt,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
	factory User.fromJson(String data) {
		return User.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
	String toJson() => json.encode(toMap());

	User copyWith({
		String? id,
		String? name,
		String? email,
		String? password,
		String? image,
		String? createdAt,
		String? updatedAt,
	}) {
		return User(
			id: id ?? this.id,
			name: name ?? this.name,
			email: email ?? this.email,
			password: password ?? this.password,
			image: image ?? this.image,
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
				name,
				email,
				password,
				image,
				createdAt,
				updatedAt,
		];
	}
}
