import 'package:flutter/material.dart';

class ProductDatabaseScreen extends StatelessWidget {
  const ProductDatabaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(238, 243, 248, 1),
        body: SingleChildScrollView(
          child: PaginatedDataTable(
            header: const Text('User Data'),
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Email')),
            ],
            source: UserDataSource(),
            rowsPerPage: 25,
          ),
        ));
  }
}

class UserDataSource extends DataTableSource {
  final List<User> _users = List.generate(
    100,
    (index) => User(
        id: index + 1, name: 'User $index', email: 'user$index@example.com'),
  );

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _users.length) return null;
    final user = _users[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(user.id.toString())),
        DataCell(Text(user.name)),
        DataCell(Text(user.email)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _users.length;

  @override
  int get selectedRowCount => 0;

  @override
  int get rowCountApproximate => rowCount;
}

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});
}
