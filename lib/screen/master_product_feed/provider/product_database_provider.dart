import 'package:flutter/material.dart';
import 'package:parsonskellogg/screen/master_product_feed/model/filter_product_model.dart';
import 'package:parsonskellogg/screen/master_product_feed/model/product_database_model.dart';

class ProductDatabaseProvider extends ChangeNotifier {
  final List<ProductDatabaseModel> _productList = dummyProductList;
  final TextEditingController _searchController = TextEditingController();

  final List<List<bool>> _checkboxStates = List.generate(filterItems.length,
      (i) => List.filled(filterItems[i].details.length, false));

  List<ProductDatabaseModel> _filteredProducts = [];
  String _currentFilter = 'All';
  String _searchTerm = ''; // New variable for search
  List<List<bool>> get checkboxStates => _checkboxStates;

  TextEditingController get searchController => _searchController;

  List<ProductDatabaseModel> get products {
    return _filteredProducts.where((product) {
      final matchesFilter =
          _currentFilter == 'All' || product.status == _currentFilter;
      final matchesSearch =
          product.productName.toLowerCase().contains(_searchTerm.toLowerCase());
      return matchesFilter && matchesSearch;
    }).toList();
  }

// Constructor to initialize filtered products
  ProductDatabaseProvider() {
    _filteredProducts = _productList;
  }
  bool _sortAscending = true;
  bool _sortBrandAscending = true;
  bool _sortVendorAscending = true;
  bool _sortOurCostAscending = true;
  bool _sortSalePriceAscend = true;
  bool _sortCreatedDateAsce = true;
  bool _sortCreatedByAsce = true;
  bool _sortUpdatedDateAsce = true;
  bool _sortUpdatedNameAsce = true;
  bool _sortStatusAscending = true;
//for ToggleButton
  int _selectedIndex = 0;
  bool get sortAscending => _sortAscending;
  bool get sortBrandAscending => _sortBrandAscending;
  bool get sortVendorAscending => _sortVendorAscending;
  bool get sortOurCostAscending => _sortOurCostAscending;
  bool get sortSalePriceAscend => _sortSalePriceAscend;
  bool get sortCreatedDateAsce => _sortCreatedDateAsce;
  bool get sortCreatedByAsce => _sortCreatedByAsce;
  bool get sortUpdatedNameAsce => _sortUpdatedNameAsce;
  bool get sortUpdatedDateAsce => _sortUpdatedDateAsce;
  bool get sortStatusAscending => _sortStatusAscending;

  int get selectedIndex => _selectedIndex;

  void toggleSelection(int index) {
    _selectedIndex = index; // Update the selected index

    notifyListeners();
  }

  void toggleCheckBox(int groupIndex, int index, bool value) {
    _checkboxStates[groupIndex][index] = value;
    notifyListeners();
  }

  void clearCheckboxStates() {
    for (var group in checkboxStates) {
      for (int i = 0; i < group.length; i++) {
        group[i] = false; // Set each checkbox to false
      }
    }
    notifyListeners(); // Notify listeners to update the UI
  }

  List<FilterItemModel> applyFilters() {
    List<FilterItemModel> filteredItems = [];

    for (int i = 0; i < filterItems.length; i++) {
      List<String> filteredDetails = [];
      for (int j = 0; j < filterItems[i].details.length; j++) {
        if (checkboxStates[i][j]) {
          filteredDetails.add(filterItems[i].details[j]);
        }
      }
      if (filteredDetails.isNotEmpty) {
        filteredItems
            .add(FilterItemModel(filterItems[i].title, filteredDetails));
      }
    }
    return filteredItems;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void clearSearchText() {
    _searchController.clear();
    notifyListeners();
  }

  void searchByProductName(String text) {
    _searchTerm = text;
    notifyListeners();
  }

  void filterByStatus(String status) {
    _currentFilter = status;
    _searchTerm = '';
    if (status == 'All') {
      _filteredProducts = _productList;
    } else {
      _filteredProducts =
          _productList.where((product) => product.status == status).toList();
    }
    notifyListeners();
  }

  void sortByName() {
    _filteredProducts.sort((a, b) => _sortAscending
        ? a.productName.compareTo(b.productName)
        : b.productName.compareTo(a.productName));
    _sortAscending = !_sortAscending;

    notifyListeners();
  }

  void sortBrandByName() {
    _filteredProducts.sort((a, b) => _sortBrandAscending
        ? a.brandName.compareTo(b.brandName)
        : b.brandName.compareTo(a.brandName));
    _sortBrandAscending = !_sortBrandAscending;
    notifyListeners();
  }

  void sortByVendorName() {
    _filteredProducts.sort(
      (a, b) => _sortVendorAscending
          ? a.vendorName.compareTo(b.vendorName)
          : b.vendorName.compareTo(a.vendorName),
    );
    _sortVendorAscending = !_sortVendorAscending;
    notifyListeners();
  }

  void sortByOurCost() {
    _filteredProducts.sort(
      (a, b) => _sortOurCostAscending
          ? a.ourCost.compareTo(b.ourCost)
          : b.ourCost.compareTo(a.ourCost),
    );
    _sortOurCostAscending = !_sortOurCostAscending;
    notifyListeners();
  }

  void sortBySalePrice() {
    _filteredProducts.sort((a, b) => _sortSalePriceAscend
        ? a.salePrice.compareTo(b.salePrice)
        : b.salePrice.compareTo(a.salePrice));
    _sortSalePriceAscend = !_sortSalePriceAscend;
    notifyListeners();
  }

  void sortByCreatedDate() {
    _filteredProducts.sort(
      (a, b) => _sortCreatedDateAsce
          ? a.creadtedDate.compareTo(b.creadtedDate)
          : b.creadtedDate.compareTo(a.creadtedDate),
    );
    _sortCreatedDateAsce = !_sortCreatedDateAsce;
    notifyListeners();
  }

  void sortByCreatedName() {
    _filteredProducts.sort(
      (a, b) => _sortCreatedByAsce
          ? a.createdBy.compareTo(b.createdBy)
          : b.createdBy.compareTo(a.createdBy),
    );
    _sortCreatedByAsce = !_sortCreatedByAsce;
    notifyListeners();
  }

  void sortByUpdatedDate() {
    _filteredProducts.sort(
      (a, b) {
        //handle cases where updatedDate might be null
        if (a.updatedDate == null && b.updatedDate == null) {
          return 0; //both are null, consider equal
        } else if (a.updatedDate == null) {
          return 1; // a is null b is not
        } else if (b.updatedDate == null) {
          return -1; // b is null
        } else {
          return _sortUpdatedDateAsce
              ? a.updatedDate!.compareTo(b.updatedDate!) //Ascending order
              : b.updatedDate!.compareTo(a.updatedDate!); // Descending order
        }
      },
    );
    _sortUpdatedDateAsce = !sortUpdatedDateAsce;
    notifyListeners();
  }

  void sortByUpdatedName() {
    _filteredProducts.sort(
      (a, b) {
        if (a.updatedBy == null && b.updatedBy == null) {
          return 0;
        } else if (a.updatedBy == null) {
          return 1;
        } else if (b.updatedBy == null) {
          return -1;
        } else {
          return _sortUpdatedNameAsce
              ? a.updatedBy!.compareTo(b.updatedBy!)
              : b.updatedBy!.compareTo(a.updatedBy!);
        }
      },
    );
    _sortUpdatedNameAsce = !_sortUpdatedNameAsce;
    notifyListeners();
  }

  void sortByStatus() {
    _filteredProducts.sort(
      (a, b) => _sortStatusAscending
          ? a.status.compareTo(b.status)
          : b.status.compareTo(a.status),
    );
    _sortStatusAscending = !_sortStatusAscending;
    notifyListeners();
  }
}

/*

  void sortByUpdatedDate() {
    products.sort(
      (a, b) {
        //handle cases where updatedDate might be null
        if (a.updatedDate == null && b.updatedDate == null) {
          return 0; //both are null, consider equal
        } else if (a.updatedDate == null) {
          return _sortUpdatedDateAsce ? 1 : -1; // a is null b is not
        } else if (b.updatedDate == null) {
          return _sortUpdatedDateAsce ? -1 : 1; // b is null
        } else {
          return _sortUpdatedDateAsce
              ? a.updatedDate!.compareTo(b.updatedDate!) //Ascending order
              : b.updatedDate!.compareTo(a.updatedDate!);// Descending order
        }
      },
    );
    _sortUpdatedDateAsce = !sortUpdatedDateAsce;
    notifyListeners();
  }
 */