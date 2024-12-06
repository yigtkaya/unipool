part of '../my_trips_view.dart';

final class DriverInfo extends StatelessWidget {
  final ProfileModel profile;
  final bool isOwner;
  const DriverInfo({super.key, required this.profile, required this.isOwner});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          showBarModalBottomSheet(
            context: context,
            builder: (context) => ProfileViewOthers(
              profile: profile,
            ),
          );
        },
        child: Row(
          children: [
            ProfilePhoto(
              profilePhoto: profile.profilePhoto ?? '',
            ),
            SizedBox(
              width: AppDesignConstants.spacing,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.name.toString(),
                    style: context.textTheme.bodyLarge,
                  ),
                  Text(
                    profile.school.toString(),
                    textAlign: TextAlign.left,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
