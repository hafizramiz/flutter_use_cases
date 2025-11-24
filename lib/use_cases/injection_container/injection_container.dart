// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:zugi/data/services/local/local_database_service.dart';
//
// import 'app_config.dart';
//
// // final getIt = GetIt.instance;
//
// Future<void> configureDependencies({required String environment}) async {
//   if (environment == Environment.production) {
//     /// App Prod Environment
//     getIt.registerLazySingleton<AppConfig>(() => AppConfigProd());
//   }
//
//   if (environment == Environment.development) {
//     /// App Dev Environment
//     getIt.registerLazySingleton<AppConfig>(() => AppConfigDev());
//   }
//
//   /// Burda dio initialize edilecek
//   getIt.registerLazySingleton(
//     () => Dio()
//       ..options = BaseOptions(
//         baseUrl: 'https://portal.wietmobile.com:8443/api/',
//       ),
//   );
//
//   /// Rest Client burda get it ile inject ediliyor.
//   /// rest client, baseUrl'i verdi, header'i verdi
//   // getIt.registerSingleton<RestClient>(
//   //   HttpRestClient(
//   //     client: getIt(),
//   //     baseUrl: 'localhost:8080',
//   //     headers: () async {
//   //       final secureStorage = getIt<FlutterSecureStorage>(
//   //         instanceName: 'secureStorage',
//   //       );
//   //       final token = await secureStorage.read(key: AppKeys.token);
//   //
//   //       return {'Authorization': 'Basic $token'};
//   //     },
//   //   ),
//   // );
//
//   /// Data source'a bunu ekleyecegim.
//
//   /// Yeni eklediklerim
//   ///remote data sources
//
//   /// Init Hive and register LocalDatabaseService
//   await LocalDatabaseModule.hiveInit;
//   getIt.registerLazySingleton<LocalDatabaseService>(
//     () => LocalDatabaseServiceImpl(),
//   );
//
//   /// Repositories
//
//   /// Use cases
//
//   /// blocs
// }
