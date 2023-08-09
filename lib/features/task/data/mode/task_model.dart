class TaskModel {
  final String id;
  final String title;
  final String note;
  final String startTime;
  final String endTime;
  final bool isCompleted;
  final int color;

  TaskModel( 
      {required this.id,
      required this.color,
      required this.title,
      required this.note,
      required this.startTime,
      required this.endTime,
      required this.isCompleted});
  static List<TaskModel> tasksList = [
    TaskModel(
      id: '1',
      title: 'flutter',
      note: 'Learn Dart',
      startTime: '09:22 PM',
      endTime: '10:00 PM',
      isCompleted: false,
      color: 1,
      
    ),
    TaskModel(
      id: '1',
      title: 'front end',
      note: 'Learn HTML',
      startTime: '09:22 AM',
      endTime: '10:00 AM',
      isCompleted: true,
      color: 2,
    )
  ];
}
