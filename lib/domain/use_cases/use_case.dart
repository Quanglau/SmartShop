abstract class UseCase<Input, Output> {
  Output run(Input input);
}

abstract class OutputUseCase<Output> {
  Output run();
}

abstract class FutureUseCase<Input, Output> {
  Future<Output> run(Input input);
}

abstract class FutureOutputUseCase<Output> {
  Future<Output> run();
}
