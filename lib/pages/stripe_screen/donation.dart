import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mus_greet/core/services/stripe_services/payment-service.dart';
import 'package:mus_greet/pages/stripe_screen/donation_fee.dart';
import 'package:progress_dialog/progress_dialog.dart';

class YourDonation extends StatefulWidget {
  const YourDonation({Key key}) : super(key: key);

  @override
  _YourDonationState createState() => _YourDonationState();
}

class _YourDonationState extends State<YourDonation> {
  final paymentController = TextEditingController();
  bool viewObject = true;
  final List money = ["£5", "£10", "£15", "£50"];
  final List moneey = ["5", "10", "15", "50"];

  List checkColor = [0, 0, 0, 0];
  List pay = ["One-off-payment", "Each-month"];
  List check = [0, 0, 0, 0];
  bool isSelected = true;
  final List yourText = ["£5", "£5", "£5", "£5"];

  changeStyle() {
    setState(() {
      viewObject = false;
    });
  }

  void listenNotifications() {
    // NotificationApi.onNotification.stream.listen(onClickedNotification);
  }

  void onClickedNotification(String payload) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => YourDonation()));
  }

  @override
  void initState() {
    // NotificationApi.init();
    listenNotifications();
    StripeService.init();
    super.initState();
  }

  payViaNewCard(BuildContext context) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Please wait...');
    await dialog.show();
    var response = await StripeService.payWithNewCard(
        amount: paymentController.text, currency: 'GBP');
    await dialog.hide();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.message),
      duration:
          new Duration(milliseconds: response.success == true ? 1200 : 3000),
    ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(
          "Your Donation",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Its time to give Lilah/Donation',
                  style: TextStyle(
                    color: Color(0xff1d3a49),
                    fontSize: 18,
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 10, top: 15),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: money.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            // height: 60,
                            margin: EdgeInsetsDirectional.only(start: 10),
                            child: GestureDetector(
                              onTap: () {
                                changeStyle();
                                checkColor = [0, 0, 0, 0];
                                checkColor[index] = 1;
                                final yoursText = "${moneey[index]}";
                                paymentController.clear();
                                paymentController.value =
                                    paymentController.value.copyWith(
                                  text: paymentController.text + yoursText,
                                  selection: TextSelection.collapsed(
                                    offset: paymentController
                                            .value.selection.baseOffset +
                                        yoursText.length,
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: checkColor[index] != 1
                                        ? Colors.white
                                        : Colors.green,
                                    border: Border(
                                      top: BorderSide(
                                          color: Colors.grey, width: 1),
                                      right: BorderSide(
                                          color: Colors.grey, width: 1),
                                      left: BorderSide(
                                          color: Colors.grey, width: 1),
                                      bottom: BorderSide(
                                          color: Colors.grey, width: 1),
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    money[index],
                                    style: TextStyle(
                                        color: checkColor[index] != 1
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Text(
                  'Other amount',
                  style: TextStyle(
                    color: Color(0xff1d3a49),
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: paymentController,
                  keyboardType: TextInputType.number,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixText: "£",
                    hintText: "150",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(20),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Frequency',
                  style: TextStyle(
                    color: Color(0xff1d3a49),
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 7, top: 15),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: pay.length,
                      physics: NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            changeStyle();
                            check = [0, 0, 0, 0];
                            check[index] = 1;
                          },
                          child: Center(
                            child: Container(
                                margin: EdgeInsetsDirectional.only(start: 10),
                                height: 70,
                                width: 160,
                                decoration: BoxDecoration(
                                    color: check[index] != 1
                                        ? Colors.white
                                        : Colors.green,
                                    border: Border(
                                      top: BorderSide(
                                          color: Colors.grey, width: 1),
                                      right: BorderSide(
                                          color: Colors.grey, width: 1),
                                      left: BorderSide(
                                          color: Colors.grey, width: 1),
                                      bottom: BorderSide(
                                          color: Colors.grey, width: 1),
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    pay[index],
                                    style: TextStyle(
                                        color: check[index] != 1
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                )),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  width: width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Continue"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // payViaNewCard(context);
                    // paymentController.clear();
                    // Duration(
                    //   milliseconds: 5000,
                    // );
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => DonationFee()));
                  },
                  child: Container(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
