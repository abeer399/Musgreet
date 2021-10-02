import "package:flutter/material.dart";
import 'package:mus_greet/pages/stripe_screen/success_payment.dart';

class DonationFee extends StatefulWidget {
  const DonationFee({Key key}) : super(key: key);

  @override
  _DonationFeeState createState() => _DonationFeeState();
}

class _DonationFeeState extends State<DonationFee> {

  bool value = false;
  bool val = false;


  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(start: 15, top: 35),
              child: Text(
                'Its time to give Lilah/Donation',
                style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 15, top: 25),
              child: Text(
                'We use up to 10% of your Donation to cover the costs of distributing '
                    'it accurately and effectively.If you\nprefer 100% of your Donation'
                    'to go directly to those\nwho needed it, you can give a voluntary\n(Sadaqah)'
                    'add-on to cover the cost instead',
                maxLines: 5,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              height: 70,
              width: MediaQuery.of(context).size.width-30,
              decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey, width: 1),
                    right:
                    BorderSide(color: Colors.grey, width: 1),
                    left:
                    BorderSide(color: Colors.grey, width: 1),
                    bottom:
                    BorderSide(color: Colors.grey, width: 1),
                  ),
                  borderRadius: BorderRadius.circular(15)),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child:Checkbox(
                      value: val,
                      shape: ShapeBorder.lerp(CircleBorder(), CircleBorder(), 1),
                      splashRadius: 20,
                      onChanged: (val){
                        setState(() {
                          this.val = val;
                        });
                      },
                      activeColor: Colors.green[700],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    //margin: EdgeInsetsDirectional.only(bottom: 25),
                    child: Text("mus greet can use up to 10% of my\n"
                        "Donation to cover costs, leaving £45.00\nfor who need it   ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],

              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              height: 70,
              width: MediaQuery.of(context).size.width-30,
              decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey, width: 1),
                    right:
                    BorderSide(color: Colors.grey, width: 1),
                    left:
                    BorderSide(color: Colors.grey, width: 1),
                    bottom:
                    BorderSide(color: Colors.grey, width: 1),
                  ),
                  borderRadius: BorderRadius.circular(15)),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child:Checkbox(
                      value: value,
                      shape: ShapeBorder.lerp(CircleBorder(), CircleBorder(), 1),
                      splashRadius: 20,
                      onChanged: (value){
                        setState(() {
                          this.value = value;
                        });
                      },
                      activeColor: Colors.green[700],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    //margin: EdgeInsetsDirectional.only(bottom: 25),
                    child: Text("I'll add £5.00 to cover costs so 100%\nof my"
                        " Donation goes to those who\nneeded it",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                ],

              ),
            ),
            SizedBox(
              height: 180,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentSuccess()));
              },
              child: Container(
                margin: EdgeInsetsDirectional.only(start: 27),
                height: 50,
                width:MediaQuery.of(context).size.width-50,
                decoration: BoxDecoration(
                    color: Colors.green[700],
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 1),
                      right: BorderSide(color: Colors.grey, width: 1),
                      left: BorderSide(color: Colors.grey, width: 1),
                      bottom: BorderSide(color: Colors.grey, width: 1),
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
