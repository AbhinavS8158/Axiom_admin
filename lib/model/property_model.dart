// lib/model/rent_model.dart
class Propertycardmodel {
  final String id;
  final String title;
  final String location;
  final double price;
  final int bedrooms;
  final int bathrooms;
  final List<String> imageUrl;
  final List<String> amenities;

  Propertycardmodel({
    required this.id,
    required this.title,
    required this.location,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.imageUrl,
    required this.amenities,
  });

  factory Propertycardmodel.fromMap(Map<String, dynamic> data, String documentId) {
    return Propertycardmodel(
      id: documentId,
      title: data['name'] ?? '',
      location: data['location'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      bedrooms: data['bedrooms'] ?? 0,
      bathrooms: data['bathrooms'] ?? 0,
      imageUrl: List<String>.from(data['photoPath'] ?? []),
      amenities: List<String>.from(data['amenities'] ?? []),
    );
  }
}
