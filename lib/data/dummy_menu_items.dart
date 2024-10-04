import 'package:parsonskellogg/models/menu_item.dart';

const dummyMenuItems = [
  MenuItem(
    id: 'm1',
    title: 'Dashboard',
    subMenuItem: [],
  ),
  MenuItem(
    id: 'm2',
    title: 'Master Product Feed',
    subMenuItem: [
      SubMenuItem(
        id: 'sub1m2',
        subTitle: 'Dashboard',
      ),
      SubMenuItem(
        id: 'sub2m2',
        subTitle: 'Product Database',
      ),
      SubMenuItem(
        id: 'sub3m2',
        subTitle: 'Core Product Feed',
      ),
      SubMenuItem(
        id: 'sub4m2',
        subTitle: 'Configurator',
      ),
      SubMenuItem(
        id: 'sub5m2',
        subTitle: 'Setting',
      ),
    ],
  ),
  MenuItem(
    id: 'm3',
    title: 'Store',
    subMenuItem: [],
  ),
  MenuItem(
    id: 'm3',
    title: 'Builder',
    subMenuItem: [],
  ),
  MenuItem(
    id: 'm3',
    title: 'Setting',
    subMenuItem: [],
  ),
];
