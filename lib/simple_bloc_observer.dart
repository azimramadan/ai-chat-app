import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('✅ onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('🔄 onChange -- ${bloc.runtimeType}');
    log('   Current State: ${change.currentState}');
    log('   Next State: ${change.nextState}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('❌ onError -- ${bloc.runtimeType}');
    log('   Error: $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('🔒 onClose -- ${bloc.runtimeType}');
  }
}
