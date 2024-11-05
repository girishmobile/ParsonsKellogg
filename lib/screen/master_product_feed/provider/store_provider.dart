import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:parsonskellogg/screen/master_product_feed/model/stores_model.dart';

class StoreProvider extends ChangeNotifier {
  final List<StoresModel> _storeList = dummystoresList;
  List<StoresModel> _filteredStores = [];
  List<StoresModel> get storeList => _storeList;
  String _searchTerm = ''; // New variable for search

  List<StoresModel> get stores {
    return _filteredStores.where((store) {
      final matchesSearch =
          store.storeName.toLowerCase().contains(_searchTerm.toLowerCase());
      return matchesSearch;
    }).toList();
  }

// Constructor to initialize filtered products
  StoreProvider() {
    _filteredStores = _storeList;
  }

  bool _sortAscending = false;
  bool _sortAstoreType = false;
  bool _sortAsceCount = false;
  bool _sortAsceCreated = false;
  bool _sortAsceCreateName = false;
  bool _sortAsceUpdated = false;
  bool _sortAsceUpdateName = false;
  bool _sortStatusAscending = false;

  bool get sortAscending => _sortAscending;
  bool get sortAstoreType => _sortAstoreType;
  bool get sortAsceCount => _sortAsceCount;
  bool get sortAsceCreated => _sortAsceCreated;
  bool get sortAsceCreateName => _sortAsceCreateName;
  bool get sortAsceUpdated => _sortAsceUpdated;
  bool get sortAsceUpdateName => _sortAsceUpdateName;
  bool get sortStatusAscending => _sortStatusAscending;

  void searchByProductName(String text) {
    _searchTerm = text;
    notifyListeners();
  }

  void sortByName() {
    _storeList.sort((a, b) => _sortAscending
        ? a.storeName.compareTo(b.storeName)
        : b.storeName.compareTo(a.storeName));
    _sortAscending = !_sortAscending;
    notifyListeners();
  }

  void sortByStoreName() {
    _storeList.sort((a, b) => _sortAstoreType
        ? a.storeType.compareTo(b.storeType)
        : b.storeType.compareTo(a.storeType));
    _sortAstoreType = !_sortAstoreType;
    notifyListeners();
  }

  void sortByNumberOfProducts() {
    _storeList.sort((a, b) => _sortAsceCount
        ? a.numOfProduct.compareTo(b.numOfProduct)
        : b.numOfProduct.compareTo(a.numOfProduct));
    _sortAsceCount = !_sortAsceCount;
    notifyListeners();
  }

  void sortByCreatedDate() {
    _storeList.sort((a, b) => _sortAsceCreated
        ? a.createdDate.compareTo(b.createdDate)
        : b.createdDate.compareTo(a.createdDate));
    _sortAsceCreated = !_sortAsceCreated;
    notifyListeners();
  }

  void sortByCreateName() {
    _storeList.sort((a, b) => _sortAsceCreateName
        ? a.createdBy.compareTo(b.createdBy)
        : b.createdBy.compareTo(a.createdBy));
    _sortAsceCreateName = !_sortAsceCreateName;
    notifyListeners();
  }

  void sortByUpdatedDate() {
    _storeList.sort((a, b) {
      if (a.updatedDate == null && b.updatedDate == null) {
        return 0;
      } else if (a.updatedDate == null) {
        return 1;
      } else if (b.updatedDate == null) {
        return -1;
      } else {
        return _sortAsceUpdated
            ? a.updatedDate!.compareTo(b.updatedDate!)
            : b.updatedDate!.compareTo(a.updatedDate!);
      }
    });
    _sortAsceUpdated = !_sortAsceUpdated;
    notifyListeners();
  }

  void sortByUpdatedName() {
    _storeList.sort(
      (a, b) {
        if (a.updatedBy == null && b.updatedBy == null) {
          return 0;
        } else if (a.updatedBy == null) {
          return 1;
        } else if (b.updatedBy == null) {
          return -1;
        } else {
          return _sortAsceUpdateName
              ? a.updatedBy!.compareTo(b.updatedBy!)
              : b.updatedBy!.compareTo(a.updatedBy!);
        }
      },
    );
    _sortAsceUpdateName = !_sortAsceUpdateName;
    notifyListeners();
  }

  void sortByStatus() {
    storeList.sort(
      (a, b) => _sortStatusAscending
          ? a.status.compareTo(b.status)
          : b.status.compareTo(a.status),
    );
    _sortStatusAscending = !_sortStatusAscending;
    notifyListeners();
  }
}
