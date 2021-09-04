class User {
  String Id;
  String FirstName;
  String LastName;
  String Username;
  String
      EmailAddress; //TODO - Check for EmailAddress Integrity and json endpoint correctness
  String PhoneNumber;
  String Role;
  List OrderHistory;
  List OngoingServices;
  List Favorites;

  //List Ratings;
  //List Reviews;

  User({
    required this.Id,
    required this.FirstName,
    required this.LastName,
    required this.Username,
    required this.EmailAddress,
    required this.PhoneNumber,
    required this.Role,
    required this.OrderHistory,
    required this.OngoingServices,
    required this.Favorites,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      Id: json['id'],
      FirstName: json['first_name'],
      LastName: json['last_name'],
      Username: json['username'],
      EmailAddress: json['email_address'],
      PhoneNumber: json['phone_number'],
      Role: json['role'],
      OrderHistory: json['order_history'],
      OngoingServices: json['ongoing_services'],
      Favorites: json['favorites'],
    );
  }
}
