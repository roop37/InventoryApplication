import 'package:url_launcher/url_launcher.dart';

openWebView(String url) {
  launchUrl(
    Uri.parse(url),
    mode: LaunchMode.platformDefault,
  );
}