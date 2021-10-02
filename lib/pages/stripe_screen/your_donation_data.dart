// import 'package:amplify_datastore/amplify_datastore.dart';
// import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mus_greet/pages/stripe_screen/donation.dart';
import 'package:mus_greet/provider/mosque_donation_data.dart';
import 'package:mus_greet/provider/user_data_provider.dart';
// import 'package:mus_greet/models/MosqueDonations.dart';
import 'package:provider/provider.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({Key key}) : super(key: key);

  @override
  _DonationScreenState createState() => _DonationScreenState();
}

TextEditingController firstName = TextEditingController();
TextEditingController lastName = TextEditingController();
TextEditingController email = TextEditingController();

final _formKey = GlobalKey<FormState>();

class _DonationScreenState extends State<DonationScreen> {
  var data;
  @override
  void initState() {
    super.initState();
    data = context.read<UserDataProvider>().userData;
    print("id of user: ${data.id}");

    firstName.text = data.first_name;
    lastName.text = data.last_name;
    email.text = data.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Your Donation",
          style: TextStyle(color: Colors.black),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(scrollDirection: Axis.vertical, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(start: 20, top: 30),
                child: Text(
                  "Enter Your Details",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 20),
                width: MediaQuery.of(context).size.width - 40,
                child: TextFormField(
                  autofillHints: [AutofillHints.name],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: firstName,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Your Name",
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 20),
                width: MediaQuery.of(context).size.width - 40,
                child: TextFormField(
                  autofillHints: [AutofillHints.name],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: lastName,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Last Name",
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 20),
                width: MediaQuery.of(context).size.width - 40,
                child: TextFormField(
                  autofillHints: [AutofillHints.email],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    labelText: "Email",
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    context
                        .read<MosqueDonationDataProvider>()
                        .setData1(data.id, firstName, lastName, email);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => YourDonation()));
                  }
                },
                child: Container(
                  margin: EdgeInsetsDirectional.only(start: 100),
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border(
                        top: BorderSide(color: Colors.grey, width: 1),
                        right: BorderSide(color: Colors.grey, width: 1),
                        left: BorderSide(color: Colors.grey, width: 1),
                        bottom: BorderSide(color: Colors.grey, width: 1),
                      ),
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                    margin: EdgeInsetsDirectional.only(top: 13, start: 52),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
