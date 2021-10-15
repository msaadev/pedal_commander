import 'package:flutter/material.dart';
import 'package:pedal_commander/core/base/view/base_view.dart';
import 'package:pedal_commander/view/home/view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (viewModel) {},
      onPageBuilder: (cont, viewModel) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [Text('data')],
          ),
        );
      },
    );
  }
}
