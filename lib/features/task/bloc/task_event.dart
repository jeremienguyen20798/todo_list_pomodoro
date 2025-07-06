abstract class TaskEvent {}

class OnSaveTaskEvent extends TaskEvent {
  
  final String taskContent;
  
  OnSaveTaskEvent(this.taskContent);
}
