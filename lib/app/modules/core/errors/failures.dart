import 'package:equatable/equatable.dart';
import 'package:stefanini_flutter_test/app/modules/core/errors/exceptions.dart';

abstract class Failure extends Equatable {
  Failure({required this.message, required this.statusCode})
      : assert(
          statusCode is String || statusCode is int,
          'StatusCode cannot be a ${statusCode.runtimeType}',
        );

  final String message;
  final dynamic statusCode;

  String get errorMessage => '$statusCode Error: $message';

  @override
  List<dynamic> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  ServerFailure({required super.message, required super.statusCode});

  ServerFailure.fromException(ServerException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}

class ClientFailure extends Failure {
  ClientFailure({required super.message, required super.statusCode});

  ClientFailure.fromException(ServerException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}
