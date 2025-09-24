class ShippingAddressModel {
  final String id;
  final String fullname;
  final String address;
  final String city;
  final String stateProvince;
  final String zipCode;
  final String country;
  final bool isActive;

  ShippingAddressModel({
    required this.id,
    required this.fullname,
    required this.address,
    required this.city,
    required this.stateProvince,
    required this.zipCode,
    required this.country,
    this.isActive = false,
  });

  factory ShippingAddressModel.fromMap(
    Map<String, dynamic> data,
    String documintId,
  ) {
    return ShippingAddressModel(
      id: data['id'],
      fullname: data['fullname'],
      address: data['address'],
      city: data['city'],
      stateProvince: data['stateProvince'],
      zipCode: data['zipCode'],
      country: data['country'],
      isActive: data['isActive'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullname,
      'address': address,
      'city': city,
      'stateProvince': stateProvince,
      'zipCode': zipCode,
      'country': country,
      'isActive': isActive,
    };
  }

  ShippingAddressModel copyWith({
    String? id,
    String? fullname,
    String? address,
    String? city,
    String? stateProvince,
    String? zipCode,
    String? country,
    bool? isActive,
  }) {
    return ShippingAddressModel(
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      address: address ?? this.address,
      city: city ?? this.city,
      stateProvince: stateProvince ?? this.stateProvince,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
    );
  }
}
