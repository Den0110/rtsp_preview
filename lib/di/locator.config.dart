// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repository/camera_repository_impl.dart' as _i4;
import '../domain/repository/camera_repository.dart' as _i3;
import '../ui/pages/camera_list/bloc/camera_list_bloc.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.CameraRepository>(_i4.CameraRepositoryImpl());
  gh.factory<_i5.CameraListBloc>(
      () => _i5.CameraListBloc(get<_i3.CameraRepository>()));
  return get;
}
