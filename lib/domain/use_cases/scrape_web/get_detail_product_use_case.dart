import 'package:lauquang_doan/data/repositories/scrape_web_repository.dart';
import 'package:lauquang_doan/domain/entities/detail_product.dart';
import 'package:lauquang_doan/domain/use_cases/use_case.dart';
import 'package:lauquang_doan/injection.dart';

class GetDetailProductUseCase implements FutureUseCase<String?, void> {
  @override
  Future<DetailProduct> run(String? input) {
    return injector
        .get<ScrapeWebRepository>()
        .scrapeWebSoSanhDetailPage(input ?? '');
  }
}
