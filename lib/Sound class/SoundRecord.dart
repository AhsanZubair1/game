// import 'dart:io';
//
// import 'package:flutter_sound_lite/flutter_sound.dart';
//
// class SoundRecoder{
// File ?audiorecord ;
//   FlutterSoundRecorder ? _flutterSoundRecorder;
//   bool record=false;
//   Future _record()async{
//     await _flutterSoundRecorder!.startRecorder(toFile:audiorecord!.path);
//   }
//   Future _stop()async{
//     await _flutterSoundRecorder!.stopRecorder();
//   }
//   Future toggleRecording()async{
//     if(_flutterSoundRecorder!.isStopped){
//       await _record();
//     }
//     else{
//       await _stop();
//
//     }
//   }
//
//   void init()async {
//     _flutterSoundRecorder=FlutterSoundRecorder();
//
//     _flutterSoundRecorder!.openAudioSession();
//   }
//
//   void dispose()async {
//     _flutterSoundRecorder!.closeAudioSession();
//     _flutterSoundRecorder=null;
//   }
//
//
// }