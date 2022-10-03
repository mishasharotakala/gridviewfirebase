import 'package:cloud_firestore/cloud_firestore.dart';

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
   );
