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


/*
{
	"print":{
		"scope": "dart",
		"prefix": "pr",
		"body": "print('$1');"
	},
	"Magic Number": {
		"scope": "dart",
		"prefix": "magnum",
		"body": "static const $1 = $2;",
		"description": "magic number creator"
	},
	
	"Singleton Eager": {
		"scope": "dart",
		"prefix": "sngltnE",
		"body": [
			"class $1 {",
			" static $1 _instance = $1._init();",
			"static $1 get instance {",
			"if (_instance == null) _instance = $1._init();",
			"return _instance;",
			"}",

			"$1._init();",
			"}"

		],
		"description": "magic number creator"
	},
	"easy route":{
		"scope": "dart",
		"prefix": "myRoute",
		"body": "(context) => $1(),"
	},
	"icon":{
		"scope": "dart",
		"prefix": "icn",
		"body": "Icon(Icons.$1)"
	},
	"color":{
		"scope": "dart",
		"prefix": "clrh",
		"body": "Color(0xff$1)"
	},
	"color2":{
		"scope": "dart",
		"prefix": "clr",
		"body": "Colors.$1"
	},
	"decoration":{
		"scope": "dart",
		"prefix": "dcrtn",
		"body": "decoration:BoxDecoration($1),"
	},

	"my stless page":{
		"scope": "dart",
		"prefix": "myPage",
		"body": [
			"import 'package:flutter/material.dart';",
			"",
			"class $1 extends StatelessWidget {",
			"@override",
			"Widget build(BuildContext context) {",
			" return Scaffold(",
			"body: Center(",
			"child: Text('$1')",
			"),",
			");",
			"}",
			"}",
		]
	},
	"curved box":{
		"scope": "dart",
		"prefix": "crvdBox",
		"body": [
			"Container(",
			"decoration: BoxDecoration(",
			  "borderRadius: 0.radius$1",
			"),",
			"child: ClipRRect(",
			 " borderRadius: 0.radius$1,",
			  "child: $2,",
			"),",
			")"
		]
	},
	"method class":{
		"scope": "dart",
		"prefix": "mthdClass",
		"body": [
			"class $1 with Connect {",
			"final String methodName = '$2';",
			"",
			"}",
		]
	},
	"ftr":{
		"scope": "dart",
		"prefix": "ftr",
		"body": [
			"FutureBuilder(",
      "future: Future.wait([$1]),",
      "builder: (context,AsyncSnapshot s) {",
       " if (s.hasData) {",
          "return $2;",
        "} else if (s.hasError) {",
          "return ErrorFuture();",
        "} else {",
        "  return Center(child: CircularProgressIndicator());",
       " }",
      "},",
    ")"
		]
	},
	"make service":{
		"scope": "dart",
		"prefix": "mkService",
		"body": [
			"$1($3) {",
			"return connect(method: methodName, data: {",
			"'data': {",
			"'firmaKodu': AppConstants.FIRMA_KODU,",
			"'methodName': '$1',",
			"'serviceName': '$2'",
			"}",
			"});",
			"}",
		],
	},

	"make service 2":{
		"scope": "dart",
		"prefix": "asService",
		"body": [
			"$1($3) {",
			"return connect(method: methodName, data: {",
			"'data': {",
			"'yonetimId': LocaleManager.instance.getUserData.yonetimId,",
			"'userToken': LocaleManager.instance.getUserData.mobileToken,",
			"'firmaKodu': AppConstants.FIRMA_KODU,",
			"'methodName': '$1',",
			
			"}",
			"});",
			"}",
		],
	},
	"myCard":{
		"scope": "dart",
		"prefix": "mycrd",
		"body": [
			"decoration: BoxDecoration(",
		"color: Colors.white,",
		"borderRadius: 0.radius10,",
		"boxShadow: AppConstants.shadow_1,",
	  "),"
		]
	},
	"requireds":{
		"scope": "dart",
		"prefix": "req",
		"body": "@required $1 $2,"
	},

	"json decode":{
		"scope": "dart",
		"prefix": "jde",
		"body": "json.decode($1);"
	},
	"json encode":{
		"scope": "dart",
		"prefix": "jen",
		"body": "json.encode($1);"
	},
	"user data":{
		"scope": "dart",
		"prefix": "usrData",
		"body": "LocaleManager.instance.getUserData.$1",
	},
	"test":{
		"scope": "dart",
		"prefix": "tst",
		"body": [
			"import 'package:flutter_test/flutter_test.dart';",
			"main() {",
			"  setUp(() {});",
  			"test('sample test', () {});",
			"}"
	]
	}

}
*/