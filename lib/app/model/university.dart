class University {
  int? id;
  String? fullName;
  String? name;
  String? ibge;
  String? city;
  String? uf;
  String? zipcode;
  String? street;
  String? number;
  String? neighborhood;
  String? phone;
  String? createdAt;
  String? updatedAt;

  University(
      {this.id,
        this.fullName,
        this.name,
        this.ibge,
        this.city,
        this.uf,
        this.zipcode,
        this.street,
        this.number,
        this.neighborhood,
        this.phone,
        this.createdAt,
        this.updatedAt});

  University.fromJson(Map<String, dynamic>? json) {
    id = json?['id'] ?? -1;
    fullName = json?['full_name'] ?? '';
    name = json?['name'] ?? '';
    ibge = json?['ibge'] ?? '';
    city = json?['city'] ?? '';
    uf = json?['uf'] ?? '';
    zipcode = json?['zipcode'] ?? '';
    street = json?['street'] ?? '';
    number = json?['number'] ?? '';
    neighborhood = json?['neighborhood'] ?? '';
    phone = json?['phone'] ?? '';
    createdAt = json?['created_at'] ?? '';
    updatedAt = json?['updated_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['name'] = name;
    data['ibge'] = ibge;
    data['city'] = city;
    data['uf'] = uf;
    data['zipcode'] = zipcode;
    data['street'] = street;
    data['number'] = number;
    data['neighborhood'] = neighborhood;
    data['phone'] = phone;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
