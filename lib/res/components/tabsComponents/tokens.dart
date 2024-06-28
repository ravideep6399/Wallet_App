import 'package:flutter/material.dart';

import '../../colors.dart';

// tokens for tab view ....

class TokensList extends StatefulWidget {
  const TokensList({super.key});

  @override
  State<TokensList> createState() => _TokensListState();
}

class _TokensListState extends State<TokensList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 0,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.all(12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              tileColor: ColorsApp.white,
            ),
          );
        });
  }
}
