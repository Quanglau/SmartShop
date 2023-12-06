import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:lauquang_doan/data/repositories/firebase_storage_repository.dart';
import 'package:lauquang_doan/data/repositories/firestore_repository.dart';
import 'package:lauquang_doan/data/repositories/scrape_web_repository.dart';
import 'package:lauquang_doan/domain/use_cases/authentication/is_signed_in_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/authentication/sign_in_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/authentication/sign_out_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/authentication/sign_up_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/firebase_storage/upload_avatar_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/firestore/add_favorite_product_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/firestore/get_favorite_products_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/firestore/is_favorite_product_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/firestore/remove_favorite_product_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/scrape_web/get_detail_product_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/scrape_web/get_home_products_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/scrape_web/get_more_product_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/scrape_web/search_product_list_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:lauquang_doan/firebase_options.dart';
import 'package:lauquang_doan/presentation/utilities/enums/scraper.dart';
import 'package:web_scraper/web_scraper.dart';

import 'data/repositories/authentication_repository.dart';

GetIt injector = GetIt.instance;

class AppModules {
  static Future<void> inject() async {
    // Firebase
    final firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final firestore = FirebaseFirestore.instance;
    final firebaseStorage = FirebaseStorage.instance;
    injector.registerLazySingleton<FirebaseAuth>(
        () => FirebaseAuth.instanceFor(app: firebaseApp));

    injector.registerLazySingleton<WebScraper>(
        () => WebScraper(Scraper.search.url),
        instanceName: Scraper.search.name);
    injector.registerLazySingleton<WebScraper>(
        () => WebScraper(Scraper.websosanh.url),
        instanceName: Scraper.websosanh.name);
    //Repositories
    injector.registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepository(injector.get<FirebaseAuth>()));
    injector
        .registerLazySingleton<ScrapeWebRepository>(() => ScrapeWebRepository(
              searchingScraper:
                  injector.get<WebScraper>(instanceName: Scraper.search.name),
              websosanhScraper: injector.get<WebScraper>(
                  instanceName: Scraper.websosanh.name),
            ));
    injector.registerLazySingleton(() => FirestoreRepository(firestore));
    injector.registerLazySingleton(
        () => FirebaseStorageRepository(firebaseStorage));
    //Use Cases
    injector.registerLazySingleton<SearchProductListFromUseCase>(
        () => SearchProductListFromUseCase());
    injector.registerLazySingleton<GetHomeProductsUseCase>(
        () => GetHomeProductsUseCase());
    injector.registerLazySingleton<GetDetailProductUseCase>(
        () => GetDetailProductUseCase());
    injector.registerLazySingleton<GetMoreProductUseCase>(
        () => GetMoreProductUseCase());
    injector.registerLazySingleton<SignInUseCase>(() => SignInUseCase());
    injector.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase());
    injector.registerLazySingleton<SignOutUseCase>(() => SignOutUseCase());
    injector
        .registerLazySingleton<IsSignedInUseCase>(() => IsSignedInUseCase());
    injector.registerLazySingleton(() => AddFavoriteProductUseCase());
    injector.registerLazySingleton(() => IsFavoriteProductUseCase());
    injector.registerLazySingleton(() => GetFavoriteProductsUseCase());
    injector.registerLazySingleton(() => RemoveFavoriteProductUseCase());
    injector.registerLazySingleton(() => UploadAvatarUseCase());
  }
}
