import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MessagePreviewCard extends StatelessWidget {
  const MessagePreviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.w,horizontal: 2.w),
      width: double.infinity,
      height: 20.w,
      color: Colors.green,
    );
  }
}
