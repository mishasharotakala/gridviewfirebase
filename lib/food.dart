import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Food {
  final String name;
  final String image;

  const Food({
    required this.name,
    required this.image,
  });

  static Food fromSnapshot(DocumentSnapshot snap) {
    Food food = Food(
      name: snap['name'],
      image: snap['image'],
    );
    return food;
  }
}


/*import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  Food({required this.image, required this.name});

  Food.fromJson(Map<String, Object?> json)
    : this(
        image: json['image']! as String,
        name: json['name']! as int,
      );

  final String image;
  final int name;

  Map<String, Object?> toJson() {
    return {
      'image': image,
      'name': name,
    };
  }
}

final foodQuery = FirebaseFirestore.instance.collection('food')
  .withConverter<Food>(
     fromFirestore: (snapshot, _) => Food.fromJson(snapshot.data()!),
     toFirestore: (user, _) => user.toJson(),
   ); */

   
