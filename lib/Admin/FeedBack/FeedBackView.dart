import 'package:flutter/material.dart';

import '../../reusable_widget/text_widget.dart';

class ViewFeedBack extends StatefulWidget {
  const ViewFeedBack({super.key});

  @override
  State<ViewFeedBack> createState() => _ViewFeedBackState();
}

class _ViewFeedBackState extends State<ViewFeedBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: text_custome(text: "FeedBack Panel", size: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
