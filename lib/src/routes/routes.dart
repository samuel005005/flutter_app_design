import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_app_design/src/pages/animations_page.dart';
import 'package:flutter_app_design/src/pages/circular_graph_page.dart';
import 'package:flutter_app_design/src/pages/emergency_page.dart';
import 'package:flutter_app_design/src/pages/headers_page.dart';
import 'package:flutter_app_design/src/pages/pinterest_page.dart';
import 'package:flutter_app_design/src/pages/slideshow_page.dart';
import 'package:flutter_app_design/src/pages/sliver_list_page.dart';

final pageRoutes = <_Route>[
  _Route(
    icon: FontAwesomeIcons.slideshare,
    title: "Slideshow",
    page: const SlideShowPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.truckMedical,
    title: "Emergency",
    page: EmergencyPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.heading,
    title: "Headering",
    page: const HeadersPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.peopleCarryBox,
    title: "Square Animaded",
    page: const AnimationPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.circleNotch,
    title: "Circular Graph",
    page: const CircularGraphPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.pinterest,
    title: "Pinterest",
    page: const PinterestPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.mobile,
    title: "Slivers",
    page: const SliverListPage(),
  ),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route({required this.icon, required this.title, required this.page});
}
