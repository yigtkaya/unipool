part of '../landing_page_view.dart';

final class LocateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLocating;

  const LocateButton({
    super.key,
    required this.onPressed,
    this.isLocating = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shadowColor: Colors.black26,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: isLocating
                ? const Icon(
                    Icons.gps_fixed,
                    color: Colors.blue,
                    key: ValueKey('locating'),
                  )
                : const Icon(
                    Icons.gps_not_fixed,
                    color: Colors.black54,
                    key: ValueKey('not_locating'),
                  ),
          ),
        ),
      ),
    );
  }
}
