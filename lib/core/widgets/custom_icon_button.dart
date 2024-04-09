
import 'package:flutter/material.dart';

import '../constant/colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, this.onTap, required this.icon});

  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColors.buttonColor,
      splashColor: AppColors.buttonColor,
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.grey.withOpacity(.7)),
          child: Icon(
            icon,
            size: MediaQuery.of(context).size.width / 10,
            color: AppColors.textColor,
          )),
    );
  }
}
