import 'package:flutter/widgets.dart';
import 'package:neumorphicbuttoni/src/pages/home_page.dart';

class ChangeCurrentPage extends ChangeNotifier {
  Widget _currentPage = HomePage();
  int _pageIndex = 0;

  get currentPage {
    return _currentPage;
  }

  get pageIndex {
    return _pageIndex;
  }

  set setCurrentPage(Widget page) {
    this._currentPage = page;

    notifyListeners();
  }

  set setPageIndex(int index) {
    this._pageIndex = index;

    notifyListeners();
  }
}
