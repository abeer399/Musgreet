import 'package:flutter/material.dart';

class MosqueDonationDataProvider extends ChangeNotifier {
  var userId;
  var firstName;
  var lastNam;
  var email;
  var donationAmount;
  var frequency;
  var userCoversCost;
  var transactionDat;
  var transactionStatus;
  var nextDonationSate;
  var mosqueId;
  var transactionTime;

  setData1(userId, firstName, lastNam, email) {
    this.userId = userId;
    this.firstName = firstName;
    this.lastNam = lastNam;
    this.email = email;

    notifyListeners();
  }

  setData2(donationAmount, frequency) {
    this.donationAmount = donationAmount;
    this.frequency = frequency;

    notifyListeners();
  }
}
