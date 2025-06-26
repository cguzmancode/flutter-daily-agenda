class Event {
  final String id;
  final String childId;
  final String category;
  final String description;
  final DateTime time;

  Event({
    required this.id,
    required this.childId,
    required this.category,
    required this.description,
    required this.time,
  });
}
