import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:referi_app/models/enrollment.dart';

import '../bloc/activity_detail_enrolled_bloc.dart';

class ActivityStatus extends StatefulWidget {
  final Enrollment enrollment;
  const ActivityStatus(this.enrollment, {super.key});

  @override
  State<ActivityStatus> createState() => _ActivityStatusState();
}

class _ActivityStatusState extends State<ActivityStatus> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ActivityDetailEnrolledBloc>(context)
        .add(LoadStatusEvent(widget.enrollment));
  }

  @override
  Widget build(BuildContext context) {
    Widget statusInfo =
        BlocBuilder<ActivityDetailEnrolledBloc, ActivityDetailEnrolledState>(
      buildWhen: (previous, current) {
        if (current is FailedToLoadStatus || current is ActivityStatusLoaded) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is ActivityStatusLoaded) {
          return _StatusInfo(state.statusData);
        } else {
          return const Text("No se pudo determinar el estado");
        }
      },
    );
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AutoSizeText(
              "Estado",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            statusInfo
            // _StatusInfo(state.statusData),
          ],
        ),
      ),
    );
  }
}

class _StatusInfo extends StatelessWidget {
  final Map<String, String> statusData;
  const _StatusInfo(this.statusData);

  @override
  Widget build(BuildContext context) {
    bool isExpired = statusData["estado"] == "Deuda" ? true : false;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isExpired
                        ? Colors.red.shade400
                        : Colors.green.shade400),
              ),
              const SizedBox(width: 8),
              Text(statusData["estado"]!),
            ],
          ),
          const SizedBox(height: 8),
          Text("Vencimiento: ${statusData["vto"]}")
        ],
      ),
    );
  }
}
