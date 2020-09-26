import '../API/calling_data.dart';
import '../API/picture.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class PhotoBloc {
  final HttpService httpService = HttpService();
  double pixels = 0.0;

  ReplaySubject<List<Photos>> _subject = ReplaySubject();

  final ReplaySubject<ScrollNotification> _controller = ReplaySubject();

  Stream<List<Photos>> get stream => _subject.stream;
  Sink<ScrollNotification> get sink => _controller.sink;

  PhotoBloc() {
    _subject.addStream(Stream.fromFuture(httpService.fetchPhotos()));
    _controller.listen((notification) => loadPhotos(notification));
  }

  Future<void> loadPhotos([ScrollNotification notification]) async {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
      pixels = notification.metrics.pixels;

      List<Photos> list = await httpService.fetchPhotos();
      _subject.sink.add(list);
    }
  }

  void dispose() {
    _controller.close();
    _subject.close();
  }
}
