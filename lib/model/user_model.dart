class UserModel {
  String? name, id, email, image;
  UserModel({
 this.id,
    this.name,
    this.email,
    this.image 
  });
  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
  id = map['id'] ;
  name = map['name'] ;
  email = map['email'] ;
  image = map['image'];
  }
  toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
    };
  }
}
