import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class StoresModel {
  StoresModel({
    required this.imageName,
    required this.storeName,
    required this.storeType,
    required this.numOfProduct,
    required this.createdDate,
    required this.createdBy,
    this.updatedBy,
    this.updatedDate,
    required this.status,
    required this.action,
  }) : id = uuid.v4();

  final String id;
  final String imageName;
  final String storeName;
  final String storeType;
  final int numOfProduct;
  final DateTime createdDate;
  final String createdBy;
  final DateTime? updatedDate;
  final String? updatedBy;
  final String status;
  final String action;
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
List<StoresModel> dummystoresList = [
  StoresModel(
    imageName: 'imageName',
    storeName: 'Corporate Gear',
    storeType: 'eCommerce Store',
    numOfProduct: 15600,
    createdDate: convertStringToDate('01/08/2024 10:30 AM') ?? now,
    createdBy: 'Vishal Patel',
    updatedDate: convertStringToDate('22/10/2024 11:45 AM') ?? now,
    updatedBy: 'Alpesh Prajapati',
    status: 'Active',
    action: 'Configure Store',
  ),
  StoresModel(
    imageName: 'imageName',
    storeName: 'PK Health Gear',
    storeType: 'eCommerce Store',
    numOfProduct: 2136,
    createdDate: convertStringToDate('12/08/2024 03:45 PM') ?? now,
    createdBy: 'Vishal Patel',
    updatedDate: convertStringToDate('19/10/2024 11:45 AM') ?? now,
    updatedBy: 'Alpesh Prajapati',
    status: 'Active',
    action: 'Configure Store',
  ),
  StoresModel(
    imageName: 'imageName',
    storeName: 'Driving Impressions',
    storeType: 'eCommerce Store',
    numOfProduct: 3122,
    createdDate: convertStringToDate('05/09/2024 07:50 AM') ?? now,
    createdBy: 'Vishal Patel',
    updatedDate: convertStringToDate('30/09/2024 02:00 PM') ?? now,
    updatedBy: 'Alpesh Prajapati',
    status: 'Active',
    action: 'Configure Store',
  ),
  StoresModel(
    imageName: 'imageName',
    storeName: 'Peter Millar Corporate Gear',
    storeType: 'eCommerce Store',
    numOfProduct: 802,
    createdDate: convertStringToDate('22/08/2024 11:20 AM') ?? now,
    createdBy: 'Vishal Patel',
    //updatedDate: convertStringToDate('17/09/2024 05:30 PM') ?? now,
    //updatedBy: 'Alpesh Prajapati',
    status: 'Active',
    action: 'Configure Store',
  ),
  StoresModel(
    imageName: 'imageName',
    storeName: 'Boston Beer',
    storeType: 'Corporate Store',
    numOfProduct: 519,
    createdDate: convertStringToDate('02/10/2024 11:45 AM') ?? now,
    createdBy: 'Vishal Patel',
    updatedDate: convertStringToDate('25/10/2024 11:45 AM') ?? now,
    updatedBy: 'Beta1 User',
    status: 'Active',
    action: 'Configure Store',
  ),
  StoresModel(
    imageName: 'imageName',
    storeName: 'Bacardi Grey Goose',
    storeType: 'Corporate Store',
    numOfProduct: 44,
    createdDate: convertStringToDate('13/04/2024 11:45 AM') ?? now,
    createdBy: 'Vishal Patel',
    updatedDate: convertStringToDate('17/08/2024 11:45 AM') ?? now,
    updatedBy: 'Alpesh Prajapati',
    status: 'Active',
    action: 'Configure Store',
  ),
  StoresModel(
    imageName: 'imageName',
    storeName: 'Cyxtera',
    storeType: 'Corporate Store',
    numOfProduct: 67,
    createdDate: convertStringToDate('20/10/2024 11:45 AM') ?? now,
    createdBy: 'Vishal Patel',
    updatedDate: convertStringToDate('29/10/2024 11:45 AM') ?? now,
    updatedBy: 'Alpesh Prajapati',
    status: 'InActive',
    action: 'Configure Store',
  ),
  StoresModel(
    imageName: 'imageName',
    storeName: 'SimpliSafe',
    storeType: 'Corporate Store',
    numOfProduct: 39,
    createdDate: convertStringToDate('30/10/2024 11:45 AM') ?? now,
    createdBy: 'Vishal Patel',
    // updatedDate: convertStringToDate('04/11/2024 11:45 AM') ?? now,
    // updatedBy: 'Divyesh Shah',
    status: 'Draft',
    action: 'Configure Store',
  ),
  StoresModel(
    imageName: 'imageName',
    storeName: 'The Home Depot',
    storeType: 'Corporate Store',
    numOfProduct: 29,
    createdDate: convertStringToDate('31/10/2024 11:45 AM') ?? now,
    createdBy: 'Vishal Patel',
    updatedDate: convertStringToDate('08/11/2024 11:45 AM') ?? now,
    updatedBy: 'Vipul Solanki',
    status: 'Active',
    action: 'Configure Store',
  ),
  StoresModel(
    imageName: 'imageName',
    storeName: 'Uniti',
    storeType: 'Corporate Store',
    numOfProduct: 75,
    createdDate: convertStringToDate('15/07/2024 11:45 AM') ?? now,
    createdBy: 'Vishal Patel',
    updatedDate: convertStringToDate('28/07/2024 11:45 AM') ?? now,
    updatedBy: 'Ankit User2',
    status: 'Active',
    action: 'Configure Store',
  ),
  StoresModel(
    imageName: 'imageName',
    storeName: 'Usaa Alpha Healthy Points',
    storeType: 'Corporate Store',
    numOfProduct: 2,
    createdDate: convertStringToDate('04/09/2024 11:45 AM') ?? now,
    createdBy: 'Vishal Patel',
    updatedDate: convertStringToDate('12/09/2024 11:45 AM') ?? now,
    updatedBy: 'Tejas Daftary',
    status: 'Active',
    action: 'Configure Store',
  ),
  StoresModel(
    imageName: 'imageName',
    storeName: 'Usaa Healthy Points',
    storeType: 'Corporate Store',
    numOfProduct: 87,
    createdDate: convertStringToDate('06/11/2024 11:45 AM') ?? now,
    createdBy: 'Vishal Patel',
    updatedDate: convertStringToDate('21/11/2024 11:45 AM') ?? now,
    updatedBy: 'Tejas Daftary',
    status: 'Active',
    action: 'Configure Store',
  ),
  StoresModel(
    imageName: 'imageName',
    storeName: 'Usaa Claims Apparel',
    storeType: 'Corporate Store',
    numOfProduct: 87,
    createdDate: convertStringToDate('23/06/2024 11:45 AM') ?? now,
    createdBy: 'Vishal Patel',
    //updatedDate: convertStringToDate('18/09/2024 11:45 AM') ?? now,
    //updatedBy: 'Tejas Daftary',
    status: 'Active',
    action: 'Configure Store',
  ),
  StoresModel(
    imageName: 'imageName',
    storeName: 'Usaa Punchout',
    storeType: 'Corporate Store',
    numOfProduct: 87,
    createdDate: convertStringToDate('18/07/2024 11:45 AM') ?? now,
    createdBy: 'Robin hood',
    updatedDate: convertStringToDate('30/08/2024 11:45 AM') ?? now,
    updatedBy: 'Vipul Solanki',
    status: 'Active',
    action: 'Configure Store',
  ),
];

class StorefilterModel {
  StorefilterModel({required this.title, required this.filterItems});

  final String title;
  final List<String> filterItems;
}

final List<StorefilterModel> dummyStorefilterItems = [
  StorefilterModel(title: 'Name', filterItems: [
    '100th Anni Book - Miss or',
    '100th Anni Book Golden eg',
    '100th Anni Book Opt in',
    '100th Anni-Opt Gold',
    '12Form1',
    '2023 USAA Intern welcome',
    '24 On Tour',
    '24ontour',
    'A Complimentary HubSpot',
    'Algonquin Men\'s Soccer 2023'
  ]),
  StorefilterModel(title: 'Store Type', filterItems: [
    'Corporate Store',
    'Ecommerce Store',
    'Store Builder',
    'Form Builder'
  ]),
  StorefilterModel(title: 'Created Date', filterItems: ['createdDate']),
  StorefilterModel(title: 'Updated Date', filterItems: ['updatedDate']),
  StorefilterModel(
      title: 'Status', filterItems: ['Active', 'Inactive', 'Draft', 'Staging']),
];
