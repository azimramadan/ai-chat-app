import 'package:ai_chat_app/core/constants/api_constants.dart';
import 'package:ai_chat_app/core/network/dio_client.dart';
import 'package:ai_chat_app/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:ai_chat_app/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:ai_chat_app/features/chat/domain/repositories/chat_repository.dart';
import 'package:ai_chat_app/features/chat/domain/usecases/send_message_stream_usecase.dart';
import 'package:ai_chat_app/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:ai_chat_app/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<DioClient>(
    () => DioClient(baseUrl: ApiConstants.baseUrl),
  );

  sl.registerLazySingleton<ChatRemoteDataSource>(
    () => ChatRemoteDataSourceImpl(dioClient: sl()),
  );

  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton(() => SendMessageUseCase(sl()));
  sl.registerLazySingleton(() => SendMessageStreamUseCase(sl()));

  sl.registerFactory(() => ChatCubit(sendMessageUseCase: sl()));
}
