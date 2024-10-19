import 'package:cloud_firestore/cloud_firestore.dart';

class BookingDetails {
  String carMake;
  String carModel;
  String carYear;
  String carRegistrationPlate;
  String customerName;
  String customerEmail;
  String customerPhone;
  String bookingTitle;
  DateTime startDate;
  DateTime endDate;
  String mechanic;
  DateTime? createdAt;

  // Constructor
  BookingDetails({
    required this.carMake,
    required this.carModel,
    required this.carYear,
    required this.carRegistrationPlate,
    required this.customerName,
    required this.customerEmail,
    required this.customerPhone,
    required this.bookingTitle,
    required this.startDate,
    required this.endDate,
    required this.mechanic,
    this.createdAt,
  });

  // Factory method to create an instance from a Firestore document (fromJson)
  factory BookingDetails.fromJson(Map<String, dynamic> json) {
    return BookingDetails(
      carMake: json['carMake'] as String,
      carModel: json['carModel'] as String,
      carYear: json['carYear'] as String,
      carRegistrationPlate: json['carRegistrationPlate'] as String,
      customerName: json['customerName'] as String,
      customerEmail: json['customerEmail'] as String,
      customerPhone: json['customerPhone'] as String,
      bookingTitle: json['bookingTitle'] as String,
      startDate: json['startDate'] is Timestamp
          ? (json['startDate'] as Timestamp).toDate()
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] is Timestamp
          ? (json['endDate'] as Timestamp).toDate()
          : DateTime.parse(json['endDate'] as String),
      mechanic: json['mechanic'] as String,
      createdAt: json['createdAt'] != null && json['createdAt'] is Timestamp
          ? (json['createdAt'] as Timestamp).toDate()
          : json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
    );
  }

  // Method to convert an instance into a map for Firestore (toJson)
  Map<String, dynamic> toJson() {
    return {
      'carMake': carMake.trim(),
      'carModel': carModel.trim(),
      'carYear': carYear.trim(),
      'carRegistrationPlate': carRegistrationPlate.trim(),
      'customerName': customerName.trim(),
      'customerEmail': customerEmail.trim(),
      'customerPhone': customerPhone.trim(),
      'bookingTitle': bookingTitle.trim(),
      'startDate':
          startDate, // Firestore will automatically convert DateTime to Timestamp
      'endDate': endDate,
      'mechanic': mechanic,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue
              .serverTimestamp(), // Use server timestamp if not provided
    };
  }
}
