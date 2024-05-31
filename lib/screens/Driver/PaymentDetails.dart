import 'package:flutter/material.dart';

class PDetails extends StatefulWidget {
  const PDetails({Key? key}) : super(key: key);

  @override
  State<PDetails> createState() => _PDetailsState();
}

class _PDetailsState extends State<PDetails> {
  // Sample payment data
  List<Map<String, dynamic>> payments = [
    {
      'cardHolderName': "Hirusha's father",
      'cardNumber': '**** **** **** 1234',
      'price': 5000
    },
    {
      'cardHolderName': "kavisha's Mom",
      'cardNumber': '**** **** **** 2010',
      'price': 3000
    },
    {
      'cardHolderName': "Gayan's Mom",
      'cardNumber': '**** **** **** 6056',
      'price': 2600
    },
    {
      'cardHolderName': "rakitha's Brother",
      'cardNumber': '**** **** **** 1364',
      'price': 7540
    },
    {
      'cardHolderName': "Sashini's Mom",
      'cardNumber': '**** **** **** 7648',
      'price': 1000
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: payments.length,
        itemBuilder: (context, index) {
          var payment = payments[index];
          return ListTile(
            title: Text(
              'Card Holder: ${payment['cardHolderName']}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              'Card Number: ${payment['cardNumber']}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            trailing: Text(
              'Price: LKR ${payment['price']}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}
