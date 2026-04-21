import 'package:flow_chat_app_with_flutter/enums/MenuItems.dart';
import 'package:flow_chat_app_with_flutter/routes/chat_app_routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  bool _isVisible = false;
  bool _isPasswordFocused = false;

  late FocusNode _passwordFocusNode;
  late FocusNode _usernameFocusNode;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    _passwordFocusNode.addListener(() {
      setState(() {
        _isPasswordFocused = _passwordFocusNode.hasFocus;
      });
    });

    _usernameFocusNode = FocusNode();
    _usernameFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  LoginMenuItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: registerAppBar(context),
      body: registerBodyWidget(context),
    );
  }

  Padding registerBodyWidget(BuildContext context) {
    bool isEmail(String input) {
      return input.contains('@');
    }

    bool isPhone(String input) {
      return RegExp(r'^[0-9]+$').hasMatch(input);
    }

    void register(BuildContext context) {
      if (!_formKey.currentState!.validate()) {
        return; // validation fail
      }
      String input = _usernameController.text.trim();

      if (isEmail(input)) {
        debugPrint("Email ile giriş");
        // TODO: email register API

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You have registered.'),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.blueGrey,
          ),
        );

        Navigator.pushReplacementNamed(context, ChatAppRoutes.login);
      } else if (isPhone(input)) {
        debugPrint("Telefon ile giriş");
        // TODO: phone register API

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You have registered.'),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.blueGrey,
          ),
        );

        Navigator.pushReplacementNamed(context, ChatAppRoutes.login);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Invalid register")));
      }
    }

    return Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Register",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUnfocus,
              focusNode: _usernameFocusNode,
              controller: _usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be left blank';
                }
                if (!isEmail(value) && !isPhone(value)) {
                  return 'Enter a valid email or phone number';
                }
                return null;
              },
              onSaved: (newValue) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "E-mail or Phone",
                hintText: "Please Enter E-mail or Phone",
                suffixIcon: Icon(FontAwesomeIcons.user),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUnfocus,
              focusNode: _passwordFocusNode,
              controller: _passwordController,
              obscureText: !_isVisible,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be left blank!!';
                }
                if (value.length < 8) {
                  return 'The password must be at least 8 characters long.';
                } else {
                  return null;
                }
              },
              onSaved: (newValue) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                hintText: "Please Enter the Password",
                suffixIcon: _isPasswordFocused
                    ? IconButton(
                        icon: Icon(
                          _isVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                      )
                    : Icon(Icons.key),
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    register(context);
                  },
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    side: BorderSide(color: Colors.blueGrey, width: 2),
                  ),
                  icon: Icon(FontAwesomeIcons.userPlus, color: Colors.blueGrey),
                  label: Text(
                    "Register",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                SizedBox(width: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar registerAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Hero'yu kapatır
      title: Text("Chat App", style: Theme.of(context).textTheme.titleMedium),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      centerTitle: true,
      actions: [
        PopupMenuButton<LoginMenuItem>(
          onSelected: (LoginMenuItem item) {
            setState(() {
              selectedItem = item;
            });
          },
          itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<LoginMenuItem>>[
                const PopupMenuItem<LoginMenuItem>(
                  value: LoginMenuItem.help,
                  child: Text('Help'),
                ),
              ],
        ),
      ],
    );
  }
}
