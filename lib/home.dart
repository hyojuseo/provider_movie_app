import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_simple_movie/provider/bottom_navigation_provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  BottomnavigationProvider? _bottomnavigationProvider;

  Widget _navigationBody() {
    return Container();
  }

  Widget _bottomNavigationBarWidget() {
    return Consumer<BottomnavigationProvider>(
      builder: (context, provider, widget) {
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _bottomnavigationProvider =
        Provider.of<BottomnavigationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('movie'),
      ),
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
