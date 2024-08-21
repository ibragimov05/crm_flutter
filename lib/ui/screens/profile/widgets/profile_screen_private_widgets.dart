part of '../profile_screen.dart';

class _AdminPopupMenuButton extends StatelessWidget {
  const _AdminPopupMenuButton();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        print(value);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        const PopupMenuItem(
          value: 1,
          child: Text('Option1'),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text('Option2'),
        ),
        const PopupMenuItem(
          value: 3,
          child: Text('Option3'),
        ),
      ],
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
        context.read<AuthBloc>().add(const AuthEvent.logout());
      },
      icon: const Icon(Icons.logout),
    );
  }
}
