import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  // late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Scanner"),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          // Expanded(
          //   flex: 4,
          //   child: QRView(
          //     key: qrKey,
          //     onQRViewCreated: _onQRViewCreated,
          //   ),
          // ),
        ],
      ),
    );
  }

  // void _onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     _handleScanData(scanData as QRCode?);
  //   });
  // }

  void _handleScanData(QRCode? scanData) {
    if (scanData != null) {
      // Handle the scanned data, for example, navigate to a new screen
      String code = scanData.code ?? '---';
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            code: code,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }
}

mixin QRCode {
  get code => null;
}

class ResultScreen extends StatelessWidget {
  final String code;

  const ResultScreen({Key? key, required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan Result"),
      ),
      body: Center(
        child: Text("Scanned QR Code: $code"),
      ),
    );
  }
}
