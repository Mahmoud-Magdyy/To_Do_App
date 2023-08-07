import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        
        onPressed: onPressed,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ));
  }
}

//  TextButton(
//     child: Align(
//       alignment: Alignment.centerLeft,
                            //       child: Text(
                            //         AppStrings.skip,
                            //         style: Theme.of(context)
                            //             .textTheme
                            //             .displaySmall,
                            //       ),
                            //     ),
                            //     onPressed: () {
                            //       controller.jumpToPage(2);
                            //     },
                            //   )