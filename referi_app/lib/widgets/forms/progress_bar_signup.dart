import 'package:flutter/material.dart';

class ProgressBarSignUp extends StatelessWidget {
  final bool firstCompleted;
  final bool secondCompleted;
  final bool thirdCompleted;
  const ProgressBarSignUp({
    Key? key,
    this.firstCompleted = false,
    this.secondCompleted = false,
    this.thirdCompleted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 64),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _ProgressCircle(firstCompleted),
          _ProgressBarConnector(firstCompleted),
          _ProgressCircle(secondCompleted),
          _ProgressBarConnector(secondCompleted),
          _ProgressCircle(thirdCompleted)
        ],
      ),
    );
  }
}

class _ProgressCircle extends StatelessWidget {
  final bool completed;
  const _ProgressCircle(this.completed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return completed
        ? Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.green),
            child:
                const Icon(Icons.check_rounded, color: Colors.white, size: 32),
          )
        : Container(
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
  final bool completed;
  const _ProgressBarConnector(this.completed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: 80,
      color: completed ? Colors.green : const Color(0xFF77797B),
    );
  }
}
