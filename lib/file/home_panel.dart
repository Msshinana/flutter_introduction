import 'package:flutter_introduction/pages/pages.dart';

final home_panels = [
  {
    'title': 'Widget',
    'isExpanded': false,
    'items': [
      {
        'title': 'Basic',
        'isSelected': false,
        'pageBuilder': const WidgetBasicPage(),
      },
      {
        'title': 'Material',
        'isSelected': false,
        'pageBuilder': const WidgetMaterialPage(),
      },
    ],
  },
  {
    'title': 'Layout',
    'isExpanded': false,
    'items': [
      {
        'title': 'Horizontal and Vertical Align',
        'isSelected': false,
        'pageBuilder': const HoriVertAlignPage(),
      },
      {
        'title': 'Horizontal and Vertical Sizing',
        'isSelected': false,
        'pageBuilder': const HoriVertSizingPage(),
      },
      {
        'title': 'Horizontal and Vertical Packing',
        'isSelected': false,
        'pageBuilder': const HoriVertPackingPage(),
      },
      {
        'title': 'Container',
        'isSelected': false,
        'pageBuilder': ContainerPage(),
      },
      {
        'title': 'Grid View Extent',
        'isSelected': false,
        'pageBuilder': const GridViewExtentPage(),
      },
      {
        'title': 'Grid View Count',
        'isSelected': false,
        'pageBuilder': const GridViewCountPage(),
      },
      {
        'title': 'List View',
        'isSelected': false,
        'pageBuilder': ListViewPage(),
      },
      {
        'title': 'Stack',
        'isSelected': false,
        'pageBuilder': const StackPage(),
      },
      {
        'title': 'Card',
        'isSelected': false,
        'pageBuilder': const CardPage(),
      },
      {
        'title': 'Pavlova',
        'isSelected': false,
        'pageBuilder': const PavlovaPage(),
      },
      {
        'title': 'Lake',
        'isSelected': false,
        'pageBuilder': const LakePage(),
      },
    ],
  },
  {
    'title': 'Ineraction',
    'isExpanded': false,
    'items': [
      {
        'title': 'Favorite Lake',
        'isSelected': false,
        'pageBuilder': const FavoriteLakePage(),
      },
      {
        'title': 'Refresh Indicator',
        'isSelected': false,
        'pageBuilder': const RefreshIndicatorPage(),
      },
      {
        'title': 'Silver App Bar',
        'isSelected': false,
        'pageBuilder': const SliverAppBarScrollPage(),
      },
    ],
  },
  {
    'title': 'Navigation',
    'isExpanded': false,
    'items': [
      {
        'title': 'Basic',
        'isSelected': false,
        'pageBuilder': const BasicNavigationPage(),
      },
      {
        'title': 'Named Route',
        'isSelected': false,
        'pageBuilder': const NamedRoutePage(),
      },
      {
        'title': 'Send Data',
        'isSelected': false,
        'pageBuilder': SendDataPage(),
      },
      {
        'title': 'Return Data',
        'isSelected': false,
        'pageBuilder': const ReturnDataPage(),
      },
      {
        'title': 'Hero',
        'isSelected': false,
        'pageBuilder': const HeroPage(),
      },
      {
        'title': 'Nested',
        'isSelected': false,
        'pageBuilder': const NestedNavigationPage(),
      },
      {
        'title': 'TabBar',
        'isSelected': false,
        'pageBuilder': const TabBarNavigationPage(),
      },
    ],
  },
  {
    'title': 'State',
    'isExpanded': false,
    'items': [
      {
        'title': 'Tabbox',
        'isSelected': false,
        'pageBuilder': const TapboxPage(),
      },
      {
        'title': 'Counter',
        'isSelected': false,
        'pageBuilder': const StateCounterPage(),
      },
    ],
  },
];
