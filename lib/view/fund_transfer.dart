import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/res/colors.dart';
import 'package:wallet_app/res/components/button.dart';
import 'package:wallet_app/viewmodel/fund_transfer_view_model.dart';

class TransferFunds extends StatefulWidget {
  const TransferFunds({super.key});

  @override
  State<TransferFunds> createState() => _TransferFundsState();
}

class _TransferFundsState extends State<TransferFunds> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController address = TextEditingController();
  final TextEditingController pincode = TextEditingController();
  final TextEditingController amount = TextEditingController();
  bool isObsecure = true;
  @override
  void dispose() {
    address.dispose();
    amount.dispose();
    pincode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    final transfer = Provider.of<TransferFundViewModel>(context);
    bool loading = transfer.loading;
    return Scaffold(
      backgroundColor: ColorsApp.background,
      appBar: AppBar(
        backgroundColor: ColorsApp.background,
        centerTitle: true,
        iconTheme: const IconThemeData(color: ColorsApp.white),
        title: const Text(
          "Send",
          style: TextStyle(color: ColorsApp.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: address,
                validator: (value) {
                  if (value == null) {
                    return "Please enter a Wallet Name";
                  }
                  return null;
                },
                textAlignVertical: TextAlignVertical.center,
                cursorColor: ColorsApp.white,
                style: const TextStyle(color: ColorsApp.white),
                decoration: const InputDecoration(
                    errorStyle: TextStyle(color: ColorsApp.white),
                    hintText: "Recipient Address",
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
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: amount,
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
                    hintText: "Amount",
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
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: pincode,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a 6-digit pin";
                  } else if (value.length != 6) {
                    return "Please enter a 6-digit pin";
                  }
                  return null;
                },
                textAlignVertical: TextAlignVertical.center,
                obscureText: isObsecure,
                cursorColor: ColorsApp.white,
                style: const TextStyle(color: ColorsApp.white),
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObsecure = !isObsecure;
                          });
                        },
                        child: isObsecure
                            ? const Icon(
                                Icons.visibility,
                                color: ColorsApp.white,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: ColorsApp.white,
                              )),
                    errorStyle: const TextStyle(color: ColorsApp.white),
                    hintText: "Enter PINCODE",
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
                    value: "Send",
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        transfer.transfer(
                            address.text.toString(),
                            int.parse(amount.text.toString()).toInt(),
                            pincode.text.toString(),
                            context);
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
