import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrift_app/cubit/screentab_cubit.dart';
import 'package:thrift_app/ui/screens/created_posts.dart';
import '../../res/string_values.dart';
import 'create_post.dart';
import 'settings.dart';
import 'upcoming_events.dart';

class Home extends StatelessWidget {
  final List<Widget> _screens = [UpcomingEvents(), CreatedPost(), Settings()];
  final List<String> _titles = [kUpComingEvents, kCreatePostTitle, kSettings];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreentabCubit, ScreentabState>(
      builder: (context, state) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: state.bottomAppBarItemIndex,
          onTap: BlocProvider.of<ScreentabCubit>(context).changeView,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.view_agenda), label: kEvents),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: kAddPost),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: kSettings),
          ],
        ),
        appBar: AppBar(
          title: Text(_titles[state.bottomAppBarItemIndex]),
          actions: [
            if (state.bottomAppBarItemIndex == 1)
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreatePost()),
                    );
                  },
                  child: Text(
                    'Add New Post',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
          ],
        ),
        body: _screens[state.bottomAppBarItemIndex],
      ),
    );
  }
}
