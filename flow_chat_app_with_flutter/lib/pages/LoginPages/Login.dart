import 'package:flow_chat_app_with_flutter/enums/MenuItems.dart';
import 'package:flow_chat_app_with_flutter/routes/chat_app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  bool _isVisible = false;
  bool _isPasswordFocused = false;

  late FocusNode _passwordFocusNode;
  late FocusNode _usernameFocusNode;

  final _usernameController = TextEditingController(text: "example@gmail.com");
  final _passwordController = TextEditingController(text: "123456789");

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
  DateTime? _lastBackPressed;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        final now = DateTime.now();

        if (_lastBackPressed == null ||
            now.difference(_lastBackPressed!) > const Duration(seconds: 2)) {
          _lastBackPressed = now;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Press again to exit."),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        appBar: loginAppBar(context),
        body: loginBodyWidget(context),
      ),
    );
  }

  Padding loginBodyWidget(BuildContext context) {
    bool isEmail(String input) {
      return input.contains('@');
    }

    bool isPhone(String input) {
      return RegExp(r'^[0-9]+$').hasMatch(input);
    }

    void login(BuildContext context) {
      if (!_formKey.currentState!.validate()) {
        return; // validation fail
      }
      String input = _usernameController.text.trim();

      if (isEmail(input)) {
        debugPrint("Email ile giriş");
        // TODO: email login API
        // Geri butonu ile Login sayfasına gitmez..
        // LoginPage stack’ten siler, Yerine route adıyla Chats sayfasını koyar..
        Navigator.pushReplacementNamed(context, ChatAppRoutes.chats);
      } else if (isPhone(input)) {
        debugPrint("Telefon ile giriş");
        // TODO: phone login API
        // Geri butonu ile Login sayfasına gitmez..
        // LoginPage stack’ten siler, Yerine route adıyla Chats sayfasını koyar..
        Navigator.pushReplacementNamed(context, ChatAppRoutes.chats);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Invalid login")));
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
              "Login",
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
                    // Yeni sayfayı stack’in üstüne ekler..
                    // Önceki sayfa stack’te kalır..
                    // Geri tuşuna basınca login’e dönülür..
                    Navigator.pushNamed(context, ChatAppRoutes.register);
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
                OutlinedButton.icon(
                  onPressed: () {
                    login(context);
                  },
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    side: BorderSide(color: Colors.blueGrey, width: 2),
                  ),
                  icon: Icon(
                    FontAwesomeIcons.arrowRightToBracket,
                    color: Colors.blueGrey,
                  ),
                  label: Text(
                    "Login",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar loginAppBar(BuildContext context) {
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
               Navigator.pushNamed(context, ChatAppRoutes.help);
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
