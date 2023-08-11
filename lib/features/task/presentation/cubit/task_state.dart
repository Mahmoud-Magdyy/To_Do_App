
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
final class GetSelectedDateLoadigState extends TaskState {}
final class GetSelectedDateSuccessState extends TaskState {}


final class ChangeCheckMarkIndexState extends TaskState {}
final class GetColorState extends TaskState {}

final class InsertTaskLoadingState extends TaskState {}
final class InsertTaskSuccessState extends TaskState {}
final class InsertTaskErrorState extends TaskState {}

final class GetTaskLoadingState extends TaskState {}
final class GetTaskSuccessState extends TaskState {}
final class GetTaskErrorState extends TaskState {}

final class UpdateTaskLoadingState extends TaskState {}
final class UpdateTaskSuccessState extends TaskState {}
final class UpdateTaskErrorState extends TaskState {}

final class DeleteTaskLoadingState extends TaskState {}
final class DeleteTaskSuccessState extends TaskState {}
final class DeleteTaskErrorState extends TaskState {}