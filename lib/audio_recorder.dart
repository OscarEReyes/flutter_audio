import 'dart:async';
import 'package:flutter/services.dart';

class AudioRecorder {
  static const MethodChannel platform = const MethodChannel('medcorder_audio');

  static const EventChannel eventChannel =
      const EventChannel('medcorder_audio_events');

  dynamic callback;

  AudioRecorder() {
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  void setCallBack(dynamic _callback) => callback = _callback;

  Future<String> setAudioSettings() async {
    try {
      return await platform.invokeMethod('setAudioSettings');
    } catch (e) {
      return 'Failure: ${e.runtimeType}';
    }
  }

  Future<String> backAudioSettings() async {
    try {
      return await platform.invokeMethod('backAudioSettings');
    } catch (e) {
      return 'Failure: ${e.runtimeType}';
    }
  }

  Future<String> startRecord(String file) async {
    try {
      return await platform.invokeMethod('startRecord', file);
    } catch (e) {
      return 'Failure: ${e.runtimeType}';
    }
  }

  Future<String> stopRecord() async {
    try {
      return await platform.invokeMethod('stopRecord');
    } catch (e) {
      return 'Failure: ${e.runtimeType}';
    }
  }

  Future<String> checkMicrophonePermissions() async {
    try {
      return await platform.invokeMethod('checkMicrophonePermissions');
    } catch (e) {
      return 'Failure: ${e.runtimeType}';
    }
  }

  Future<String> startPlay(dynamic params) async {
    try {
      return await platform.invokeMethod('startPlay', params);
    } catch (e) {
      return 'Failure: ${e.runtimeType}';
    }
  }

  Future<String> stopPlay() async {
    try {
      return await platform.invokeMethod('stopPlay');
    } catch (e) {
      return 'Failure: ${e.runtimeType}';
    }
  }

  void _onEvent(dynamic event) => callback(event);

  void _onError(dynamic error) => print('Channel Error \n${error.toString()}');
}
