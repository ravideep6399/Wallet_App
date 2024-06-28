import 'package:flutter/material.dart';
import 'package:wallet_app/res/colors.dart';


// Activity for tab view......

class ActivityList extends StatefulWidget {
  const ActivityList({super.key});

  @override
  State<ActivityList> createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
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
