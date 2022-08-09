import 'package:flutter/material.dart';

class ProgressBarSignUp extends StatelessWidget {
  const ProgressBarSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 64),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          _ProgressCircle(),
          _ProgressBarConnector(),
          _ProgressCircle(),
          _ProgressBarConnector(),
          _ProgressCircle()
        ],
      ),
    );
  }
}

class _ProgressCircle extends StatelessWidget {
  const _ProgressCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF77797B), width: 2)),
      child: Container(
        width: 10,
        height: 10,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF77797B),
        ),
      ),
    );
  }
}

class _ProgressBarConnector extends StatelessWidget {
  const _ProgressBarConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: 80,
      color: const Color(0xFF77797B),
    );
  }
}