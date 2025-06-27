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
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Image.network(
            child.imageUrl,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.person_outline,
              size: 48,
              color: Colors.grey,
            ),
          ),
        ),
        title: Text(event.category),
        subtitle: Text('${child.name} - ${event.description}'),
        trailing: Text(
          event.time.toString(),
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}