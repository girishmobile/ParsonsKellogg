class MenuItem {
  const MenuItem({
    required this.id,
    required this.title,
    this.subMenuItem,
  });
  final String id;
  final String title;
  final List<SubMenuItem>? subMenuItem;
}

class SubMenuItem {
  const SubMenuItem({
    required this.id,
    required this.subTitle,
  });
  final String id;
  final String subTitle;
}
