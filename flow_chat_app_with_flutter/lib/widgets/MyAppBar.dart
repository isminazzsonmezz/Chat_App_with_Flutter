import 'package:flow_chat_app_with_flutter/enums/MenuItems.dart';
import 'package:flow_chat_app_with_flutter/pages/Settings.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;

  const MyAppBar({
    super.key,
    required this.title,
    this.showBack = false,
  });

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showBack,
      title: Text(title),
      // centerTitle: true,
      actions:[
                IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                PopupMenuButton<MenuItemType>(
                  onSelected: (item) {
                    if (item == MenuItemType.setting) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()),
                      );
                    }
                  },
                  itemBuilder: (context) => MenuItemType.values
                      .map(
                        (value) => PopupMenuItem<MenuItemType>(
                          value: value,
                          child: Text(value.label),
                        ),
                      )
                      .toList(),
                ),
              ]
    );
  }
}
