import 'package:demo_project/model/model.dart';
import 'package:equatable/equatable.dart';

class GetApiProfileState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SubmissionItemSuccess extends GetApiProfileState {
  List<ItemListModel>? model;

  SubmissionItemSuccess({this.model});

  List<ItemListModel> get getResponse => model!;

  @override
  List<Object> get props => [model!];
}

class FailedItemSuccess extends GetApiProfileState {
  String? error;

  FailedItemSuccess({this.error});
}

class GetApiLoadingEvent extends GetApiProfileState {}
