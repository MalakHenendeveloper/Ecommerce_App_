// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Fauilers {
  String ErrorMesage;
  Fauilers({
    required this.ErrorMesage,
  });
}

class ServerError extends Fauilers {
  ServerError({required super.ErrorMesage});
}

class NetworkError extends Fauilers {
  NetworkError({required super.ErrorMesage});
}
