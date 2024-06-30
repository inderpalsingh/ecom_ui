class ApiExceptions implements Exception{
  String title;
  String msg;
  ApiExceptions({required this.title, required this.msg});

  toErrorMsg(){
    return '$title: $msg';
  }

}

class FetchDataExecption extends ApiExceptions{

  FetchDataExecption({required String errorMsg}): super(title: 'Network Error', msg: errorMsg);

}

class BadRequestExecption extends ApiExceptions{

  BadRequestExecption({required String errorMsg}): super(title: 'Bad Request', msg: errorMsg);

}

class BadRequestException extends ApiExceptions {
  BadRequestException({required String errorMsg}) : super(title: 'Bad Request', msg: errorMsg);
}

class UnauthorisedException extends ApiExceptions {
  UnauthorisedException({required String errorMsg}) : super(title: 'Unauthorised', msg: errorMsg);
}

class InvalidInputException extends ApiExceptions {
  InvalidInputException({required String errorMsg}) : super(title: 'Bad Input Request', msg: errorMsg);
}