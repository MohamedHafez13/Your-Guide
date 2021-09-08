class UserModel {
 late String name;
 late String email;
 late String password;
 late String phone;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });
  UserModel.fromJson(Map<String,dynamic>json)
  {
    name =json['name'];
    email =json['email'];
    password =json['password'];
    phone =json['phone'];
  }
  
  Map<String,dynamic> toJson(){
    return{
      'name':name,
      'email':email,
      'password':password,
      'phone':phone,
    };
  }
}
