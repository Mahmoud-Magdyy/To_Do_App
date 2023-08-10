
sealed class TaskState {}

final class TaskInitial extends TaskState {}
final class GetDateLoading extends TaskState {}
final class GetDateSuccess extends TaskState {}
final class GetDateError extends TaskState {}
final class GetStartDateError extends TaskState {}
final class GetStartDateSuccess extends TaskState {}
final class GetStartDateLoading extends TaskState {}
final class GetEndDateLoading extends TaskState {}
final class GetEndDateSuccess extends TaskState {}
final class GetEndDateError extends TaskState {}
final class ChangeCheckMarkIndexState extends TaskState {}
final class GetColorState extends TaskState {}

final class InsertTaskLoadingState extends TaskState {}
final class InsertTaskSuccessState extends TaskState {}
final class InsertTaskErrorState extends TaskState {}

