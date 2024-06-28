import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/res/colors.dart';
import 'package:wallet_app/res/components/button.dart';
import 'package:wallet_app/viewmodel/airdrop_view_model.dart';

class AirdropAmount extends StatefulWidget {
  const AirdropAmount({super.key});

  @override
  State<AirdropAmount> createState() => _AirdropAmountState();
}

class _AirdropAmountState extends State<AirdropAmount> {
  final amountList = [0.5, 1.0, 2.5, 5.0];
  double? amount = 0.5;
  _AirdropAmountState() {
    amount = amountList[0];
  }
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<AirdropViewModel>(context);
    bool loading = pro.loading;
    return Scaffold(
      backgroundColor: ColorsApp.background,
      appBar: AppBar(
        backgroundColor: ColorsApp.background,
        centerTitle: true,
        iconTheme: const IconThemeData(color: ColorsApp.white),
        title: const Text(
          "AirDrop Amount",
          style: TextStyle(color: ColorsApp.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                alignment: AlignmentDirectional.bottomCenter,
                value: amount,
                isExpanded: true,
                decoration: const InputDecoration(
                  label: Text("Amount"),
                  labelStyle: TextStyle(color: ColorsApp.white),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsApp.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsApp.white)),
                ),
                style: const TextStyle(color: ColorsApp.white),
                dropdownColor: ColorsApp.background2,
                items: amountList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.toString()),
                        ))
                    .toList(),
                onChanged: (Object? value) {
                  setState(() {
                    amount = value as double?;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            loading?const CircularProgressIndicator():LongButton(
              value: "Request",
              onPress: () {
                pro.airdrop(amount!, context);
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
