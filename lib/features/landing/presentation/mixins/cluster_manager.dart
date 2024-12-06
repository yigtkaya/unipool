part of '../landing_page_view.dart';

class ClusterManager {
  final void Function(double zoom) onMarkersUpdate;
  final void Function(LatLng position, double zoom) onClusterTap;

  const ClusterManager({
    required this.onMarkersUpdate,
    required this.onClusterTap,
  });

  Future<Marker> createClusterMarker(
    LatLng position,
    int count,
    List<Marker> clusterMarkers,
    BuildContext context,
  ) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    const size = 120.0;

    canvas.drawCircle(
      const Offset(size / 2, size / 2),
      size / 2,
      Paint()..color = AppColors.kPrimary100,
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: count.toString(),
        style: context.textTheme.bodyLarge?.copyWith(
          color: Colors.white,
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        (size - textPainter.width) / 2,
        (size - textPainter.height) / 2,
      ),
    );

    final image = await recorder.endRecording().toImage(size.toInt(), size.toInt());
    final data = await image.toByteData(format: ui.ImageByteFormat.png);

    return Marker(
      markerId: MarkerId('cluster_${position.latitude}_${position.longitude}'),
      position: position,
      icon: BitmapDescriptor.fromBytes(
        data!.buffer.asUint8List(),
        size: const Size(120, 120),
      ),
      onTap: () => onClusterTap(position, 15.0),
    );
  }

  LatLngBounds calculateClusterBounds(List<Marker> markers) {
    if (markers.isEmpty) {
      throw Exception('No markers in cluster');
    }

    var minLat = markers.first.position.latitude;
    var maxLat = markers.first.position.latitude;
    var minLng = markers.first.position.longitude;
    var maxLng = markers.first.position.longitude;

    for (var marker in markers) {
      if (marker.position.latitude < minLat) minLat = marker.position.latitude;
      if (marker.position.latitude > maxLat) maxLat = marker.position.latitude;
      if (marker.position.longitude < minLng) minLng = marker.position.longitude;
      if (marker.position.longitude > maxLng) maxLng = marker.position.longitude;
    }

    return LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
  }

  LatLng getClusterCenter(List<Marker> markers) {
    var lat = 0.0;
    var lng = 0.0;
    for (var marker in markers) {
      lat += marker.position.latitude;
      lng += marker.position.longitude;
    }
    return LatLng(lat / markers.length, lng / markers.length);
  }

  LatLngBounds createBounds(LatLng center) {
    const spread = 0.01;
    return LatLngBounds(
      southwest: LatLng(center.latitude - spread, center.longitude - spread),
      northeast: LatLng(center.latitude + spread, center.longitude + spread),
    );
  }

  bool isInBounds(LatLng point, LatLngBounds bounds) {
    return point.latitude >= bounds.southwest.latitude &&
        point.latitude <= bounds.northeast.latitude &&
        point.longitude >= bounds.southwest.longitude &&
        point.longitude <= bounds.northeast.longitude;
  }
}
