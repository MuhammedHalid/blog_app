import 'package:blog_app/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UserCase<SuccessType, Parms> {
  Future<Either<Failure, SuccessType>> call(Parms parms);
}
