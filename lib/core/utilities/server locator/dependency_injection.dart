import 'package:bookly_app/features/home/data/apis/api_services.dart';
import 'package:bookly_app/features/home/data/repo/home_repo_implementaion.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiServices>(ApiServices(getIt.get<Dio>()));
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(getIt.get<ApiServices>()),
  );
  getIt.registerSingleton<SearchRepoImplementation>(
    SearchRepoImplementation(getIt.get<ApiServices>()),
  );
}
