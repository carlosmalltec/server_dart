abstract class ServiceExceptions {
  Future<String> exceptionsDefault();
}

class ServiceExceptionsImpl implements ServiceExceptions {
  @override
  Future<String> exceptionsDefault() async {
    await Future.delayed(Duration(milliseconds: 500));
    return 'Chegou no serviço';
  }
}
