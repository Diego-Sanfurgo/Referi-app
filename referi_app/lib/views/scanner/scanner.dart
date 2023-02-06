import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_scanner/mobile_scanner.dart';

import 'bloc/scanner_bloc.dart';
import 'widgets/torch_btn.dart';

class Scanner extends StatelessWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScannerBloc(),
      child: const _ScannerView(),
    );
  }
}

class _ScannerView extends StatelessWidget {
  const _ScannerView();

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

  @override
  void initState() {
    super.initState();
    _cameraController =
        MobileScannerController(formats: [BarcodeFormat.qrCode]);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScannerBloc, ScannerState>(
      builder: (context, state) {
        bool isReading = (state is ScannerReading) ? true : false;
        return Stack(
          children: [
            MobileScanner(
                allowDuplicates: true,
                controller: _cameraController,
                onDetect: (barcode, args) => isReading
                    ? null
                    : BlocProvider.of<ScannerBloc>(context)
                        .add(ReadData(barcode, _cameraController))),
            TorchBtn(_cameraController)
          ],
        );
      },
    );
  }
}
