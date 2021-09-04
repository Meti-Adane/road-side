import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:road_side/repository/garage_repository/IGarageRepository.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  IGarageRepository garageRepository;

  MainScreenBloc({required this.garageRepository})
      : super(LoadingMainScreenState());


