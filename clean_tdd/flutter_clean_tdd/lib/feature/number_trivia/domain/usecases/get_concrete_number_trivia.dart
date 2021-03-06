import 'package:dartz/dartz.dart';
import 'package:flutter_clean_tdd/core/error/failure.dart';
import 'package:flutter_clean_tdd/feature/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_clean_tdd/feature/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>> execute(int number) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
