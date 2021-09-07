import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ongoing_services_event.dart';
part 'ongoing_services_state.dart';

class OngoingServicesBloc extends Bloc<OngoingServicesEvent, OngoingServicesState> {
  OngoingServicesBloc(bool IncomingRequestsIsEmpty) : super(OngoingServicesInitial(IncomingRequestsIsEmpty: IncomingRequestsIsEmpty));

  @override
  Stream<OngoingServicesState> mapEventToState(
    OngoingServicesEvent event,
  ) async* {
    if (event is OngoingServicesReloaded ){
      yield* _mapOngoingReloadedToState(event);
    } else if (event is AcceptIncomingRequestPressed){
      yield* _mapAcceptRequestToState(event);
    }
  }

  Stream<OngoingServicesState> _mapOngoingReloadedToState(OngoingServicesReloaded reload) async* {
    //TODO - make api calls to incoming services and ongoingservices
    //Request for the garage info again?
    yield OngoingServicesInitial(IncomingRequestsIsEmpty: true);
  }

  Stream<OngoingServicesState> _mapAcceptRequestToState(AcceptIncomingRequestPressed accept) async* {
    //TODO - Tell the api that request is accepted i.e. is_placed = accepted
    //TODO - Delete the request from incoming_requests and add to ongoing_services
    //TODO - Update the screen/state to accomodate the new ongoing_services(fetch the ongoing_services list again)

    yield OngoingServicesInitial(IncomingRequestsIsEmpty: true);
  }

  Stream<OngoingServicesState> _mapRejectRequestToState(RejectIncomingRequestPressed reject) async* {
    //TODO - Delete the request from incoming_requests

    yield OngoingServicesInitial(IncomingRequestsIsEmpty: true);
  }
}