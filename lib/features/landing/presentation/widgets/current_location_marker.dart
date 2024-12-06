part of '../landing_page_view.dart';

final class CurrentLocationMarker extends StatelessWidget {
  const CurrentLocationMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.withOpacity(0.1),
            border: Border.all(
              color: Colors.blue.withOpacity(0.3),
              width: 1,
            ),
          ),
        ),
        // Inner blue dot
        Center(
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
