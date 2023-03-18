import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/bloc/theme/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_app_design/src/routes/routes.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(
        color: Colors.blue,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: Colors.blue,
        ),
        title: Text(pageRoutes[index].title),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.blue,
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
    return Drawer(
      child: Column(
        children: [
          const SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: 150,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
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
            leading: const Icon(
              Icons.lightbulb_outline,
              color: Colors.blue,
            ),
            title: const Text('Dark Mode'),
            trailing: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return Switch.adaptive(
                  value: state.darkTheme,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    context.read<ThemeBloc>().add(
                          ChangeTheme(darkTheme: value, customTheme: !value),
                        );
                  },
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
              leading: const Icon(
                Icons.add_to_home_screen,
                color: Colors.blue,
              ),
              title: const Text('Custom Theme'),
              trailing: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return Switch.adaptive(
                    value: state.customTheme,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      context.read<ThemeBloc>().add(
                            ChangeTheme(darkTheme: !value, customTheme: value),
                          );
                    },
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
