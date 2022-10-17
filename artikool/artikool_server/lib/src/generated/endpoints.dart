/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: public_member_api_docs
// ignore_for_file: unnecessary_import
// ignore_for_file: unused_import

import 'dart:typed_data' as typed_data;
import 'package:serverpod/serverpod.dart';

import 'protocol.dart';

import '../endpoints/artikool_endpoint.dart';
import '../endpoints/example_endpoint.dart';
import '../endpoints/weather_endpoint.dart';

class Endpoints extends EndpointDispatch {
  @override
  void initializeEndpoints(Server server) {
    var endpoints = <String, Endpoint>{
      'artikool': ArtikoolEndpoint()..initialize(server, 'artikool', null),
      'example': ExampleEndpoint()..initialize(server, 'example', null),
      'weather': WeatherEndpoint()..initialize(server, 'weather', null),
    };

    connectors['artikool'] = EndpointConnector(
      name: 'artikool',
      endpoint: endpoints['artikool']!,
      methodConnectors: {
        'getArticles': MethodConnector(
          name: 'getArticles',
          params: {
            'keyword': ParameterDescription(
                name: 'keyword', type: String, nullable: true),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['artikool'] as ArtikoolEndpoint).getArticles(
              session,
              keyword: params['keyword'],
            );
          },
        ),
        'addArticle': MethodConnector(
          name: 'addArticle',
          params: {
            'article': ParameterDescription(
                name: 'article', type: Article, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['artikool'] as ArtikoolEndpoint).addArticle(
              session,
              params['article'],
            );
          },
        ),
        'updateArticle': MethodConnector(
          name: 'updateArticle',
          params: {
            'article': ParameterDescription(
                name: 'article', type: Article, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['artikool'] as ArtikoolEndpoint).updateArticle(
              session,
              params['article'],
            );
          },
        ),
        'deleteArticle': MethodConnector(
          name: 'deleteArticle',
          params: {
            'id': ParameterDescription(name: 'id', type: int, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['artikool'] as ArtikoolEndpoint).deleteArticle(
              session,
              params['id'],
            );
          },
        ),
      },
    );

    connectors['example'] = EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': MethodConnector(
          name: 'hello',
          params: {
            'name': ParameterDescription(
                name: 'name', type: String, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['example'] as ExampleEndpoint).hello(
              session,
              params['name'],
            );
          },
        ),
      },
    );

    connectors['weather'] = EndpointConnector(
      name: 'weather',
      endpoint: endpoints['weather']!,
      methodConnectors: {
        'getWeatherInfo': MethodConnector(
          name: 'getWeatherInfo',
          params: {
            'cityId': ParameterDescription(
                name: 'cityId', type: int, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['weather'] as WeatherEndpoint).getWeatherInfo(
              session,
              params['cityId'],
            );
          },
        ),
      },
    );
  }

  @override
  void registerModules(Serverpod pod) {}
}
