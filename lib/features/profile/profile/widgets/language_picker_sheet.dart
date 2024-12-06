part of '../profile_view.dart';

final class _LanguagePickerBottomSheet extends StatelessWidget {
  const _LanguagePickerBottomSheet();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        vertical: AppDesignConstants.verticalPaddingLarge,
      ),
      itemCount: context.read<LanguageBloc>().supportedLanguages.length,
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDesignConstants.horizontalPaddingLarge,
          ),
          child: Divider(
            color: AppColors.kSecondary700,
            thickness: 1,
          ),
        );
      },
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(
            context.read<LanguageBloc>().supportedLanguages[index].imagePath,
            width: 24,
            height: 24,
          ),
          title: Text(
            context.read<LanguageBloc>().supportedLanguages[index].name,
            style: context.textTheme.bodyMedium,
          ),
          onTap: () {
            context.read<LanguageBloc>().add(
                  ChangeLanguage(
                    selectedLanguage: context.read<LanguageBloc>().supportedLanguages[index],
                  ),
                );
            Navigator.of(context, rootNavigator: true).pop();
          },
        );
      },
    );
  }
}
