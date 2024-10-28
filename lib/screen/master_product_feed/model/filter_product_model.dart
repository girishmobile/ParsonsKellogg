class FilterItemModel {
  final String title;
  final List<String> details;
  FilterItemModel(this.title, this.details);
}

///
final List<FilterItemModel> filterItems = [
  FilterItemModel('Brand', [
    'Urban Thread',
    'Edge & Style',
    'Apex Wear',
    'Vivid Gear',
    'TrueFi',
    'Horizon Outfitters',
    'Pulse Apparel',
    'Nomad Essentials',
    'Alloy Clothing',
    'Drift Co.',
    'Zenith Attire',
    'Mosaic Fashion',
    'Element Wear',
    'Core Threads',
    'Ember & Oak'
  ]),
  FilterItemModel('Vendor', [
    'Apex Traders',
    'Urban Goods',
    'Summit Supplies',
    'Horizon Market',
    'Fusion Vendors',
    'Stellar Commerce',
    'Nexus Sales',
    'Echo Enterprises',
    'Dynamic Distributors',
    'Infinity Imports',
    'Vivid Ventures',
    'Quantum Products',
    'Crest Wholesale',
    'Peak Traders',
    'Nova Networks'
  ]),
  FilterItemModel('Product Type', [
    'Jacket',
    'Shirt',
    'Leather Shoes',
    'Jeans Pants',
    'Dress',
    'Skirt',
    'Sweater',
    'T-shirt',
    'Shorts',
    'Blazer',
    'Coat',
    'Tank Top',
    'Hoodie',
    'Sweatpants',
    'Cardigan'
  ]),
  FilterItemModel('Created Date', ['createdDate']),
  FilterItemModel('Updated Date', ['updatedDate']),
  FilterItemModel('Status', ['Active', 'Inactive', 'Draft', 'Staging']),
  FilterItemModel('Created By', [
    'Mia Hayes',
    'Jake Lawson',
    'Lily Carter',
    'Noah Reed',
    'Emma Brooks',
    'Ethan Grant',
    'Ava Parker',
    'Lucas Wright',
    'Sophia Bennett',
    'Alex Turner'
  ]),
  FilterItemModel('Updated By', [
    'Ryan Mitchell',
    'Chloe Adams',
    'Mason Clark',
    'Grace Rivera',
    'Oliver Fisher',
    'Zoe Thompson',
    'Aiden Cooper',
    'Emily Murphy',
    'Jack Torres',
    'Scarlett James'
  ]),
];
