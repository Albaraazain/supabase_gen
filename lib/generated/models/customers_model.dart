
class CustomersModel {
  final String address;
  final DateTime createdAt;
  final DateTime date;
  final String? id;
  final String name;
  final String phone;
  final String referenceNumber;
  final DateTime updatedAt;

  CustomersModel({
    required this.address,
    required this.createdAt,
    required this.date,
    this.id,
    required this.name,
    required this.phone,
    required this.referenceNumber,
    required this.updatedAt,
  });

  factory CustomersModel.fromJson(Map<String, dynamic> json) {
    return CustomersModel(
      address: json['address'] ?? '',
      createdAt: DateTime.parse(json['created_at'].toString()),
      date: DateTime.parse(json['date'].toString()),
      id: json['id'],
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      referenceNumber: json['reference_number'] ?? '',
      updatedAt: DateTime.parse(json['updated_at'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['address'] = address;
    json['created_at'] = createdAt.toIso8601String();
    json['date'] = date.toIso8601String();
    if (id != null) {
      json['id'] = id;
    }
    json['name'] = name;
    json['phone'] = phone;
    json['reference_number'] = referenceNumber;
    json['updated_at'] = updatedAt.toIso8601String();
    return json;
  }

  CustomersModel copyWith({
    String? address,
    DateTime? createdAt,
    DateTime? date,
    String? id,
    String? name,
    String? phone,
    String? referenceNumber,
    DateTime? updatedAt,
  }) {
    return CustomersModel(
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      date: date ?? this.date,
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
