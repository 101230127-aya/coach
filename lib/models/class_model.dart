enum ClassType {
  beginner,
  intermediate,
  advanced,
}

class ClassModel {
  final int id;
  final String name;
  final ClassType type; 
  final List<String> students;

  ClassModel({
    required this.id,
    required this.name,
    required this.type,
    this.students = const [],
  });
}
