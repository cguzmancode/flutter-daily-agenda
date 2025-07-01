import 'package:daily_agenda/models/child.dart';
import 'package:daily_agenda/models/event.dart';

final List<Child> mockChildren = [
  Child(
    id: '1',
    name: 'Martina Lopez',
    imageUrl: 'https://randomuser.me/api/portraits/lego/1.jpg',
  ),
  Child(
    id: '2',
    name: 'Julian Lopez',
    imageUrl: 'https://randomuser.me/api/portraits/lego/2.jpg',
  ),
];

final List<Event> mockEvents = [
  Event(
    id: 'e1',
    childId: '1',
    category: 'Feeding',
    description: 'Had toast and orange juice for breakfast',
    time: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  Event(
    id: 'e2',
    childId: '1',
    category: 'Nap',
    description: 'Slept for 1 hour after lunch',
    time: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  Event(
    id: 'e3',
    childId: '2',
    category: 'Activities',
    description: 'Did finger painting in class',
    time: DateTime.now().subtract(const Duration(hours: 3)),
  ),
  Event(
    id: 'e4',
    childId: '1',
    category: 'Diapers',
    description: 'Changed diaper before nap',
    time: DateTime.now().subtract(const Duration(hours: 1, minutes: 30)),
  ),
  Event(
    id: 'e5',
    childId: '1',
    category: 'Notes',
    description: 'Pediatrician appointment next week',
    time: DateTime.now(),
  ),
];
