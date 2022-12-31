part of 'shared.dart';

class Helper {
  static String getCaloriesByDesc(var query) {
    var splitted = query.split('|');
    var substringIdentifier = 'kcal';

    for (var i = 0; i < splitted.length; i++) {
      if (splitted[i].contains(substringIdentifier)) {
        String calorieString = splitted[i];
        return calorieString.replaceAll(' - Calories:', ': ');
      }
    }
    return 'Per 0g - 0kcal';
  }

  static String getBrandNameNonNull(var param) {
    var brandName = (param == null || param == "") ? "" : param + " ";

    return brandName;
  }

  static List<Serving> makeServingList(String dataServing) {
    List<Serving> servingList = [];
    var jobServing = json.decode(dataServing);

    if (jobServing[0] != null) {
      for (var i = 0; i < jobServing.length; i++) {
        var indexedServingJson = json.encode(jobServing[i]);
        Serving data = Serving.fromJson(indexedServingJson);
        servingList.add(data);
      }
    } else {
      var singleServingJson = json.encode(jobServing);
      Serving data = Serving.fromJson(singleServingJson);
      servingList.add(data);
    }

    return servingList;
  }
}
