import 'package:digital_stamp_quiz/common/services/hive_storage_service.dart';
import 'package:digital_stamp_quiz/feature/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:digital_stamp_quiz/feature/quiz/data/sources/local/quiz_local_source.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/repositories/quiz_repository.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/usecase/get_quiz_categories_usecase.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/usecase/get_stamps_per_category_usecase.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/usecase/reset_stamps_per_category_usecase.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/usecase/update_stamps_per_category_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final locator = GetIt.I;

void setUpLocators() {
  locator.registerLazySingleton<HiveStorageService>(
      () => HiveStorageService(Hive));

  // [Quiz] dependency injections
  locator.registerLazySingleton<QuizLocalSource>(
      () => QuizLocalSource(locator.get<HiveStorageService>()));

  locator.registerLazySingleton<QuizRepository>(
      () => QuizRepositoryImpl(localSource: locator.get<QuizLocalSource>()));

  locator.registerLazySingleton<GetQuizCategoriesUseCase>(() =>
      GetQuizCategoriesUseCase(repository: locator.get<QuizRepository>()));

  locator.registerLazySingleton<GetStampsPerCategoryUseCase>(() =>
      GetStampsPerCategoryUseCase(repository: locator.get<QuizRepository>()));

  locator.registerLazySingleton<UpdateStampsPerCategoryUseCase>(() =>
      UpdateStampsPerCategoryUseCase(
          repository: locator.get<QuizRepository>()));

  locator.registerLazySingleton<ResetStampsPerCategoryUseCase>(() =>
      ResetStampsPerCategoryUseCase(repository: locator.get<QuizRepository>()));
}
