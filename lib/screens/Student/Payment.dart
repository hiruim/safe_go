import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:safe_go/screens/Student/StudentHome.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  TextEditingController amountController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController SnameController = TextEditingController();
  // ignore: deprecated_member_use
  final DatabaseReference _paymentRef =
      FirebaseDatabase.instance.reference().child('payments');

  bool showAmountError = false;
  bool showCardNumberError = false;
  bool showExpiryDateError = false;
  bool showCVVError = false;

  String? validateAmount(String value) {
    if (value.isEmpty) {
      return 'Please enter the amount';
    }
    // You can add more complex validation logic here if needed
    return null;
  }

  String? validateCardNumber(String value) {
    if (value.isEmpty) {
      return 'Please enter the card number';
    }
    // You can add more complex validation logic here if needed
    return null;
  }

  String? validateExpiryDate(String value) {
    if (value.isEmpty) {
      return 'Please enter the expiry date';
    }
    // You can add more complex validation logic here if needed
    return null;
  }

  String? validateCVV(String value) {
    if (value.isEmpty) {
      return 'Please enter the CVC';
    }
    // You can add more complex validation logic here if needed
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Payment'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentHome(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                maxLength: 20,
                decoration: InputDecoration(hintText: "Student Name"),
                controller: SnameController,
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount to be Paid',
                  hintText: 'Enter the amount',
                  errorText: showAmountError
                      ? validateAmount(amountController.text)
                      : null,
                ),
                onChanged: (value) {
                  setState(() {
                    showAmountError = false;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Total Amount: \Rs.${amountController.text.isEmpty ? '0.00' : amountController.text}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: cardNumberController,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  hintText: 'Enter your card number',
                  errorText: showCardNumberError
                      ? validateCardNumber(cardNumberController.text)
                      : null,
                ),
                onChanged: (value) {
                  setState(() {
                    showCardNumberError = false;
                  });
                },
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: expiryDateController,
                      decoration: InputDecoration(
                        labelText: 'Expiry Date',
                        hintText: 'MM/YY',
                        errorText: showExpiryDateError
                            ? validateExpiryDate(expiryDateController.text)
                            : null,
                      ),
                      onChanged: (value) {
                        setState(() {
                          showExpiryDateError = false;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: cvvController,
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        hintText: '123',
                        errorText: showCVVError
                            ? validateCVV(cvvController.text)
                            : null,
                      ),
                      onChanged: (value) {
                        setState(() {
                          showCVVError = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Validation before processing the payment
                  {
                    // Add your payment logic here
                    // You can access the entered amount using amountController.text
                    // Example: double amount = double.parse(amountController.text);

                    // Store payment information in Firebase Realtime Database
                    _paymentRef.push().set({
                      'studentName': SnameController.text,
                      'amount': amountController.text,
                      'cardNumber': cardNumberController.text,
                      'expiryDate': expiryDateController.text,
                      'cvv': cvvController.text,
                    });

                    PaymentNotificationDialog.showPaymentNotification(
                        context,
                        SnameController,
                        amountController,
                        cardNumberController,
                        expiryDateController,
                        cvvController);
                  }
                },
                child: Text('Make Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentNotificationDialog {
  static void showPaymentNotification(
      BuildContext context,
      TextEditingController SnameController,
      TextEditingController amountController,
      TextEditingController cardNumberController,
      TextEditingController expiryDateController,
      TextEditingController cvvController) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Payment Successful"),
          content: Text("Your payment has been successfully processed."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                // Clear input fields
                SnameController.clear();
                amountController.clear();
                cardNumberController.clear();
                expiryDateController.clear();
                cvvController.clear();

                // Navigate back to StudentHome
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => StudentHome()),
                  (route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
