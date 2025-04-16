import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGeneratorScreen extends StatefulWidget {
  const QRCodeGeneratorScreen({super.key});

  @override
  QRCodeGeneratorScreenState createState() => QRCodeGeneratorScreenState();
}

class QRCodeGeneratorScreenState extends State<QRCodeGeneratorScreen> {
  String text = "Enter some text to generate QR Code";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Generator"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter text to generate QR',
              ),
              onChanged: (value) {
                setState(() {
                  text = value;
                });
              },
            ),
            const SizedBox(height: 40),
            if (text.isNotEmpty)
              QrImageView(
                data: text,
                version: QrVersions.auto,
                size: 200.0,
              ),
          ],
        ),
      ),
    );
  }
}




