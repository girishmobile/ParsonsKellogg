import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class StoreBuilderModel {
  StoreBuilderModel(
      {required this.imageName,
      required this.storeName,
      required this.storeBuilder,
      required this.domainName,
      required this.customerContact,
      required this.openDate,
      required this.closeDate,
      required this.orders,
      required this.programId,
      required this.createdDate,
      required this.createdBy,
      required this.updatedDate,
      required this.updatedBy,
      required this.status})
      : storeId = uuid.v4();

  final String storeId;
  final String imageName;
  final String storeName;
  final String storeBuilder;
  final String domainName;
  final String customerContact;
  final DateTime openDate;
  final DateTime closeDate;
  final String programId;
  final int orders;
  final DateTime createdDate;
  final String createdBy;
  final DateTime updatedDate;
  final String updatedBy;
  final String status;
}

DateTime? convertStringToDate(String dateString) {
  try {
    DateFormat formate = DateFormat('dd/MM/yyyy hh:mm a');
    return formate.parse(dateString);
  } catch (e) {
    return null;
  }
}

final now = DateTime.now();
