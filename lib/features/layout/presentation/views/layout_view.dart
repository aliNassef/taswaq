import 'package:flutter/material.dart'; 
import '../widgets/layoutview_body.dart';

 
class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  static const String routeName = '/layout';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LayoutViewBody(),
    );
  }
}
 