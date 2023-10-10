class Endpoints {
  static String authority = 'api.openweathermap.org';

  static String path = '/data/2.5';

  static String weather = '$path/weather';

  static String iconPath = 'https://openweathermap.org/img/wn';
  static String icon(String icon) => '$iconPath/$icon.png';
}
