
class Order {
  int? id;
  int? userId;
  int? deliveryId;
  int? workId;
  String? details;
  String? detailsAddress;
  String? lat;
  String? long;
  String? phone;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<PhotoOrder>? photoOrder;
  Work? work;

  Order(
      {this.id,
        this.userId,
        this.deliveryId,
        this.workId,
        this.details,
        this.detailsAddress,
        this.lat,
        this.long,
        this.phone,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.photoOrder,
        this.work});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    deliveryId = json['delivery_id'];
    workId = json['work_id'];
    details = json['details'];
    detailsAddress = json['details_address'];
    lat = json['lat'];
    long = json['long'];
    phone = json['phone'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['photo_order'] != null) {
      photoOrder = <PhotoOrder>[];
      json['photo_order'].forEach((v) {
        photoOrder!.add(new PhotoOrder.fromJson(v));
      });
    }
    work = json['work'] != null ? new Work.fromJson(json['work']) : null;
  }

}

class PhotoOrder {
  int? id;
  String? photo;
  int? orderId;
  String? createdAt;
  String? updatedAt;

  PhotoOrder(
      {this.id, this.photo, this.orderId, this.createdAt, this.updatedAt});

  PhotoOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    orderId = json['order_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

class Work {
  String? name;
  int? id;

  Work({this.name, this.id});

  Work.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

}