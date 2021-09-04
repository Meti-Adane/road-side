part of 'order_page_bloc.dart';

@freezed
abstract class OrderPageState with _$OrderPageState {
  const factory OrderPageState({
    required String location,
    required bool showLocationList,
  }) = _OrderPageState;

  factory OrderPageState.initial() => OrderPageState(
        location: '',
        showLocationList: false,
      );
}
