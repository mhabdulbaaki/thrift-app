import 'dart:io';

class Posts {
  String title;
  String description;
  String _imagePath;
  Map location;
  String category;
  DateTime _dateTime;

  Posts();

  void setImagePath(String imagePath) {
    this._imagePath = imagePath;
  }

  get getImageFile => File(this._imagePath);

  void setDateTime(DateTime dateTime) {
    this._dateTime = dateTime;
  }

  get getDateTime => this._dateTime;

  void setTitle(String title) {
    this.title = title;
  }

  get getTitle => this.title;

  void setDescription(String desc) {
    this.description = desc;
  }

  get getDescription => this.description;
}
