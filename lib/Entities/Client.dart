import 'CreditCard.dart';
import 'ShippingAddress.dart';

class Client {
  int id;
  String fullname;
  String email;
  String password;
  String address;
  String phoneNumber;
  String role;
  List<ShippingAddress> shippingAdress;
  List<CreditCard> creditCard;


  Client(this.fullname, this.email, this.password, this.address,
    this.phoneNumber, this.role, this.shippingAdress, this.creditCard);


  factory Client.fromJson(dynamic json) {
    return Client(
      json['fullname'] as String,
      json['email'] as String,
      json['password'] as String,
      json['address'] as String,
      json['phoneNumber'] as String,
      json['role'] as String,
      json['shippingAdress'] as List<ShippingAddress>,
      json['creditCard'] as List<CreditCard>,
    );
  }
}