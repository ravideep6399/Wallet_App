import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/Utils/utils.dart';
import 'package:wallet_app/res/colors.dart';
import 'package:wallet_app/res/components/button.dart';
import 'package:wallet_app/viewmodel/auth_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  FocusNode usernamefocusNode = FocusNode();
  FocusNode passwordfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  var _isObsecure = true;

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    usernamefocusNode.dispose();
    passwordfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final auth = Provider.of<AuthViewModel>(context);
    bool loading = auth.loading;
    return Scaffold(
      backgroundColor: ColorsApp.background,
      appBar: AppBar(
        backgroundColor: ColorsApp.background,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 180,
              child: Center(
                  child: Text(
                "V",
                style: TextStyle(
                    fontSize: 125,
                    color: ColorsApp.white,
                    fontWeight: FontWeight.w400),
              )),
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        focusNode: usernamefocusNode,
                        onFieldSubmitted: (value) {
                          usernamefocusNode.unfocus();
                          FocusScope.of(context)
                              .requestFocus(passwordfocusNode);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter username or email";
                          }
                          return null;
                        },
                        controller: username,
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: ColorsApp.white,
                        style: const TextStyle(color: ColorsApp.white),
                        decoration: const InputDecoration(
                            errorStyle: TextStyle(color: ColorsApp.white),
                            hintText: "Username or email",
                            hintStyle:
                                TextStyle(color: ColorsApp.white, fontSize: 13),
                            filled: true,
                            fillColor: ColorsApp.textFieldColor,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 175, 175, 175),
                                    width: 0.5)),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red))),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        focusNode: passwordfocusNode,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          }
                          return null;
                        },
                        controller: password,
                        obscureText: _isObsecure,
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: ColorsApp.white,
                        style: const TextStyle(color: ColorsApp.white),
                        decoration: InputDecoration(
                            errorStyle: const TextStyle(color: ColorsApp.white),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isObsecure = !_isObsecure;
                                });
                              },
                              child: _isObsecure
                                  ? const Icon(Icons.visibility_rounded,
                                      color: ColorsApp.white)
                                  : const Icon(Icons.visibility_off_rounded,
                                      color: ColorsApp.white),
                            ),
                            hintText: "Password",
                            hintStyle: const TextStyle(
                                color: ColorsApp.white, fontSize: 13),
                            filled: true,
                            fillColor: ColorsApp.textFieldColor,
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide.none),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 175, 175, 175),
                                    width: 0.5)),
                            errorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red))),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 100,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                // currently under construction
                                Utils.flushbarErrorMessage(
                                    "Service Not Available", context);
                              },
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(color: ColorsApp.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    loading
                        ? const CircularProgressIndicator()
                        : LongButton(
                            value: "Login",
                            onPress: () {
                              if (formKey.currentState!.validate()) {
                                Map data = {
                                  "mixed": username.text.toString(),
                                  "password": password.text.toString(),
                                };
                                auth.login(data, context);
                              }
                            },
                            image: const AssetImage("assets/background.jpeg"),
                            color: ColorsApp.white,
                            width: 325,
                          ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: width * 0.35,
                        child: const Divider(
                          thickness: 0.5,
                          color: ColorsApp.dividerColor,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: width * 0.1,
                        child: const Center(
                          child: Text(
                            "OR",
                            style:
                                TextStyle(color: ColorsApp.white, fontSize: 18),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: width * 0.35,
                        child: const Divider(
                          thickness: 0.5,
                          color: ColorsApp.dividerColor,
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            LongButton(
              value: "sign in with Google",
              onPress: () {
                // Login with google is currently under construction
                Utils.flushbarErrorMessage("Service Not Available", context);
              },
              image: const AssetImage("assets/background2.jpeg"),
              color: ColorsApp.white,
              width: 325,
            ),
          ],
        ),
      ),
    );
  }
}
