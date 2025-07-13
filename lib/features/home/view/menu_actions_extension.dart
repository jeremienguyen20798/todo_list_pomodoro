part of 'home_view.dart';

extension MenuActionsExtension on HomeView {
  List<Widget> menuActions() {
    return [
      IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: ColorConstants.iconColor)),
      IconButton(
          onPressed: () {},
          icon: Icon(Icons.groups_outlined, color: ColorConstants.iconColor)),
      IconButton(
          onPressed: () {},
          icon: Icon(Icons.stacked_bar_chart_outlined,
              color: ColorConstants.iconColor)),
    ];
  }
}
