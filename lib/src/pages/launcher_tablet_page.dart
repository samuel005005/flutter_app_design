import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/bloc/theme/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_app_design/src/routes/routes.dart';

class LauncherTabletPage extends StatelessWidget {
  const LauncherTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: state.currentTheme.colorScheme.secondary,
            title: const Text('Design with Flutter - Tablet'),
          ),
          body: const _ListOptions(),
          drawer: const _MainMenu(),
        );
      },
    );
  }
}

class _ListOptions extends StatelessWidget {
  const _ListOptions();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final appTheme = state.currentTheme;
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
      },
    );
  }
}

class _MainMenu extends StatelessWidget {
  const _MainMenu();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final secondary = state.currentTheme.colorScheme.secondary;
          return Column(
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
                  value: state.darkTheme,
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
                  child: BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      return ListTile(
                        leading: Icon(
                          Icons.add_to_home_screen,
                          color: secondary,
                        ),
                        title: const Text('Custom Theme'),
                        trailing: Switch.adaptive(
                          value: state.customTheme,
                          activeColor: secondary,
                          onChanged: (value) {
                            context.read<ThemeBloc>().add(
                                  ChangeTheme(
                                      darkTheme: false, customTheme: value),
                                );
                          },
                        ),
                      );
                    },
                  )),
            ],
          );
        },
      ),
    );
  }
}
