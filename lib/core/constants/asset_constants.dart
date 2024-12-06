import 'package:flutter/material.dart';

@immutable
final class AssetConstants {
  static AssetIcons icons = AssetIcons();
  static AssetImages images = AssetImages();
  static String toLotti(String name) => 'assets/lottie/$name.json';
  static String toJpg(String name) => 'assets/images/$name.jpg';
  static String toJpeg(String name) => 'assets/images/$name.jpeg';
  static String toPng(String name) => 'assets/images/$name.png';
  static String toIcon(String name) => 'assets/icons/ic_$name.svg';
  static String toJson(String name) => 'assets/mock/$name.json';
}

@immutable
final class AssetIcons {
  final String audio = AssetConstants.toIcon("audio_icon");
  final String google = AssetConstants.toIcon("google_icon");
  final String addTrip = AssetConstants.toIcon("add_trip");
  final String road = AssetConstants.toIcon("road");
  final String totalRides = AssetConstants.toIcon("task");
  final String completed = AssetConstants.toIcon("task_done");
  final String cancel = AssetConstants.toIcon("cancel_square");
  final String car = AssetConstants.toIcon("car");
  final String send = AssetConstants.toIcon("paper_plane");
}

@immutable
final class AssetImages {
  final String pdfUpload = AssetConstants.toPng("student_card");
  final String unitedKingdomFlag = AssetConstants.toPng("img_united_kingdom_flag");
  final String turkishFlag = AssetConstants.toPng("img_turkey_flag");
  final String customMapMarker = AssetConstants.toPng("map-marker");
}
