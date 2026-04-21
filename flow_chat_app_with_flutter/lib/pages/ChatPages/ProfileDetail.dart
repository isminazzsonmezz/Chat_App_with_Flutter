import 'package:flow_chat_app_with_flutter/data/chatList.dart';
import 'package:flow_chat_app_with_flutter/enums/MenuItems.dart';
import 'package:flow_chat_app_with_flutter/model/chat_model.dart';
import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final chatProfileId = ModalRoute.of(context)!.settings.arguments as int;
    final chatProfile = chatList.firstWhere((c) => c.id == chatProfileId);
    return Scaffold(
      appBar: profileDetail_AppBar(),
      body: profileDetailBody(chatProfile, size),
    );
  }

  SingleChildScrollView profileDetailBody(ChatModel chatProfile, Size size) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          children: [
            CircleAvatar(
              radius: size.width * 0.15,
              backgroundImage: NetworkImage(chatProfile.avatarUrl),
            ),
            SizedBox(height: size.height * 0.02),
            Text(chatProfile.name, style: TextStyle(fontSize: 24),),
            SizedBox(height: size.height * 0.02),
            Text("+90 - User Phone Number"),
            SizedBox(height: size.height * 0.02),
            Text(chatProfile.about),
            SizedBox(height: size.height * 0.02),
            Wrap(
              spacing: 10,
              alignment: WrapAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.phone, color: Colors.black,),
                      Text("Audio", style: TextStyle(color: Colors.black),),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                OutlinedButton(
                  onPressed: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.video_call, color: Colors.black,),
                      Text("Video", style: TextStyle(color: Colors.black),),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                OutlinedButton(
                  onPressed: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.search, color: Colors.black,),
                      Text("Search", style: TextStyle(color: Colors.black),),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text("Add to Favourites"),
                ),
                ListTile(
                  leading: Icon(Icons.list),
                  title: Text("Add to List"),
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text("Clear chat"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar profileDetail_AppBar() {
    return AppBar(
      automaticallyImplyLeading: true,
      actions: [
              PopupMenuButton<ProfileMenuItem>(
                onSelected: (item) {
                  if (item == ProfileMenuItem.share) {
                    // Share
                  } else {
                    // edit
                  }
                },
                itemBuilder: (context) => ProfileMenuItem.values
                    .map(
                      (value) => PopupMenuItem<ProfileMenuItem>(
                        value: value,
                        child: Text(value.label),
                      ),
                    )
                    .toList(),
              ),
            ],
    );
  }
}
