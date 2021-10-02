import 'package:flutter/material.dart';
import 'package:mus_greet/pages/home_screen/home_screen.dart';
import 'package:mus_greet/pages/stripe_screen/donation.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key key}) : super(key: key);

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text(
          "Payment Success",
          style: TextStyle(color: Colors.white),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
          ),
         Center(
           child: Image.asset("assets/images/heart.png", height: 200,
             width: 180,),
         ),
          Container(
            child: Text('THANK YOU FOR\n'
                'YOUR DONATION',

              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 2
              ),),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 180),
          child:GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>YourDonation()));
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width-50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.grey, width: 1),
                    right: BorderSide(color: Colors.grey, width: 1),
                    left: BorderSide(color: Colors.grey, width: 1),
                    bottom: BorderSide(color: Colors.grey, width: 1),
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text('Done',

                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
              )
            ),
          ),)
        ],
      ),


    );
  }
}
