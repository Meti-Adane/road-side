part of 'ongoing_services_bloc.dart';

abstract class OngoingServicesState {
  bool IncomingRequestsIsEmpty;

  OngoingServicesState({required this.IncomingRequestsIsEmpty});
}

//TODO check this event
class OngoingServicesInitial extends OngoingServicesState {

  OngoingServicesInitial({required bool IncomingRequestsIsEmpty})
      : super(IncomingRequestsIsEmpty: IncomingRequestsIsEmpty);
}