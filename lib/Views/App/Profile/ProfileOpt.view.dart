
import 'package:flutter/material.dart';
import 'package:VedRich/Theme/BorderRadiuses.theme.dart';
import 'package:VedRich/Theme/Spacing.theme.dart';
import 'package:VedRich/Utils/OpenWebView.util.dart';
import 'package:VedRich/Views/App/Profile/AboutUs.view.dart';
import 'package:VedRich/Views/App/Profile/AccountInfo/AccountInfo.view.dart';
import 'package:VedRich/Views/Auth/LoginScreen/LoginScreen.view.dart';
import 'package:VedRich/Widgets/spacer.widget.dart';

class ProfileView extends StatefulWidget {
  static const String routeName = "/profile";

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState
    extends State<ProfileView>
{
  final bool _switchValue = false;

  Widget _buildMenuSectionHeading(BuildContext context, String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Spacings.md, vertical: Spacings.sm),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        title: Align(
          alignment: Alignment.centerRight,
          child: Container(
            // padding: const EdgeInsets.all(Spacings.sm),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(BorderRadiuses.md),
              color: Theme.of(context).primaryColor.withOpacity(0.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "वेद Rich",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Container(
                  height: kToolbarHeight - Spacings.sm * 2,
                  width: kToolbarHeight - Spacings.sm * 2,
                  margin: const EdgeInsets.all(Spacings.sm),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(BorderRadiuses.sm),
                    color: Colors.white,
                  ),
                  child: Center(child: Text("वेद",style: TextStyle(color: Theme.of(context).primaryColor),))
                  // Image.asset(
                  //   'assets/logos/glasses.png',
                  //   height: 40,
                  //   width: 40,
                  // ),
                  )
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverSpacer.vertical(Spacings.md),
           SliverToBoxAdapter(child:Hero(
              tag: "profile",
              child: Icon(Icons.account_circle_outlined,size: Spacings.xxl,color: Theme.of(context).primaryColor,),),),
          const SliverSpacer.vertical(Spacings.lg),
          _buildMenuSectionHeading(context, "General"),
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              ListTile(
                onTap: () => Navigator.of(context).pushNamed(
                  AccountInfo.routeName,
                ),
                leading: const Icon(Icons.person, size: 20),
                title: const Text("Account"),
              ),

              ListTile(
                onTap: () {

                },
                leading: const Icon(Icons.trip_origin_sharp , size: 20),
                title: const Text("Orders"),
              ),

              ListTile(
                onTap: () => openWebView(
                    "https://sahasrarameta.tech/"),
                leading: const Icon(Icons.privacy_tip_rounded, size: 20),
                title: const Text("Privacy Policy"),
              ),
              ListTile(
                onTap: () => openWebView(
                    "https://sahasrarameta.tech/"),
                leading: const Icon(Icons.description_rounded, size: 20),
                title: const Text("Terms and Condition"),
              ),
              // ListTile(
              //   // onTap: , change dark mode
              //   leading: const Icon(Icons.description_rounded, size: 20),
              //   title: const Text("Theme"),
              //   trailing: Switch(
              //     value: _switchValue,
              //     onChanged: (value) {
              //       // setState(() {
              //       //   _switchValue = value;
              //       // });
              //     },
              //   ),
              // ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUs(),
                    ),
                  );
                },
                leading: const Icon(Icons.info_outline, size: 20),
                title: const Text("About Us"),
              ),
              const SpacerWidget.vertical(Spacings.sm),
              Divider(
                color: Colors.grey.shade400,
              ),
              const SpacerWidget.vertical(Spacings.sm),
              ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Logout User"),
                        content: const Text("Are you sure you want to Logout?"),
                        actions: [
                          // Cancel button
                          TextButton(
                            child: const Text("Cancel"),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                          // Delete button
                          TextButton(
                            child: const Text("Yes"),
                            onPressed: () {
                              // SharedPrefs.removePincode();
                              // SharedPrefs.removeUserToken();
                              Navigator.pushNamed(context, LoginPage.routeName);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                leading: const Icon(
                  Icons.power_settings_new_rounded,
                  size: 20,
                  color: Colors.red,
                ),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
