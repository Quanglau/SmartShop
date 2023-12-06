import 'package:lauquang_doan/data/repositories/scrape_web_repository.dart';
import 'package:lauquang_doan/domain/entities/product.dart';
import 'package:lauquang_doan/domain/use_cases/use_case.dart';
import 'package:lauquang_doan/injection.dart';

class SearchProductListFromUseCase implements FutureUseCase<String, void> {
  @override
  Future<List<Product>> run(String input) async {
    return injector
        .get<ScrapeWebRepository>()
        .scrapeSearchingPage(getQuery(input));
  }

  String getQuery(String input) {
    return input.replaceAll(' ', '+');
  }
}
