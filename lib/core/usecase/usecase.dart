abstract interface class Usecase<SuccessType, Params> {
  Future<SuccessType> call(Params params);
}

class NoParams {}
