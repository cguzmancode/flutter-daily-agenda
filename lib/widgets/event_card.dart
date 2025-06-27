import 'package:daily_agenda/models/child.dart';
import 'package:daily_agenda/models/event.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Child child;
  final Event event;

  const EventCard({
    super.key,
    required this.child,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(child.imageUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    child.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event.time.toString(),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(event.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}