import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:sizer/sizer.dart';

class Scanner extends StatelessWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late final MobileScannerController _cameraController;
  String? _auxCode = '';
  bool canScan = true;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _cameraController =
        MobileScannerController(formats: [BarcodeFormat.qrCode]);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _auxCode = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MobileScanner(
            allowDuplicates: true,
            controller: _cameraController,
            onDetect: (barcode, args) => onDetect(
                  context,
                  barcode: barcode,
                  controller: _cameraController,
                )),
        TorchBtn(_cameraController)
      ],
    );
  }

  onDetect(BuildContext context,
      {required Barcode barcode,
      required MobileScannerController controller}) async {
    if (_auxCode == barcode.rawValue && !canScan) {
      return;
    }

    canScan = false;
    _auxCode = barcode.rawValue;
    timer = Timer(const Duration(seconds: 3), () => canScan = true);

    // bool packageAdded = await ScannerController.addPackage(context, _auxCode);
  }
}

class TorchBtn extends StatelessWidget {
  const TorchBtn(this.cameraController, {Key? key}) : super(key: key);

  final MobileScannerController cameraController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8.h,
      right: 16,
      child: IconButton(
        iconSize: 30.sp,
        color: Colors.white,
        onPressed: () => cameraController.toggleTorch(),
        icon: ValueListenableBuilder(
          valueListenable: cameraController.torchState,
          builder: (context, state, child) {
            switch (state as TorchState) {
              case TorchState.off:
                return const Icon(Icons.flash_off);
              case TorchState.on:
                return const Icon(Icons.flash_on);
            }
          },
        ),
      ),
    );
  }
}
