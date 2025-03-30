
import 'package:bouselwawa/core/helpers/spacing.dart';
import 'package:bouselwawa/core/helpers/strings.dart';
import 'package:bouselwawa/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundColor:
                  ColorsManager.textFormFieldBackground,
              child: SvgPicture.asset(
                Strings.googleIcon,
                width: 30.w,
              ),
            ),
            horizontalSpace(40),
            CircleAvatar(
              backgroundColor:
                  ColorsManager.textFormFieldBackground,
              radius: 30.r,
              child: SvgPicture.asset(
                Strings.facebookIcon,
                width: 30.w,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
