import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/screen/master_product_feed/provider/store_provider.dart';

class StoreSearchbar extends StatelessWidget {
  const StoreSearchbar({
    super.key,
    required this.title,
    required this.provider,
    this.onChanged,
    required this.onMoreFilter,
  });
  final String title;
  final StoreProvider provider;
  final void Function(String)? onChanged;
  final VoidCallback onMoreFilter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTextWidget(
                text: title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                  label: const Text('Add Store'))
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  color: Colors.white,
                  child: TextField(
                    autocorrect: false,
                    // controller: prodProvider.searchController,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 0,
                      ),
                      filled: true, // Enable filling
                      fillColor: const Color.fromRGBO(238, 243, 248, 1),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                            color: Colors.green.withOpacity(0.6),
                            width: 1), // Focused border color
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.grey, // Enabled border color
                          width: 1.0,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.search_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                child: IconButton(
                  onPressed: onMoreFilter,
                  icon: const Icon(
                    Icons.tune_outlined,
                    color: Colors.grey,
                    size: 24,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
