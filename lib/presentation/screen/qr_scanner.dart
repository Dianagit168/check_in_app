import 'package:check_in_app/index.dart';

class ScanQr extends StatefulWidget {

  final String eventTitle;

  const ScanQr({Key? key, required this.eventTitle}) : super(key: key);

  @override
  ScanQrState createState() => ScanQrState();
}

class ScanQrState extends State<ScanQr> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  
  QRViewController? _qrViewController;

  bool _flashOn = false;
  
  bool isScanning = true;

  void _onQrViewCreated(QRViewController controller) {
    _qrViewController = controller;

    try {
      _qrViewController!.scannedDataStream.listen((event) {
        if (isScanning) {

          _qrViewController!.pauseCamera().then((value) async {

            isScanning = false; // Set the flag to false to indicate scanning has occurred

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => 
                const RedeemTicketScreen(),
              )
            );
            
          }).whenComplete(() {
            // Resume camera after processing the event
            _qrViewController!.resumeCamera().then((value) => isScanning = true);
          });
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print("QR create error: $e");
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _qrViewController!.stopCamera();
    _qrViewController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: normalAppBar(context, titleAppbar: "Run With Sai"),
      body: Stack(
        children: [
          QRView(
            cameraFacing: CameraFacing.back,
            key: qrKey,
            onQRViewCreated: _onQrViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Theme.of(context).primaryColor,
              borderRadius: 25,
              borderLength: 36,
              cutOutSize: MediaQuery.of(context).size.width / 1.25,
              cutOutBottomOffset: MediaQuery.of(context).size.height / 20
            ),
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height / 4.5,
            left: MediaQuery.of(context).size.width / 2.25,
            child: IconButton(
              onPressed: () {
                debugPrint("Controller is dead?: $_qrViewController");
                _qrViewController!.toggleFlash();
                setState(() {
                  _flashOn = !_flashOn;
                });
              },
              color: Colors.white,
              iconSize: 36,
              icon: Icon(_flashOn ? Icons.flash_on : Icons.flash_off),
              alignment: Alignment.center,
            ),
          )
        ],
      ),
    );
  }
}