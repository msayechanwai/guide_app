enum Flavor {
  prod,
  uat,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'Guiding App';
      case Flavor.uat:
        return 'Guiding App (UAT)';
      default:
        return 'title';
    }
  }

}
