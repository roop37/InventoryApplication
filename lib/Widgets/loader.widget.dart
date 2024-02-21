import 'package:flutter/material.dart';
import 'package:VedRich/Theme/Spacing.theme.dart';
import 'package:VedRich/Widgets/spacer.widget.dart';


showLoaderDialog(BuildContext context, {String loaderMessage = "Loading..."}) {
  AlertDialog alert = AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(Spacings.md),
      ),
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          loaderMessage,
          // style: Title.title(context).copyWith(
          //     fontWeight: FontWeight.w300,
          //     fontSize: 16.0,
          //     fontFamily: MyFonts.openSansRegular),
          textAlign: TextAlign.center,
        ),
        const SpacerWidget(height: Spacings.lg),
        const LinearProgressIndicator(
            backgroundColor: Colors.blueGrey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
            minHeight: 1.5),
      ],
    ),
  );

  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

//test
class PageLoader extends StatelessWidget {
  
  const PageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
