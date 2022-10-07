import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Carousel extends Equatable {
  final String name;
  final String image;

  const Carousel({
    required this.name,
    required this.image,
  });

  @override 
  List<Object?> get props => [
    name,
    image,
  ];

  static Carousel fromSnapshot(DocumentSnapshot snap) {
    Carousel carousel = Carousel(
      name: snap['name'],
      image: snap['image'],
    );
    return carousel;
  }
}