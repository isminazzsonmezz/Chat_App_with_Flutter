import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Help & Support"), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Frequently Asked Questions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "1. I forgot my password, what should I do?\n"
              "→ You can reset your password by clicking the 'Forgot My Password' button on the login screen.\n",
            ),
            Text(
              "2. How can I update my account?\n"
              "→ You can update your information on your profile page.\n",
            ),
            Text(
              "3. What if I have a technical problem with the application?\n"
              "→ You can contact us using the contact information below.\n",
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 10),

            Text(
              "Contact Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 10),
                Text("support@example.com"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 10),
                Text("+90 123 456 78 90"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.language),
                SizedBox(width: 10),
                Text("www.example.com"),
              ],
            ),

            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Örn: e-mail uygulamasını açmak veya mail göndermek için
                // launchUrl(Uri.parse("mailto:support@example.com"));
              },
              icon: Icon(Icons.contact_mail),
              label: Text("Send Us Email"),
            ),
          ],
        ),
      ),
    );
  }
}
