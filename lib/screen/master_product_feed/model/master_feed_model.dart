import 'package:flutter/material.dart';

////jhkjhjhkj
class MasterFeedModel {
  MasterFeedModel({
    required this.id,
    required this.name,
    required this.itemFeed,
    required this.coreItemFeed,
  });
  final String id;
  final String name;
  List<ItemFeed> itemFeed;
  List<CoreItemFeed> coreItemFeed;
}

class ItemFeed {
  const ItemFeed({
    required this.id,
    required this.name,
    required this.count,
    this.iconName = Icons.ac_unit_outlined,
  });
  final String id;
  final String name;
  final String count;
  final IconData iconName;
}

class CoreItemFeed {
  const CoreItemFeed({
    required this.id,
    required this.name,
    required this.count,
    this.iconName = Icons.ac_unit_outlined,
  });
  final String id;
  final String name;
  final String count;
  final IconData iconName;
}

final List<MasterFeedModel> masterFeedsData = [
  MasterFeedModel(
    id: 'm1',
    name: 'Product Database',
    itemFeed: [
      const ItemFeed(
        id: 'pdf1',
        name: 'Active Product',
        count: '0',
        iconName: Icons.done_all_outlined,
      ),
      const ItemFeed(
        id: 'pdf2',
        name: 'InActive Product',
        iconName: Icons.remove_done_outlined,
        count: '0',
      ),
      const ItemFeed(
        id: 'pdf3',
        name: 'Brands',
        iconName: Icons.diamond_outlined,
        count: '192',
      ),
      const ItemFeed(
        id: 'pdf4',
        name: 'Product Categories',
        iconName: Icons.account_tree_outlined,
        count: '172',
      ),
      const ItemFeed(
        id: 'pdf5',
        name: 'Total Products',
        iconName: Icons.auto_awesome_motion_outlined,
        count: '1',
      ),
    ],
    coreItemFeed: [],
  ),
  MasterFeedModel(
    id: 'm2',
    name: 'Core Product Feed',
    itemFeed: [
      const ItemFeed(
        id: 'cpf1',
        name: 'Active Product',
        iconName: Icons.done_all_outlined,
        count: '8423',
      ),
      const ItemFeed(
        id: 'cpf2',
        name: 'InActive Product',
        iconName: Icons.remove_done_outlined,
        count: '73',
      ),
      const ItemFeed(
        id: 'cpf3',
        name: 'Brands',
        iconName: Icons.diamond_outlined,
        count: '192',
      ),
      const ItemFeed(
        id: 'cpf4',
        name: 'Product Categories',
        iconName: Icons.account_tree_outlined,
        count: '172',
      ),
      const ItemFeed(
        id: 'cpf5',
        name: 'Total Products',
        iconName: Icons.auto_awesome_motion_outlined,
        count: '8499',
      ),
    ],
    coreItemFeed: [
      const CoreItemFeed(
        id: 'crf1',
        name: 'Brands',
        count: '192',
        iconName: Icons.diamond_outlined,
      ),
      const CoreItemFeed(
        id: 'crf2',
        name: 'Vendors',
        count: '158',
        iconName: Icons.person_outline,
      ),
      const CoreItemFeed(
        id: 'crf3',
        name: 'Color Facets',
        count: '14',
        iconName: Icons.palette_outlined,
      ),
      const CoreItemFeed(
        id: 'crf4',
        name: 'Product Categories',
        count: '172',
        iconName: Icons.account_tree_outlined,
      ),
      const CoreItemFeed(
        id: 'crf5',
        name: 'Product Dimensions',
        count: '1',
        iconName: Icons.border_style_outlined,
      ),
      const CoreItemFeed(
        id: 'crf6',
        name: 'Logo Locations',
        count: '3',
        iconName: Icons.fullscreen_exit_outlined,
      )
    ],
  ),
  MasterFeedModel(
    id: 'm3',
    name: 'Store Builder',
    itemFeed: [
      const ItemFeed(
        id: 'sb1',
        name: 'Active Store Buildes',
        iconName: Icons.done_all_outlined,
        count: '6',
      ),
      const ItemFeed(
        id: 'sb2',
        name: 'InActive Store Buildes',
        iconName: Icons.remove_done_outlined,
        count: '0',
      ),
      const ItemFeed(
        id: 'sb3',
        name: 'Brands',
        iconName: Icons.diamond_outlined,
        count: '73',
      ),
      const ItemFeed(
        id: 'sb4',
        name: 'Product Categories',
        iconName: Icons.account_tree_outlined,
        count: '254',
      ),
      const ItemFeed(
        id: 'sb5',
        name: 'Total Store Builders',
        iconName: Icons.auto_awesome_motion_outlined,
        count: '6',
      ),
    ],
    coreItemFeed: [],
  ),
  MasterFeedModel(
    id: 'm3',
    name: 'Form Builder',
    itemFeed: [
      const ItemFeed(
        id: 'fb1',
        name: 'Active Product',
        iconName: Icons.done_all_outlined,
        count: '427',
      ),
      const ItemFeed(
        id: 'fb2',
        name: 'InActive Product',
        iconName: Icons.remove_done_outlined,
        count: '1',
      ),
      const ItemFeed(
        id: 'fb3',
        name: 'Brands',
        iconName: Icons.diamond_outlined,
        count: '0',
      ),
      const ItemFeed(
        id: 'fb4',
        name: 'Product Category',
        iconName: Icons.account_tree_outlined,
        count: '0',
      ),
      const ItemFeed(
        id: 'fb5',
        name: 'Total Product',
        iconName: Icons.auto_awesome_motion_outlined,
        count: '789',
      ),
    ],
    coreItemFeed: [],
  )
];
