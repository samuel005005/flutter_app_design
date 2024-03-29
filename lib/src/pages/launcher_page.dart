import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/bloc/theme/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_app_design/src/routes/routes.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeBloc>().state.currentTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.colorScheme.secondary,
        title: const Text('Design with Flutter'),
      ),
      body: const _ListOptions(),
      drawer: const _MainMenu(),
    );
  }
}

class _ListOptions extends StatelessWidget {
  const _ListOptions();

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeBloc>().state.currentTheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: appTheme.colorScheme.secondary,
        ),
        title: Text(pageRoutes[index].title),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.colorScheme.secondary,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pageRoutes[index].page),
          );
        },
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  const _MainMenu();

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeBloc>().state;
    final secondary = appTheme.currentTheme.colorScheme.secondary;

    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: 150,
              child: CircleAvatar(
                backgroundColor: secondary,
                child: const Text(
                  "SP",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
          ),
          const Expanded(
            child: _ListOptions(),
          ),
          ListTile(
            leading: Icon(
              Icons.lightbulb_outline,
              color: secondary,
            ),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
              value: appTheme.darkTheme,
              activeColor: secondary,
              onChanged: (value) {
                context.read<ThemeBloc>().add(
                      ChangeTheme(darkTheme: value, customTheme: false),
                    );
              },
            ),
          ),
          SafeArea(
            bottom: true,
            top: false,
            left: false,
            right: false,
            child: ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                color: secondary,
              ),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: appTheme.customTheme,
                activeColor: secondary,
                onChanged: (value) {
                  context.read<ThemeBloc>().add(
                        ChangeTheme(darkTheme: false, customTheme: value),
                      );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
