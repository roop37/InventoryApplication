

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:VedRich/Theme/Spacing.theme.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: true,
        title:  Text(
          'About Us',
          style: TextStyle(color: Theme.of(context).dividerColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: Spacings.xxs,
            ),
             Padding(
              padding: EdgeInsets.symmetric(vertical: Spacings.md),
              child: Center(
                child: Text("Sahasrara Metatech",
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: Spacings.lg
                ),
                )
                // Image.asset(
                //   'assets/logos/leaf.png',
                //   height: 80,
                //   width: 80,
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Welcome to Sahasrara Metatech Pvt. Ltd., a seasoned player in the Information Technology landscape with over 15 years of experience. At the heart of our commitment is a dedication to delivering comprehensive IT solutions tailored to meet the unique needs of our clients. Join us on a journey where technology meets innovation, and together, we unlock the full potential of your digital aspirations.",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w300, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: Spacings.lg,
            ),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor, // Set button color to pink
              ),
              child: const Text(
                'Check Update',
                style: TextStyle(
                  color: Colors.white, // Set text color to white
                ),
              ),
            ),
            const SizedBox(
              height: Spacings.lg,
            ),
            const Divider(
              thickness: 0.08,
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                // go to account screen
              },
              leading: const Icon(
                Icons.call,
                size: 25,
              ),
              title: const Text("9730029113"),
            ),
            const Divider(
              thickness: 0.08,
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                // go to account screen
              },
              leading: const Icon(
                FontAwesomeIcons.whatsapp,
                size: 25,
              ),
              title: const Text("9730029113"),
            ),
            const Divider(
              thickness: 0.08,
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                // go to account screen
              },
              leading: const Icon(
                Icons.mail,
                size: 25,
              ),
              title: const Text("sahasraradeveloper@gmail.com"),
            ),
            const Divider(
              thickness: 0.08,
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                // go to account screen
              },
              leading: const Icon(
                Icons.language,
                size: 25,
                color: Colors.blueAccent,
              ),
              title: const Text(
                "https://sahasrarameta.tech/",
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const Divider(
              thickness: 0.08,
            ),
          ],
        ),
      ),
    );
  }
}
