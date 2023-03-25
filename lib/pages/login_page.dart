import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 300,
                  child: Lottie.network(changeButton
                      ? 'https://assets5.lottiefiles.com/packages/lf20_dn6rwtwl.json'
                      : 'https://assets8.lottiefiles.com/packages/lf20_mjlh3hcy.json'),
                ),
                // Image.asset(
                //   "assets/images/login.png",
                //   fit: BoxFit.cover,
                // ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(
                      color: Color.fromARGB(255, 110, 7, 129),
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Column(
                    children: [
                      TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter UserName",
                            labelText: "UserNmae",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username cannot empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          }),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot empty";
                          } else if (value.length < 6) {
                            return "Password length should be atleast Six";
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //button
                // ElevatedButton(
                //   onPressed: () {
                //
                //   },
                //   child: Text("Login"),
                //   style: TextButton.styleFrom(
                //     foregroundColor: Colors.white,
                //     minimumSize: Size(150, 40),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                // )
                // custom button
                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    splashColor: Colors.pinkAccent,
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButton ? 250 : 150,
                      height: 50,

                      // login text ko alin karna hai
                      alignment: Alignment.center,
                      child: changeButton
                          ? Icon(
                              Icons.done,
                              size: 25,
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: changeButton
                                      ? FontStyle.italic
                                      : FontStyle.normal,
                                  fontSize: changeButton ? 25 : 18),
                            ),
                      // decoration: BoxDecoration(
                      //     color:
                      //         changeButton ? Colors.pinkAccent : Colors.deepPurple,
                      //     ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
