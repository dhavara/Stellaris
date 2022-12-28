part of 'shared.dart';

class Helper {
  static String getCaloriesByDesc(var query) {
    var splitted = query.split(' ');
    var substringIdentifier = 'kcal';

    for (var i = 0; i < splitted.length; i++) {
      if (splitted[i].contains(substringIdentifier)) {
        return splitted[i];
      }
    }
    return '0kcal';
  }

  static String getBrandNameNonNull(var param) {
    var brandName = param == null ? "" : param + " ";

    return brandName;
  }
}
