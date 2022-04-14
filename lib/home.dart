import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_simple_movie/provider/bottom_navigation_provider.dart';
import 'package:provider_simple_movie/ui/count_home_widget.dart';
import 'package:provider_simple_movie/ui/movie_list_widget.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  BottomnavigationProvider? _bottomnavigationProvider;

  Widget _navigationBody() {
    switch (_bottomnavigationProvider!.currentPage) {
      case 0:
        return const CountHomeWidget();
        break;
      case 1:
        return const MovieListWidget();
        break;
    }
    return Container();
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movie'),
      ],
      currentIndex: _bottomnavigationProvider!.currentPage,
      selectedItemColor: Colors.green,
      onTap: (index) {
        //provider navigation state
        _bottomnavigationProvider!.updateCurrentPage(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _bottomnavigationProvider = Provider.of<BottomnavigationProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: _navigationBody(),
        bottomNavigationBar: _bottomNavigationBarWidget(),
      ),
    );
  }
}
