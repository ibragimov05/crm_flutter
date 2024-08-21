part of '../home_screen.dart';

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 40,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              AppAssets.icoLogo,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_rounded),
              ),
              ZoomTapAnimation(
                onTap: () =>
                    Navigator.pushNamed(context, AppRouter.profileScreen),
                child: const CircleAvatar(radius: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _WelcomeBack extends StatelessWidget {
  const _WelcomeBack();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Welcome back, ${UserData.name}!',
          style: AppTextStyles.nunitoSansW600.copyWith(
            color: AppColors.grey,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class _DashBoard extends StatelessWidget {
  const _DashBoard();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Dashboard',
      style: AppTextStyles.nunitoSansW700.copyWith(
        color: AppColors.darkShadeGreen,
        fontSize: 36,
      ),
    );
  }
}
