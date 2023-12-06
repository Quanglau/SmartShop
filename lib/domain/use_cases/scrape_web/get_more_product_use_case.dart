import 'package:lauquang_doan/data/repositories/scrape_web_repository.dart';
import 'package:lauquang_doan/domain/entities/product.dart';
import 'package:lauquang_doan/domain/use_cases/use_case.dart';
import 'package:lauquang_doan/injection.dart';

class GetMoreProductUseCase implements FutureUseCase<String, List<Product>> {
  @override
  Future<List<Product>> run(String input) {
    return injector
        .get<ScrapeWebRepository>()
        .scapeWebSoSanhMoreProductPage(input);
  }
}
