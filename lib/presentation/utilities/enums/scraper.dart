enum Scraper {
  search,
  websosanh,
}

extension ScraperExtension on Scraper {
  String get url {
    switch (this) {
      case Scraper.search:
        return 'https://www.google.com';
      case Scraper.websosanh:
        return 'https://websosanh.vn/';
      default:
        return '';
    }
  }

  String get name {
    switch (this) {
      case Scraper.search:
        return 'searching';
      case Scraper.websosanh:
        return 'websosanhHome';
      default:
        return '';
    }
  }
}
