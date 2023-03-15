import 'package:flutter/material.dart';
import 'package:jobsque/01_model/04_file_model/file_model.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:sizer/sizer.dart';

class UploadedDocPreview extends StatelessWidget {
  final FileModel fileModel;
  final VoidCallback? onPressedEdit;
  final VoidCallback? onPressedDelete;

  const UploadedDocPreview({
    Key? key,
    required this.fileModel,
    required this.onPressedEdit,
    required this.onPressedDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 20.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        borderRadius: BorderRadius.circular(3.w),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 2.w),
        leading: Image.asset(
          fileModel.photo!,
          width: 15.w,
          height: 15.w,
        ),
        title: CustomText(
          text: fileModel.name!,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.4,
          color: AppColors.kPrimaryBlack,
        ),
        subtitle: CustomText(
          text: 'CV.${fileModel.type} ${fileModel.size}MB',
          fontWeight: FontWeight.w400,
          fontSize: 12,
          height: 1.5,
          color: AppColors.grey,
        ),
        trailing: SizedBox(
          width: 25.w,
          child: Row(
            children: [
              IconButton(
                onPressed: onPressedEdit,
                icon: Icon(
                  Icons.edit,
                  color: AppColors.kPrimaryColor,
                  size: 8.w,
                ),
                padding: const EdgeInsets.all(0),
              ),
              IconButton(
                onPressed: onPressedDelete,
                icon: Icon(
                  Icons.highlight_remove,
                  color: AppColors.red,
                  size: 8.w,
                ),
                padding: const EdgeInsets.all(0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
