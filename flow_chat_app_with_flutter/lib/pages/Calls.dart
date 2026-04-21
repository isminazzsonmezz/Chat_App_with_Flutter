import 'package:flow_chat_app_with_flutter/data/chatList.dart';
import 'package:flow_chat_app_with_flutter/widgets/MyAppBar.dart';
import 'package:flutter/material.dart';

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add_call, color: Colors.white),
      ),
      appBar: MyAppBar(title: "Calls"),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                circleAvatarButton(size, Icon(Icons.phone), "Call"),
                circleAvatarButton(size, Icon(Icons.calendar_month), "Schedule"),
                circleAvatarButton(size, Icon(Icons.app_registration), "Keypad"),
                circleAvatarButton(size, Icon(Icons.favorite), "Favorites"),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    color: Colors.transparent,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(chatList[index].avatarUrl),
                      ),
                      title: Text(chatList[index].name),
                      subtitle: Row(
                        children: [Text("Today, ${chatList[index].time}")],
                      ),
                      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.video_call_outlined)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector circleAvatarButton(Size size, Icon icon, String text) {
    return GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 244, 241, 241),
                        radius: size.width * 0.08,
                        child: icon,
                      ),
                      Text(text,)
                    ],
                  ),
                );
  }
}
