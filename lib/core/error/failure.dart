import 'package:equatable/equatable.dart';
import 'package:weather/core/network/error_messege_model.dart';

abstract class Failure extends Equatable {
  final ErrorMessegeModel errorMessegeModel;

  const Failure({required this.errorMessegeModel});

  @override
  List<Object?> get props => [errorMessegeModel];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errorMessegeModel});
}

class IntenetConnectionFailure extends Failure {
  const IntenetConnectionFailure({required super.errorMessegeModel});
}

class PermissionFailure extends Failure {
  const PermissionFailure({required super.errorMessegeModel});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.errorMessegeModel});
}
