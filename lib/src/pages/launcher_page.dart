import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design with Flutter'),
      ),
      body: const _ListOptions(),
      drawer: _MainMenu(),
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
      itemCount: 20,
      itemBuilder: (context, index) => ListTile(
        leading: const FaIcon(
          FontAwesomeIcons.slideshare,
          color: Colors.blue,
        ),
        title: const Text("Hello Word"),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.blue,
        ),
        onTap: () {},
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  const _MainMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [],
      ),
    );
  }
}
