import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class CredentialCard extends StatelessWidget {
  final Map<String, String> data;
  const CredentialCard(
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isActive = data["estado"] == "Activo" ? true : false;

    return ExpansionTile(
      title: AutoSizeText(
        data["orgName"]!,
        maxFontSize: 20,
        minFontSize: 16,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: AutoSizeText(
        "Estado: ${data["estado"]!}",
        maxFontSize: 16,
        minFontSize: 14,
        style: const TextStyle(fontSize: 14),
      ),
      textColor: isActive ? Colors.green : Colors.red,
      leading: _StatusIcon(isActive),
      // backgroundColor: colors.primary.shade50,
      children: [_InfoTile(data["vto"]!, "Validez hasta:")],
    );
  }
}

class _StatusIcon extends StatelessWidget {
  final bool isActive;
  const _StatusIcon(this.isActive);

  @override
  Widget build(BuildContext context) {
    late final Color color;

    if (isActive) {
      color = Colors.green;
    } else {
      color = Colors.red;
    }

    return CircleAvatar(
      backgroundColor: color,
      foregroundColor: Colors.white,
      child: isActive
          ? const Icon(Icons.check_rounded)
          : const Icon(Icons.warning_rounded),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String value;
  final String label;
  const _InfoTile(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(label),
          AutoSizeText(value),
        ],
      ),
    );
  }
}
