import 'package:flow_chat_app_with_flutter/data/chatList.dart';
import 'package:flow_chat_app_with_flutter/widgets/MyAppBar.dart';
import 'package:flutter/material.dart';

class Updates extends StatefulWidget {
  const Updates({super.key});

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add_a_photo, color: Colors.white,),
      ),
      appBar: MyAppBar(title: "Updates"),
      body: updatesBodyContainer(size),
    );
  }

  Container updatesBodyContainer(Size size) {
    return Container(
          child: ListTile(
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: size.width * 0.09,
                  backgroundImage: NetworkImage(chatList[1].avatarUrl),
                ),
                // Add indicator
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: size.width * 0.065,
                    width: size.width * 0.065,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: size.width * 0.05,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            title: Text('Add status'),
            subtitle: Text(
              'Disappears after 24 hours',
            ),
            isThreeLine: true,
          ),
        );
  }
}