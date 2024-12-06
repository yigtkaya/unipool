part of '../landing_page_view.dart';

class MarkerCreator {
  final Map<String, BitmapDescriptor> _markerCache = {};
  final Map<String, Uint8List> _photoCache = {};

  Future<BitmapDescriptor> createCustomMarker(String profilePhotoUrl, {TripType? tripType}) async {
    // Create cache key that includes both URL and trip type
    final cacheKey = '${profilePhotoUrl}_${tripType?.name}';

    // Return cached marker if available
    if (_markerCache.containsKey(cacheKey)) {
      return _markerCache[cacheKey]!;
    }

    const markerSize = 240.0;
    const profileSize = 120.0;

    try {
      final pictureRecorder = ui.PictureRecorder();
      final canvas = Canvas(pictureRecorder);
      final profilePhoto = await _getProfilePhoto(profilePhotoUrl);
      if (profilePhoto == null) return BitmapDescriptor.defaultMarker;

      final profileImage = await decodeImageFromList(profilePhoto);
      final center = Offset(markerSize / 2, markerSize / 2);
      final photoOffset = Offset(center.dx, center.dy - 40);

      final photoRect = Rect.fromCenter(
        center: photoOffset,
        width: profileSize,
        height: profileSize,
      );

      // Draw background circle based on trip type
      canvas.drawCircle(
        photoOffset,
        profileSize / 2 + 4, // Slightly larger than the profile photo
        Paint()
          ..color = tripType == TripType.lookingPassenger ? AppColors.kPrimary100 : AppColors.kSuccess400
          ..style = PaintingStyle.fill
          ..isAntiAlias = true,
      );

      canvas.save();
      canvas.clipPath(Path()..addOval(photoRect));

      canvas.drawImageRect(
        profileImage,
        Rect.fromLTWH(0, 0, profileImage.width.toDouble(), profileImage.height.toDouble()),
        photoRect,
        Paint()
          ..filterQuality = ui.FilterQuality.high
          ..isAntiAlias = true,
      );
      canvas.restore();

      // Draw border
      canvas.drawCircle(
        photoOffset,
        profileSize / 2,
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3
          ..isAntiAlias = true,
      );

      final picture = pictureRecorder.endRecording();
      final image = await picture.toImage(markerSize.toInt(), markerSize.toInt());
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);

      // Cache the created marker before returning
      _markerCache[cacheKey] = BitmapDescriptor.bytes(
        bytes!.buffer.asUint8List(),
        width: 120,
        height: 120,
        imagePixelRatio: 2,
      );

      return _markerCache[cacheKey]!;
    } catch (e) {
      debugPrint('Error creating custom marker: $e');
      return BitmapDescriptor.defaultMarker;
    }
  }

  Future<Uint8List?> _getProfilePhoto(String url) async {
    // Return cached photo if available
    if (_photoCache.containsKey(url)) {
      return _photoCache[url];
    }

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _photoCache[url] = response.bodyBytes;
        return response.bodyBytes;
      }
    } catch (e) {
      debugPrint('Error loading profile photo: $e');
    }
    return null;
  }

  void clearCache() {
    _markerCache.clear();
    _photoCache.clear();
  }
}
