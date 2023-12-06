import 'package:lauquang_doan/data/models/websosanh_home_response.dart';
import 'package:lauquang_doan/domain/entities/detail_product.dart';
import 'package:lauquang_doan/domain/entities/flash_sale_product.dart';
import 'package:lauquang_doan/domain/entities/product_category.dart';
import 'package:lauquang_doan/domain/entities/product.dart';
import 'package:web_scraper/web_scraper.dart';

class ScrapeWebRepository {
  final WebScraper searchingScraper;
  final WebScraper websosanhScraper;
  ScrapeWebRepository(
      {required this.searchingScraper, required this.websosanhScraper});

  Future<List<Product>> scapeWebSoSanhMoreProductPage(String path) async {
    final loadWebSuccess = await websosanhScraper.loadWebPage(path);
    if (loadWebSuccess) {
      // /html/body/main/div[3]/div[3]/div[3]/div[3]/h2/a/text()
      final nameElements = websosanhScraper.getElementTitle(
        "main > div > div > div > div > h2 > a",
      );
      // /html/body/main/div[3]/div[3]/div[36]/div[3]/div[1]/div
      final priceElements = websosanhScraper.getElementTitle(
        "main > div > div > div > div > div > div",
      );
      // /html/body/main/div[3]/div[3]/div[3]/div[1]/img
      final imageUrlElements = websosanhScraper.getElementAttribute(
        "main > div > div > div > div > img",
        "data-src",
      );
      // /html/body/main/div[3]/div[3]/div[3]/div[3]/div[2]/span
      final shopElements = websosanhScraper.getElementTitle(
        "main > div > div > div > div > div > span.merchant-number",
      );

      // /html/body/main/div[3]/div[3]/div[1]/div[3]/h2/a
      final productUrlElements = websosanhScraper.getElementAttribute(
        "main > div > div > div > div > h2 > a",
        "href",
      );
      final smallestLength = [
        nameElements.length,
        priceElements.length,
        imageUrlElements.length,
        shopElements.length,
        productUrlElements.length,
      ].reduce((value, element) => value < element ? value : element);
      // get l
      //Example smallestLength = 10 then take 10 last elements of each list
      List<Product> products = [];
      for (var i = nameElements.length - smallestLength;
          i < smallestLength;
          i++) {
        products.add(
          Product(
            name: nameElements[i],
            price: conventPrice(priceElements[i]),
            imageUrl: imageUrlElements[i],
            productUrl: convertProductUrl(productUrlElements[i]),
            shop: shopElements[i],
          ),
        );
      }
      return products;
    }
    return [];
  }
  String? convertProductUrl(String? path) {
    // if start with / then delete /
    if (path != null && path.startsWith('/')) {
      return path.substring(1);
    } else {
      return path;
    }
  }
  Future<DetailProduct> scrapeWebSoSanhDetailPage(String path) async {
    var detailProduct = const DetailProduct.empty();
    final loadWebSuccess = await websosanhScraper.loadWebPage(path);
    if (loadWebSuccess) {
      // /html/body/main/div[1]/div[2]/h1
      final nameElements = websosanhScraper.getElementTitle(
        "main > div > div > h1",
      );
      // /html/body/main/div[1]/div[2]/div
      final priceElements = websosanhScraper.getElementTitle(
        "main > div > div.product-detail-info > div",
      );
      // /html/body/main/div[1]/div[1]/div[1]/img
      final imageUrlElements = websosanhScraper.getElementAttribute(
        "main > div > div > div > img",
        "data-src",
      );

      // / html/body/main/div[1]/div[1]/ul/li[1]/img
      var galleryImageUrlElements = websosanhScraper.getElementAttribute(
        "main > div > div > ul > li > img",
        "data-src",
      );

      // /html/body/main/div[1]/div[2]/ul/li[1]/a/div[1]/img
      final compareImageUrlElements = websosanhScraper.getElementAttribute(
        "main > div > div.product-detail-info > ul > li > a > div > img",
        "data-src",
      );
      // /html/body/main/div[1]/div[2]/ul/li[1]/a/div[2]
      final comparePriceElements = websosanhScraper.getElementTitle(
        "main > div > div.product-detail-info > ul > li > a > div.compare-ads-price",
      );

      // /html/body/main/div[1]/div[2]/ul/li[1]/a
      final compareUrlElements = websosanhScraper.getElementAttribute(
        "main > div > div.product-detail-info > ul > li > a",
        "href",
      );

      // /html/body/main/div[2]/div[1]/div[3]/div[1]/div[3]/div/div[9]/div/div[3]/div[1]
      final similarProductsPriceElements = websosanhScraper.getElementTitle(
        "main > div > div > div > div > div > div > div > div > div > div.product-single-price",
      );

      // /html/body/main/div[2]/div[1]/div[3]/div[1]/div[3]/div/div[9]/div/div[3]/div[2]/span
      final similarProductsShopElements = websosanhScraper.getElementTitle(
        "main > div > div > div > div > div > div > div > div > div > div.product-single-merchant",
      );

      // /html/body/main/div[2]/div[1]/div[3]/div[1]/div[3]/div/div[9]/div/div[3]/h3/a
      final similarProductsUrlElements = websosanhScraper.getElementAttribute(
        "main > div > div > div > div > div > div > div > div > div > h3 > a",
        "href",
      );

      // /html/body/main/div[2]/div[1]/div[3]/div[1]/div[3]/div/div[5]/div/div[3]/h3/a
      final similarProductsNameElements = websosanhScraper.getElementTitle(
        "main > div > div > div > div > div > div > div > div > div > h3 > a",
      );

      // /html/body/main/div[2]/div[1]/div[3]/div[1]/div[3]/div/div[5]/div/div[1]/img
      final similarProductsImageElements = websosanhScraper.getElementAttribute(
        "main > div > div > div > div > div > div > div > div > div > img",
        "data-src",
      );
      List<Product> compareProducts = [];
      for (var i = 0; i < compareUrlElements.length; i++) {
        compareProducts.add(
          Product(
            name: '',
            price: comparePriceElements[i],
            imageUrl: compareImageUrlElements[i],
            productUrl: compareUrlElements[i],
            shop: '',
          ),
        );
      }
      List<Product> similarProducts = [];
      for (var i = 0; i < similarProductsNameElements.length; i++) {
        similarProducts.add(
          Product(
            name: similarProductsNameElements[i],
            price: similarProductsPriceElements[i],
            imageUrl: similarProductsImageElements[i],
            productUrl: similarProductsUrlElements[i],
            shop: conventSimilarShopString(similarProductsShopElements[i]),
          ),
        );
      }
      // merge primary image with gallery image
      galleryImageUrlElements.insert(0, imageUrlElements[0]);
      detailProduct = DetailProduct(
        name: nameElements[0],
        price: conventPrice(priceElements[0]),
        galleryImageUrls: galleryImageUrlElements,
        compareProducts: compareProducts,
        similarProducts: similarProducts,
      );
    }
    return detailProduct;
  }

  String? conventSimilarShopString(String? similars) {
    // \n      Có102nơi bán \n  -> 102
    // keep only number
    final firstIndex = similars?.indexOf(RegExp(r'[0-9]')) ?? 0;
    final lastIndex = similars?.lastIndexOf(RegExp(r'[0-9]')) ?? 0;
    return similars?.substring(firstIndex, lastIndex + 1);
  }

  Future<WebSoSanhHomeResponse> scrapeWebSoSanhHomePage() async {
    final productCategories = <ProductCategory>[];
    final flashSaleProducts = <FlashSaleProduct>[];
    final loadWebSuccess = await websosanhScraper.loadWebPage('');
    if (loadWebSuccess) {
      // /html/body/main/div/div[3]/ol/li[1]/text()
      final categoryNameElements = websosanhScraper.getElementTitle(
        "main > div > div > ol > li",
      );
      // /html/body/main/div/div[3]/div[2]/ul/li[1]/div/a/img
      final categoryImageUrlElements = websosanhScraper.getElementAttribute(
        "main > div > div > div > ul > li > div > a > img",
        "data-src",
      );

      ///html/body/main/div/div[3]/div[2]/ul/li[2]/div/div[1]/img
      final productImageUrlElements = websosanhScraper.getElementAttribute(
        "main > div > div > div > ul > li > div > div > img",
        "data-src",
      );
      // /html/body/main/div/div[3]/div[1]/ul/li[2]/div/div[3]/h3/a/text()
      final productNameElements = websosanhScraper.getElementTitle(
        "main > div > div > div > ul > li > div > div > h3 > a",
      );
      // /html/body/main/div/div[3]/div[1]/ul/li[2]/div/div[3]/div[1]/span
      final productPriceElements = websosanhScraper.getElementTitle(
        "main > div > div > div > ul > li > div > div > div > span.product-single-price",
      );
      // /html/body/main/div/div[3]/div[1]/ul/li[2]/div/div[3]/div[2]/span
      final productShopElements = websosanhScraper.getElementTitle(
        "main > div > div > div > ul > li > div > div > div > span:nth-child(1)",
      );
      // /html/body/main/div/div[3]/div[1]/ul/li[2]/div/div[3]/h3/a
      final productUrlElements = websosanhScraper.getElementAttribute(
        "main > div > div > div > ul > li > div > div > h3 > a",
        "href",
      );
      // /html/body/main/div/div[3]/div[1]/div/button
      final viewMoreProductUrlElements = websosanhScraper.getElementAttribute(
        "button[aria-label='xem thêm']",
        "onclick",
      );
      List<Product> products = [];
      for (var i = 0; i < productNameElements.length; i++) {
        products.add(
          Product(
            name: productNameElements[i],
            price: productPriceElements[i],
            imageUrl: productImageUrlElements[i],
            productUrl: productUrlElements[i],
            shop: productShopElements[i],
          ),
        );
      }
      for (var i = 0; i < categoryNameElements.length; i++) {
        // each category has products.length / categoryNameElements.length products
        productCategories.add(
          ProductCategory(
            name: categoryNameElements[i],
            imageUrl: categoryImageUrlElements[i],
            products: products.sublist(
              i * (products.length ~/ categoryNameElements.length),
              (i + 1) * (products.length ~/ categoryNameElements.length),
            ),
            seeMoreUrl: conventSeeMoreUrl(viewMoreProductUrlElements[i]),
          ),
        );
      }
      // /html/body/main/div/div[2]/div[2]/div[1]/div[1]/img
      final flashSaleImageUrlElements = websosanhScraper.getElementAttribute(
        "main > div > div > div > div > div > img",
        "data-src",
      );
      // /html/body/main/div/div[2]/div[2]/div[1]/div[3]/h3/a
      final flashSaleProductUrlElements = websosanhScraper.getElementAttribute(
        "main > div > div > div > div > div > h3 > a",
        "href",
      );
      // /html/body/main/div/div[2]/div[2]/div[1]/div[3]/h3/a/text()
      final flashSaleNameElements = websosanhScraper.getElementTitle(
        "main > div > div > div > div > div > h3 > a",
      );

      // /html/body/main/div/div[2]/div[2]/div[1]/div[3]/div[1]/span[1]
      final flashSalePriceElements = websosanhScraper.getElementTitle(
        "main > div > div > div > div > div > div > span.product-single-price",
      );
      // /html/body/main/div/div[2]/div[2]/div[1]/div[3]/div[1]/span[2]
      final flashSaleOriginalPriceElements = websosanhScraper.getElementTitle(
        "main > div > div > div > div > div > div > span.product-single-original-price",
      );
      // /html/body/main/div/div[2]/div[2]/div[2]/div[3]/div[2]
      // final flashSaleShopElements = websosanhHomeScraper.getElementTitle(
      //   "main > div > div > div > div > div > div.product-single-merchant direct",
      // );
      for (var i = 0; i < flashSaleNameElements.length; i++) {
        flashSaleProducts.add(
          FlashSaleProduct(
            name: flashSaleNameElements[i],
            price: conventPrice(flashSalePriceElements[i]),
            imageUrl: flashSaleImageUrlElements[i],
            productUrl: flashSaleProductUrlElements[i],
            salePrice: conventPrice(flashSaleOriginalPriceElements[i]),
            shop: '',
          ),
        );
      }
    }
    return WebSoSanhHomeResponse(
      flashSaleProducts: flashSaleProducts,
      productCategories: productCategories,
    );
  }
  String? conventSeeMoreUrl(String? url) {
    //location.href='dien-thoai-may-tinh-bang/cat-85.htm' -> dien-thoai-may-tinh-bang/cat-85
    // start after ' and end before '
    final firstIndex = url?.indexOf('\'') ?? 0;
    final lastIndex = url?.lastIndexOf('\'') ?? 0;
    return url?.substring(firstIndex + 1, lastIndex);
  }

  String? conventPrice(String? price) {
    //       /n          374.500 đ/n   -> 374.500 đ
    // first index start by number
    final firstIndex = price?.indexOf(RegExp(r'[0-9]')) ?? 0;
    return price?.substring(firstIndex, price.indexOf('đ') + 1);
  }

  Future<List<Product>> scrapeSearchingPage(String query) async {
    List<Product> products = [];
    if (await searchingScraper.loadWebPage('/search?q=$query&tbm=shop')) {
      List<String?> imageElements = searchingScraper.getElementAttribute(
        "div.xcR77 > div.u30d4 > div.eUQRje > a > div.oR27Gd > img",
        "src",
      );
      List<String?> productUrlElements = searchingScraper.getElementAttribute(
        "div.xcR77 > div.u30d4 > div.eUQRje > a",
        "href",
      );
      List<String?> nameElements = searchingScraper.getElementTitle(
        "div.xcR77 > div.u30d4 > div.P8xhZc > div.rgHvZc > a",
      );
      List<String?> priceElements = searchingScraper.getElementTitle(
        "div.xcR77 > div.u30d4 > div.P8xhZc > div.dD8iuc > span.HRLxBb",
      );
      List<String?> shopElements = searchingScraper.getElementTitle(
        "div.xcR77 > div.u30d4 > div.P8xhZc > div.dD8iuc",
      );
      final filteredShopElements = filterShopElements(shopElements);
      for (var i = 0; i < nameElements.length; i++) {
        products.add(
          Product(
            name: nameElements[i],
            price: priceElements[i],
            imageUrl: imageElements[i],
            productUrl: conventProductLink(productUrlElements[i]),
            shop: filteredShopElements[i],
          ),
        );
      }
    }
    return products;
  }

  List<String?> filterShopElements(List<String?> shopElements) {
    List<String?> filteredShopElements = [];
    for (var shopElement in shopElements) {
      if (shopElement != null) {
        if (shopElement.contains('từ')) {
          filteredShopElements.add(shopElement);
        }
      }
    }
    // remove price from shop element : 11.990.000 ₫ từ digiphone => digiphone
    for (var i = 0; i < filteredShopElements.length; i++) {
      filteredShopElements[i] = filteredShopElements[i]
          ?.substring(filteredShopElements[i]!.indexOf('từ') + 3);
    }

    return filteredShopElements;
  }

  String? removeRedundantPartProductUrl(String? productUrl) {
    //url?q=https://24hstore.vn/iphone-14-cu/iphone-14-128gb-cu-chinh-hang-p8321%3Fsrsltid%3DAfmBOopO7CJIENHvfGCVgAgCXms7YwB9KIs71hxl4Kds2YakNG3FAQ7FGdM&opi=95576897&sa=U&ved=0ahUKEwj8rp2VwbeCAxW8r1YBHb0kDeEQ1SkIqAE&usg=AOvVaw1wtme0oytOJOq-61yKepxj
    int startIndex = 0;
    if (productUrl != null) {
      if (productUrl.contains('url?q=')) {
        startIndex = productUrl.indexOf('url?q=') + 6;
      }
      // just take before % or &
      if (productUrl.contains('%')) {
        return productUrl.substring(startIndex, productUrl.indexOf('%'));
      }
      if (productUrl.contains('&')) {
        return productUrl.substring(startIndex, productUrl.indexOf('&'));
      }
    }
    return productUrl;
  }

  String? conventProductLink(String? url) {
    final newUrl = removeRedundantPartProductUrl(url);
    if (newUrl != null && newUrl.contains('shopee.vn')) {
      //cut from / after https://shopee.vn
      final trailingIndex = newUrl.indexOf('/', 12);
      // insert to convert to universal link : https://shopee.vn/.... to https://shopee.vn/universal-link/.....
      return 'https://shopee.vn/universal-link/${newUrl.substring(trailingIndex + 1)}';
    }
    if (newUrl != null && newUrl.contains('lazada.vn')) {
      //cut from / after https://lazada.vn
      final trailingIndex = newUrl.indexOf('/', 12);
      // insert to convert to universal link : https://lazada.vn/.... to https://lazada.vn/universal-link/.....
      return 'https://lazada.vn/universal-link/${newUrl.substring(trailingIndex + 1)}';
    }

    return newUrl;
  }
}
