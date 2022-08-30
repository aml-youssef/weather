import 'package:equatable/equatable.dart';

class ErrorMessegeModel extends Equatable{
  final int statuseCode;
  final String message;

  const ErrorMessegeModel({required this.statuseCode, required this.message});
  
    factory ErrorMessegeModel.fromJson(Map<String, dynamic> json) =>
     ErrorMessegeModel(statuseCode: json['cod'], message: json['message']);

  @override
  List<Object?> get props => [statuseCode, message];

}
