
import 'package:flutter/material.dart';
import 'package:VedRich/Theme/Spacing.theme.dart';

class AccountInfo extends StatefulWidget {
  static const String routeName = '/account';

  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  late Map<String, dynamic> accountDetails = {};

  @override
  void initState() {
    super.initState();
    // _getAccountDetails(); // Fetch account details on widget initialization
  }

  // Future<void> _getAccountDetails() async {
  //   try {
  //     final Map<String, dynamic> data = await AccountInfoController.getAccountDetails();
  //     setState(() {
  //       accountDetails = data;
  //     });
  //   } catch (error) {
  //     print('Failed to load account details: $error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Info",style: TextStyle(color: Theme.of(context).dividerColor),),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: Spacings.md),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Hero(
            tag: "profile",
            child: Icon(Icons.account_circle_outlined,size: Spacings.xxl,color: Theme.of(context).primaryColor,)),
                _buildTextField('Name', Icons.person, accountDetails['name'] ?? ''),
                _buildTextField('Contact', Icons.phone, accountDetails['contact'] ?? ''),
                _buildTextField('Email', Icons.email, accountDetails['email'] ?? ''),
                // _buildTextField('Gender', Icons.person, accountDetails['gender'] ?? ''),
                // _buildTextField('Date of Birth', Icons.calendar_today, accountDetails['dob'] ?? ''),
                // Add more text fields for other account details as needed
                // ElevatedButton(
                //   onPressed: () {
                //     // Button onPressed handler...
                //   },
                //   child: Text("Confirm"),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }

  ListTile _buildTextField(String label, IconData icon, String value) {
    return ListTile(
      minLeadingWidth: 0,
      onTap: () {},
      leading: Icon(icon, size: 20),
      title: Text(
        value,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
