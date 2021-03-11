import 'package:thrift_app/res/numerical_vals.dart';

class Validator {
  static String titleValidator(title) {
    if (title == null || title.length < titleLength) {
      return 'title can\'t be empty or less than $titleLength characters';
    }
    return null;
  }

  static String descriptionValidator(desc) {
    if (desc == null || desc.length < descriptionLength) {
      return 'description should be at least $descriptionLength characters';
    }
    return null;
  }
}
