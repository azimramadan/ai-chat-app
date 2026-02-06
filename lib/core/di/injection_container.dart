import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // sl.registerLazySingleton<DioClient>(() => DioClient());

  // sl.registerLazySingleton<ChatRemoteDataSource>(
  //   () => ChatRemoteDataSourceImpl(sl()),
  // );

  // sl.registerLazySingleton<ChatRepository>(
  //   () => ChatRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  // );

  // sl.registerLazySingleton(() => SendMessageUseCase(sl()));
  // sl.registerLazySingleton(() => SendMessageStreamUseCase(sl()));

  // sl.registerFactory(() => ChatCubit(sendMessageUseCase: sl()));
}
