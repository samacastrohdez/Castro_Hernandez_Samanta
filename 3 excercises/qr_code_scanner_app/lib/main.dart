import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(QRCodeScannerApp());

class QRCodeScannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QRCodeScannerPage(),
    );
  }
}

class QRCodeScannerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Codigo de prueba qr"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (QRViewController controller) {
                controller.scannedDataStream.listen((scanData) {
                  setState(() {
                    result = scanData;
                  });
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: result != null
                  ? Text(
                      'Código QR escaneado: ${result!.code}',
                      style: TextStyle(fontSize: 20),
                    )
                  : Text(
                      "Escanea un código QR",
                      style: TextStyle(fontSize: 20),
                    ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (result != null) {
                Fluttertoast.showToast(
                  msg: 'Información del QR: ${result!.code}',
                  toastLength: Toast.LENGTH_LONG,
                );
              } else {
                Fluttertoast.showToast(
                  msg: 'No se ha escaneado ningún QR',
                  toastLength: Toast.LENGTH_LONG,
                );
              }
            },
            child: Text('Mostrar Información'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
