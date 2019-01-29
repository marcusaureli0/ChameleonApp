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
        return 'assets/img/chameleon1.webp';
        break;
    }
  }

  AssetsController._internal();
}

enum AssetsType { NetflixIcon, Chameleon }
