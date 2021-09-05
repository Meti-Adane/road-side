class Order{
  String Id;
  String UserId;
  String GarageId;
  //String Status;
  String CompletedDate;
  String ServiceType;

  Order({
    required this.Id,
    required this.UserId,
    required this.GarageId,
    required this.CompletedDate,
    required this.ServiceType,
  });
}