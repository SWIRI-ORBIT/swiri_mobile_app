import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiri/theme/app_colors.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final bool isLoading;
  final bool isOutlined;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final TextStyle? textStyle;

  const DefaultButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.isLoading = false,
    this.isOutlined = false,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined
              ? (backgroundColor ?? Colors.transparent)
              : (backgroundColor ?? AppColors.primary),
          foregroundColor: isOutlined
              ? (textColor ?? AppColors.primary)
              : (textColor ?? Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
            side: isOutlined
                ? BorderSide(
                    color: borderColor ?? AppColors.primary,
                    width: borderWidth ?? 2.w,
                  )
                : BorderSide.none,
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style:
              textStyle ??
              TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
