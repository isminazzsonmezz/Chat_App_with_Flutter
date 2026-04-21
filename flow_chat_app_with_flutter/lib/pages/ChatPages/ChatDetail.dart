import 'package:flow_chat_app_with_flutter/model/chat_model.dart';
import 'package:flow_chat_app_with_flutter/routes/chat_app_routes.dart';
import 'package:flutter/material.dart';

class ChatDetail extends StatefulWidget {
  const ChatDetail({super.key});

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {


  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final chat = ModalRoute.of(context)!.settings.arguments as ChatModel;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: chatDetail_AppBar(context, chat, size),
      body:  ListView(
        children: [
          // mesajlar
        ],
      ),
      bottomNavigationBar: sendMessageWidget(context, _controller),
    );
  }

  AppBar chatDetail_AppBar(BuildContext context, ChatModel chat, Size size) {
    return AppBar(
      title:  Row(
        children: [
          GestureDetector(
            onTap: () {
              // profileDetail page
              Navigator.pushNamed(context, ChatAppRoutes.profileDetail, arguments: chat.id);
            },
            child: CircleAvatar(
              radius: size.width * 0.06,
              backgroundImage: NetworkImage(chat.avatarUrl)
            ),
          ),
          SizedBox(width: size.height * 0.02),
          Text(chat.name),
        ],
      ),
      automaticallyImplyLeading: true,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.video_call_outlined,)),
        IconButton(onPressed: (){}, icon: Icon(Icons.phone_outlined,))
      ],
    );
  }

  Widget sendMessageWidget(BuildContext context, TextEditingController controller) {

    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedPadding(
      duration: Duration(milliseconds: 200),
      padding: EdgeInsets.only(
        bottom: bottomInset,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.emoji_emotions_outlined),
              onPressed: () {},
            ),
            Expanded(
              child: TextField(
                controller: controller,
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Write a messsage...",
                  filled: true,
                  fillColor: const Color.fromARGB(255, 244, 241, 241),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.attach_file),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.send, color: Colors.blueGrey),
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  debugPrint(controller.text);
                  controller.clear();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}





