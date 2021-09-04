import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_page_event.dart';

part 'order_page_state.dart';

part 'order_page_bloc.freezed.dart';

class OrderPageBloc extends Bloc<OrderPageEvent, OrderPageState> {
  OrderPageBloc() : super(OrderPageState.initial());

  @override
  Stream<OrderPageState> mapEventToState(
    OrderPageEvent event,
  ) async* {
    yield* event.map(locationChanged: (e) async* {
      yield state.copyWith(location: e.location);
    });
  }

  //TODO autocomplete for location page
}
