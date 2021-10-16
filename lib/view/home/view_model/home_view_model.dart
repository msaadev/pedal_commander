import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  int mode = 0;

  @observable
  int level = 0;

  @computed
  bool get isLevelNegative => level.isNegative;

  @action
  void setSelectedMode(int mod) => mode = mod;

  @action
   incrementLevel() {
     if (level < 3) {
       
     level++;
     }

  }

  @action
   decrementLevel() {
     if (level > -4) {
       
     level--;
     }
  }

  @action
   setLevel(int i) => level = i;
}
