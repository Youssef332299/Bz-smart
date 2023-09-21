import 'package:bzsmart/screens/navigation/provider/navigationState.dart';
import 'package:flutter/cupertino.dart';

class NavigationProvider extends ChangeNotifier{

  NavigationState state = NavigationState();

  @override
  void dispose() {
    state.controller.dispose(); // تخليص PageController
    super.dispose();
  }

  void init() {
  state.controller = PageController(initialPage: state.currentIndex.value);
  }

  void pageChange(index){
      state.currentIndex.value = index;
      notifyListeners();
  }

  void onBottomTapped(int value) {
      state.currentIndex.value = value;
      state.controller.animateToPage(
      state.currentIndex.value,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOutCubicEmphasized,
    );
    notifyListeners();
  }

}