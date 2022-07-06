class AssetsController {
  static final AssetsController _instance = AssetsController._internal();

  factory AssetsController() {
    return _instance;
  }

  String getImageDirectory(AssetsType type) {
    switch (type) {
      case AssetsType.NetflixIcon:
        return 'assets/img/ic_netflix.png';
        break;
      case AssetsType.Chameleon:
        return 'assets/img/bg_home.webp';
        break;
    }
  }

  AssetsController._internal();
}

enum AssetsType { NetflixIcon, Chameleon }
