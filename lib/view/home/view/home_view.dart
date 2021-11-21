import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lib_msaadev/lib_msaadev.dart';
import 'package:pedal_commander/core/base/view/base_view.dart';
import 'package:pedal_commander/core/components/buttons/control_button.dart';
import 'package:pedal_commander/core/components/cards/mode_card.dart';
import 'package:pedal_commander/core/components/cards/star_card.dart';
import 'package:pedal_commander/core/constants/application_constants.dart';
import 'package:pedal_commander/view/home/model/pedal_mode.dart';
import 'package:pedal_commander/view/home/view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel _viewModel;
  late final List<PedalMode> pedalList;

  @override
  void initState() {
    super.initState();
    pedalList = [
      PedalMode(color: ApplicationConstants.springGreen, label: 'ECO'),
      PedalMode(color: ApplicationConstants.torchRed, label: 'SPORT+'),
      PedalMode(color: ApplicationConstants.cyan, label: 'CITY'),
      PedalMode(color: ApplicationConstants.sunglow, label: 'SPORT'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (viewModel) {
        _viewModel = viewModel;
      },
      onPageBuilder: (cont, viewModel) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: context.customHeight(4),
                      child: Observer(builder: (_) {
                        return StarCard(
                          index: viewModel.mode,
                          text: pedalList[viewModel.mode].label,
                        );
                      }),
                    ),
                    modGrid(),
                  ],
                ),
              ),
              levels(),
              bottomController()
            ],
          ),
        );
      },
    );
  }

  SizedBox modGrid() {
    return SizedBox(
      width: context.customHeight(3),
      child: GridView.builder(
          padding: 0.paddingAll,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: pedalList.length,
          itemBuilder: (context, index) {
            var item = pedalList[index];
            return ModeCard(
              mode: item,
              onPressed: () {
                _viewModel.setSelectedMode(index);
                _viewModel.setLevel(0);
              },
            );
          }),
    );
  }

  SizedBox levels() {
    return SizedBox(
      height: context.customHeight(6),
      child: Observer(builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            levelWidget(0, -4),
            levelWidget(.15, -3),
            levelWidget(.30, -2),
            levelWidget(.50, -1),
            1.wSized,
            levelWidget(.50, 0),
            levelWidget(.30, 1),
            levelWidget(.15, 2),
            levelWidget(0, 3),
          ],
        );
      }),
    );
  }

  SizedBox bottomController() {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ControlButton(
              type: 'minus',
              onPressed: () {
                _viewModel.decrementLevel();
              }),
          Image.asset('assets/images/logo.png'),
          ControlButton(
              type: 'plus',
              onPressed: () {
                _viewModel.incrementLevel();
              }),
        ],
      ),
    );
  }

  levelWidget(double inset, int index) {
    bool isNegative = index.isNegative;
    int selectedLevel = _viewModel.level;
    bool isColored = false;
    if (isNegative) {
      if (_viewModel.isLevelNegative && index >= _viewModel.level) {
        isColored = true;
      }
    } else {
      if (!_viewModel.isLevelNegative && index <= _viewModel.level) {
        isColored = true;
      }
    }

    var fulSize = context.customHeight(6);
    return AnimatedContainer(
      duration: 200.millisecondsDuration,
      width: 25,
      height: fulSize - (fulSize * inset),
      color: isColored
          ? ApplicationConstants.sunglow
          : ApplicationConstants.myGrey,
    );
  }
}

