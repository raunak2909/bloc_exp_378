abstract class ListEvent{}

class AddMapEvent extends ListEvent{
  Map<String, dynamic> data;
  AddMapEvent({required this.data});
}

class UpdateMapEvent extends ListEvent{
  Map<String, dynamic> data;
  int index;
  UpdateMapEvent({required this.data, required this.index});
}

class DeleteMapEvent extends ListEvent{
  int index;
  DeleteMapEvent({required this.index});
}