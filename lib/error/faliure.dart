import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});

  @override
  List<Object?> get props =>
      [message, statusCode]; // Include statusCode in props
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.statusCode});
}
