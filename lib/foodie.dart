import 'package:flutterfire_ui/firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gridviewfirebase/food.dart';

class Foodie extends StatefulWidget {
  const Foodie({super.key});

  @override
  State<Foodie> createState() => _FoodieState();
}

class _FoodieState extends State<Foodie> {
  final _foodStream =
      FirebaseFirestore.instance.collection('food').orderBy('name');
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildGridView());
  }

  Widget _buildGridView() {
    return FirestoreQueryBuilder<Map<String, dynamic>>(
      query: _foodStream,
      builder: (context, snapshot, _) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
    
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: snapshot.docs.length,
          itemBuilder: (context, index) {
            final food = snapshot.docs[index];
            return Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          food['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(food['name']),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }


}
          /*return GridView.builder(
            itemCount: snapshot.data.docs.map((document),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ), 
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(
                            uploadingData(_image, _name)[index],
                ),
                fit: BoxFit.fill,
                    );
                  }),) */
