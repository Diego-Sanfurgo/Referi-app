import 'package:flutter/material.dart';

import 'package:mobile_scanner/mobile_scanner.dart';

class TorchBtn extends StatelessWidget {
  const TorchBtn(this.cameraController, {Key? key}) : super(key: key);

  final MobileScannerController cameraController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      right: 16,
      child: IconButton(
        iconSize: 40,
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
