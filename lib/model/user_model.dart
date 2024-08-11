class UserModel{
  String? uid;
  String? name;
  String? email;
  String? password;
  String? cpassword;
  String? phone;
  UserModel({this.uid,this.name,this.email,this.password,this.cpassword,this.phone});
  //retrieving data
  factory UserModel.fromMap(map)
  {
    return UserModel(
      uid:map['uid'],
      name:map['name'],
      email:map['email'],
      password: map['password'],
      cpassword: map['cpassword'],
      phone: map['phone']
    );
  }
  //send data to server
  Map<String,dynamic> toMap(){
    return{
      'uid':uid,
      'name':name,
      'email':email,
      'password':password,
      'phone':phone
    };
  }
}// TODO Implement th