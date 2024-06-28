import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_app/Utils/routes/routes_name.dart';
import 'package:wallet_app/res/colors.dart';
import 'package:wallet_app/res/components/button.dart';
import 'package:wallet_app/res/components/tabs.dart';
import 'package:wallet_app/viewmodel/auth_view_model.dart';
import 'package:wallet_app/viewmodel/wallet_view_model.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  WalletViewModel walletViewModel = WalletViewModel();
  String? address = "Not Provided Yet";

  Future<void> loadaddress() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      print(pref.getString("Wallet Address"));
      address =
          pref.getString("Public keys") ?? "Not Provided Yet";
      if (pref.getString("Public keys") == null) {
        address = pref.getString("Wallet Address") ?? "Not Provided Yet";
      }
    });
  }

  @override
  void initState() {
    walletViewModel.getBalance(context);

    loadaddress();

    super.initState();
  }

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: ColorsApp.grey,
        context: context,
        builder: ((context) {
          return SizedBox(
            height: 180,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.send);
                    },
                    leading: const CircleAvatar(
                        backgroundColor: ColorsApp.circularAvatar,
                        child: Icon(
                          Icons.home,
                          color: ColorsApp.white,
                        )),
                    title: const Text("Address"),
                    titleTextStyle: const TextStyle(
                        color: ColorsApp.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                                title:
                                    Center(child: Text("Under Construction")),
                              ));
                    },
                    leading: const CircleAvatar(
                        backgroundColor: ColorsApp.circularAvatar,
                        child: Icon(
                          Icons.manage_accounts,
                          color: ColorsApp.white,
                        )),
                    title: const Text("Username"),
                    titleTextStyle: const TextStyle(
                        color: ColorsApp.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ],
              ),
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthViewModel>(context);
    return Scaffold(
        backgroundColor: ColorsApp.background,
        appBar: AppBar(
          backgroundColor: ColorsApp.background,
          title: const Text(
            "Wallet",
            style: TextStyle(
                color: ColorsApp.white,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          actions: [
            PopupMenuButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: ColorsApp.white,
                ),
                color: ColorsApp.background,
                itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.airdrop);
                        },
                        child: const Text(
                          "AirDrop",
                          style: TextStyle(color: ColorsApp.white),
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          auth.logOut(context);
                        },
                        child: const Text(
                          "Logout",
                          style: TextStyle(color: ColorsApp.white),
                        ),
                      )
                    ])
          ],
        ),
        body: ChangeNotifierProvider<WalletViewModel>(
          create: (BuildContext context) => walletViewModel,
          child: Consumer<WalletViewModel>(builder: (context, value, _) {
            String amount =
                (value.balance.data?.balance ?? 0).toStringAsFixed(2);
            return Center(
              child: Column(
                children: [
                  Container(
                    height: 118,
                    width: 320,
                    decoration: const BoxDecoration(
                        color: ColorsApp.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Text(
                              "Total Balance",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              "\$$amount",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              width: 140,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 90,
                                    child: Text(
                                      address!,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        final value =
                                            ClipboardData(text: address!);
                                        Clipboard.setData(value);
                                      },
                                      icon: const Icon(
                                        Icons.copy,
                                        size: 12,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LongButton(
                            value: "Send",
                            width: 150,
                            onPress: () {
                              _displayBottomSheet(context);
                            },
                            image:
                                const AssetImage("assets/red pattern.jpeg"),
                            color: ColorsApp.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LongButton(
                            value: "Swap",
                            width: 150,
                            onPress: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => const AlertDialog(
                                        title: Center(
                                            child:
                                                Text("Under Construction")),
                                      ));
                            },
                            image: const AssetImage("assets/blue pot.jpeg"),
                            color: ColorsApp.white),
                      ),
                    ],
                  ),
                  const TabsController(),
                ],
              ),
            );
          }),
        ));
  }
}
