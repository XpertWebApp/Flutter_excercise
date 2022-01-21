import 'package:demo_project/api_request_module/api_request.dart';
import 'package:demo_project/bloc/get_api_event.dart';
import 'package:demo_project/bloc/get_api_state.dart';
import 'package:demo_project/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetApiBloc extends Bloc<GetApiBlocEvent, GetApiProfileState> {
  ApiRequest? apiRequest;

  GetApiBloc({this.apiRequest}) : super(GetApiProfileState());

  @override
  Stream<GetApiProfileState> mapEventToState(GetApiBlocEvent event) async* {
    if (event is GetItemDataEvent) {
      yield GetApiLoadingEvent();
      try {
        var res = await apiRequest!.getItemList();

        if (res == null) {
          yield FailedItemSuccess(error: "Error");
        } else {
          yield SubmissionItemSuccess(model: res);
        }
      } catch (e) {
        yield FailedItemSuccess(error: "Error");
      }
    }
  }
}
