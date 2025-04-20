import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/modules/home/controllers/home_controller.dart';
import '../../appColors.dart';
import '../../customFont.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final bool isPassword;
  final bool readOnly;
  final bool phone; // New parameter
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final double radius;
  final Color textColor;
  final int maxLine;

  const CustomTextField(
      {super.key,
      required this.hint,
      this.isPassword = false,
      this.readOnly = false,
      this.phone = false, // Default value for `phone`
      this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.onChanged,
      this.keyboardType,
      this.onTap,
      this.radius = 12,
      this.textColor = AppColors.blurtext,
      this.maxLine = 1});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    if (!widget.isPassword) {
      _obscureText = false;
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          maxLines: widget.maxLine,
          style: h4.copyWith(color: Colors.white),
          cursorColor: widget.textColor,
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscureText: widget.isPassword ? _obscureText : false,
          readOnly: widget.readOnly,
          keyboardType: widget.keyboardType,
          onTap: widget.onTap,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: h4.copyWith(color: widget.textColor),
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon, color: AppColors.appColor)
                : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                      color: AppColors.appColor,
                    ),
                    onPressed: _togglePasswordVisibility,
                  )
                : (widget.suffixIcon != null
                    ? Icon(widget.suffixIcon, color: AppColors.appColor)
                    : null),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: widget.textColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: widget.textColor, width: 2),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: widget.textColor),
            ),
          ),
        ),
      ],
    );
  }
}
