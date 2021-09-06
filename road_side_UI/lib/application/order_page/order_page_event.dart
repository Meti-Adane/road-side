part of 'order_page_bloc.dart';

@freezed
abstract class OrderPageEvent with _$OrderPageEvent{
  const factory OrderPageEvent.locationChanged(String location) = LocationChanged;
  const factory OrderPageEvent.searchButtonPressed() = SearchButtonPressed;
}

