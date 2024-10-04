import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';

class CommonTableView extends StatelessWidget {
  const CommonTableView(
      {super.key,
      required this.rowsPerPage,
      this.sortColumnIndex,
      this.sortAscending = true,
      this.onRowsPerPageChange,
      required this.columns,
      required this.source,
      this.header});

  final int rowsPerPage;

  final int? sortColumnIndex;

  final bool sortAscending;
  final void Function(int?)? onRowsPerPageChange;
  final List<DataColumn> columns;
  final Widget? header;
  final DataTableSource source;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.green,
        iconTheme: theme.iconTheme.copyWith(color: Colors.grey),
        cardTheme: const CardTheme(
          elevation: zero, // remove shadow
        ),
      ),
      child: DataTableTheme(
        data: DataTableThemeData(
          dataRowColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.grey.shade200; // Selected row color
            }
            return Colors.white; // Default row color
          }),
          dividerThickness: zero2,
        ),
        child: PaginatedDataTable(
            header: header,
            rowsPerPage: rowsPerPage,
            sortColumnIndex: sortColumnIndex,
            // Add sorting column index
            sortAscending: sortAscending,
            onRowsPerPageChanged: onRowsPerPageChange,
            columns: columns,
            source: source),
      ),
    );
  }
}
