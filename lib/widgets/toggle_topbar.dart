import 'package:flutter/material.dart';
import 'package:parsonskellogg/screen/master_product_feed/provider/product_database_provider.dart';

class ToggleTopbar extends StatelessWidget {
  const ToggleTopbar(
      {super.key, required this.options, required this.provider});
  final List<String> options;
  final ProductDatabaseProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ToggleButtons(
          isSelected: options
              .asMap()
              .entries
              .map((entry) => entry.key == provider.selectedIndex)
              .toList(),
          borderRadius: BorderRadius.circular(4), // Border radius
          borderColor: Colors.grey, // Border color
          selectedBorderColor: Colors.grey, // Color when selected
          selectedColor: Colors.black, // Text color when selected
          color: Colors.grey, // Default text color
          fillColor: const Color.fromRGBO(
              238, 243, 248, 1), // Fill color when selected
          constraints: const BoxConstraints(
            minWidth: 80, // Minimum width for buttons
            minHeight: 50, // Minimum height for buttons
          ),
          onPressed: (index) {
            provider.clearSearchText();
            provider.toggleSelection(index); // Use provider to toggle selection
            //Define a list of statues corresponding to each index
            var statues = options;
            //Ensure the index is whinn bounds and filter according
            if (index >= 0 && index < statues.length) {
              provider.filterByStatus(statues[index]);
            }
          },
          children: options.map((option) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(option),
            );
          }).toList(),
        ),
      ),
    );
  }
}
