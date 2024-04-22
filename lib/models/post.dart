import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String origin;
  final String destination;
  final String travelDate;
  final String availableWeight;

  Post({
    required this.origin,
    required this.destination,
    required this.travelDate,
    required this.availableWeight,
  });

  factory Post.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Post(
      origin: data['origin'],
      destination: data['destination'],
      travelDate: data['travelDate'],
      availableWeight: data['availableWeight'],
    );
  }
}
