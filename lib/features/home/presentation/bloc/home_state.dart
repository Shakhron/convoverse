part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  const factory HomeState.error(String error) = _Error;
  const factory HomeState.loaded() = _Loaded;
  const factory HomeState.empty() = _Empty;
}
