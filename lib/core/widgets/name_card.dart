import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quran_reader_app/data/models/names.dart';

class NameCard extends StatelessWidget {
  final Name name;
  const NameCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: theme.background),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: theme.primaryContainer),
                child: Text(name.id),
              ),
              const Gap(12),
              Expanded(
                child: Text(
                  name.enName,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Gap(8),
              Text(
                name.arName,
                style: const TextStyle(fontFamily: "Majeed", fontSize: 20),
              ),
            ],
          ),
          const Divider(),
          Text(
            name.meaning,
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            name.explanation,
            style: TextStyle(color: theme.onSurface.withOpacity(0.8)),
          ),
          const Divider(),
          Text(
            name.benefit,
            style: TextStyle(color: theme.onSurface.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }
}
