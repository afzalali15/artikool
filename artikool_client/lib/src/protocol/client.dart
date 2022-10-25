/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'dart:typed_data' as typed_data;
import 'package:serverpod_client/serverpod_client.dart';
import 'protocol.dart';

class _EndpointApi extends EndpointRef {
  @override
  String get name => 'api';

  _EndpointApi(EndpointCaller caller) : super(caller);

  Future<String> getDays(
    DateTime dob,
  ) async {
    var retval = await caller.callServerEndpoint('api', 'getDays', 'String', {
      'dob': dob,
    });
    return retval;
  }
}

class _EndpointArtikool extends EndpointRef {
  @override
  String get name => 'artikool';

  _EndpointArtikool(EndpointCaller caller) : super(caller);

  ///Fetch articles from DB
  Future<List<Article>> getArticles({
    String? keyword,
  }) async {
    var retval = await caller
        .callServerEndpoint('artikool', 'getArticles', 'List<Article>', {
      'keyword': keyword,
    });
    return (retval as List).cast();
  }

  Future<bool> addArticle(
    Article article,
  ) async {
    var retval =
        await caller.callServerEndpoint('artikool', 'addArticle', 'bool', {
      'article': article,
    });
    return retval;
  }

  ///Update article
  Future<bool> updateArticle(
    Article article,
  ) async {
    var retval =
        await caller.callServerEndpoint('artikool', 'updateArticle', 'bool', {
      'article': article,
    });
    return retval;
  }

  ///Delete article
  Future<bool> deleteArticle(
    int id,
  ) async {
    var retval =
        await caller.callServerEndpoint('artikool', 'deleteArticle', 'bool', {
      'id': id,
    });
    return retval;
  }
}

class _EndpointExample extends EndpointRef {
  @override
  String get name => 'example';

  _EndpointExample(EndpointCaller caller) : super(caller);

  Future<String> hello(
    String name,
  ) async {
    var retval = await caller.callServerEndpoint('example', 'hello', 'String', {
      'name': name,
    });
    return retval;
  }
}

class _EndpointWeather extends EndpointRef {
  @override
  String get name => 'weather';

  _EndpointWeather(EndpointCaller caller) : super(caller);

  Future<WeatherInfo> getWeatherInfo(
    int cityId,
  ) async {
    var retval = await caller
        .callServerEndpoint('weather', 'getWeatherInfo', 'WeatherInfo', {
      'cityId': cityId,
    });
    return retval;
  }
}

class Client extends ServerpodClient {
  late final _EndpointApi api;
  late final _EndpointArtikool artikool;
  late final _EndpointExample example;
  late final _EndpointWeather weather;

  Client(String host,
      {SecurityContext? context,
      ServerpodClientErrorCallback? errorHandler,
      AuthenticationKeyManager? authenticationKeyManager})
      : super(host, Protocol.instance,
            context: context,
            errorHandler: errorHandler,
            authenticationKeyManager: authenticationKeyManager) {
    api = _EndpointApi(this);
    artikool = _EndpointArtikool(this);
    example = _EndpointExample(this);
    weather = _EndpointWeather(this);
  }

  @override
  Map<String, EndpointRef> get endpointRefLookup => {
        'api': api,
        'artikool': artikool,
        'example': example,
        'weather': weather,
      };

  @override
  Map<String, ModuleEndpointCaller> get moduleLookup => {};
}
