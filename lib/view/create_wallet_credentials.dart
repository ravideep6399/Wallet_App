import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/res/colors.dart';
import 'package:wallet_app/res/components/button.dart';
import 'package:wallet_app/res/extra_texts.dart';
import 'package:wallet_app/viewmodel/create_wallet_view_model.dart';

class CreateWalletCredentials extends StatefulWidget {
  const CreateWalletCredentials({super.key});

  @override
  State<CreateWalletCredentials> createState() =>
      _CreateWalletCredentialsState();
}

class _CreateWalletCredentialsState extends State<CreateWalletCredentials> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController walletName = TextEditingController();
  final TextEditingController pincode = TextEditingController();
  var isObsecure = true;
  @override
  void dispose() {
    walletName.dispose();
    pincode.dispose();
    super.dispose();
  }

  Map convert(String walletName, String pincode) {
    Map data = {
      "wallet_name": walletName,
      "network": LongLines.devnet,
      "user_pin": pincode
    };
    return data;
  }

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    final create = Provider.of<CreateWalletViewModel>(context);
    bool loading = create.loading;
    return Scaffold(
      backgroundColor: ColorsApp.background,
      appBar: AppBar(
        backgroundColor: ColorsApp.background,
        centerTitle: true,
        iconTheme: const IconThemeData(color: ColorsApp.white),
        title: const Text(
          "Create Wallet",
          style: TextStyle(color: ColorsApp.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 7, bottom: 6),
                  child: Text(
                    "Wallet Name",
                    style: TextStyle(color: ColorsApp.white, fontSize: 13),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: walletName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a Wallet Name";
                  }
                  return null;
                },
                textAlignVertical: TextAlignVertical.center,
                cursorColor: ColorsApp.white,
                style: const TextStyle(color: ColorsApp.white),
                decoration: const InputDecoration(
                    errorStyle: TextStyle(color: ColorsApp.white),
                    hintText: "Eg. Jack's Wallet",
                    hintStyle: TextStyle(color: ColorsApp.white, fontSize: 13),
                    filled: true,
                    fillColor: ColorsApp.textFieldColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 175, 175, 175),
                            width: 0.5)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.red))),
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 7, bottom: 6),
                  child: Text(
                    "Pincode",
                    style: TextStyle(color: ColorsApp.white, fontSize: 13),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: pincode,
                obscureText: isObsecure,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a 6-digit pin";
                  }
                  return null;
                },
                textAlignVertical: TextAlignVertical.center,
                cursorColor: ColorsApp.white,
                style: const TextStyle(color: ColorsApp.white),
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObsecure = !isObsecure;
                        });
                      },
                      child: isObsecure?const Icon(
                        Icons.visibility,
                        color: ColorsApp.white,
                      ):const Icon(
                        Icons.visibility_off,
                        color: ColorsApp.white,
                      )
                    ),
                    errorStyle: const TextStyle(color: ColorsApp.white),
                    hintText: "Eg. 6-digit numeric pin",
                    hintStyle:
                        const TextStyle(color: ColorsApp.white, fontSize: 13),
                    filled: true,
                    fillColor: ColorsApp.textFieldColor,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide.none),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 175, 175, 175),
                            width: 0.5)),
                    errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.red)),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.red))),
              ),
            ),
            SizedBox(
              height: hei * 0.05,
            ),
            loading
                ? const CircularProgressIndicator()
                : LongButton(
                    value: "Create",
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        Map data = convert(walletName.text.toString(),
                            pincode.text.toString());
                        create.createWallet(data, context);
                      }
                    },
                    image: const AssetImage("assets/splashscreen.png"),
                    color: ColorsApp.white,
                    width: 325,
                  )
          ],
        ),
      ),
    );
  }
}
