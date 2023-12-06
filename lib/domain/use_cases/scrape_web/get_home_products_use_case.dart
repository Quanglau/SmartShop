import 'package:lauquang_doan/data/models/websosanh_home_response.dart';
import 'package:lauquang_doan/data/repositories/scrape_web_repository.dart';
import 'package:lauquang_doan/domain/use_cases/use_case.dart';
import 'package:lauquang_doan/injection.dart';

class GetHomeProductsUseCase
    implements FutureOutputUseCase<WebSoSanhHomeResponse> {
  @override
  Future<WebSoSanhHomeResponse> run() {
    return injector.get<ScrapeWebRepository>().scrapeWebSoSanhHomePage();
  }
}
