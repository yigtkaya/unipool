part of '../landing_page_view.dart';

class RefreshButton extends StatelessWidget {
  final VoidCallback onPressed;
  const RefreshButton({super.key, required this.onPressed});

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
          child: const Icon(
            Icons.refresh,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
