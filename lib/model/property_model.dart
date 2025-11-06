class Property {
  final String id;
  final String title;
  final String location;
  final String price;
  final String type;
  final String bedrooms;
  final String bathrooms;
  final String email;
  final String status;
  final List<String> imageUrl;
  final String phone;
  final String about;

  Property({
    required this.id,
    required this.title,
    required this.location,
    required this.price,
    required this.type,
    required this.bedrooms,
    required this.bathrooms,
    required this.email,
    required this.status,
    required this.imageUrl,
    required this.phone,
    required this.about,
  });

  factory Property.fromMap(Map<String, dynamic> data, String documentId) {
    return Property(
      id: documentId,
      title: data['name'] ?? '',
      location: data['location'] ?? '',
      price: data['amount']?.toString() ?? '',
      type: data['propertyType'] ?? '',
      bedrooms: data['bedroom']?.toString() ?? '0',
      bathrooms: data['bathroom']?.toString() ?? '0',
      email: data['email'] ?? '',
      status: data['status'] ?? '',
      imageUrl: data['photoPath'] != null && data['photoPath'] is List
          ? List<String>.from(data['photoPath'])
          : [],
      phone: data['phoneNumber'] ?? '',
      about: data['about'] ?? '',
    );
  }
}
