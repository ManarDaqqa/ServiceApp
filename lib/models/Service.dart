class Service {
  int? id;
  String? name;
  String? icon;
  String? description;
  int? active;
  String? createdAt;
  String? updatedAt;

  Service(
      {this.id,
        this.name,
        this.icon,
        this.description,
        this.active,
        this.createdAt,
        this.updatedAt});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    description = json['description'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}