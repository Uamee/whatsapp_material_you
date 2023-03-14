import 'package:flutter/material.dart';
import 'package:whatsapp_material_you/components/sections/home_screen_sections/profile_list.dart';
import 'package:whatsapp_material_you/components/sections/home_screen_sections/search_bar.dart';
import 'package:whatsapp_material_you/components/sections/home_screen_sections/status_list.dart';
import 'package:whatsapp_material_you/data/users.dart';
import 'package:whatsapp_material_you/screens/config_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  TextEditingController searchControler = TextEditingController();
  List<Users> users = allUsers;

  PageController _pageController = PageController(initialPage: 0);

  final pages = [
    ProfileScreen,
    StatusScreen,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: make app bar mutable by each screen
      //TODO: make animation fade-out/fade-in for the searchbar
      appBar: _showAppBar()
          ? AppBar(
              //elevation: 4,
              title: Padding(
                padding: EdgeInsets.only(top: 16.0, left: 12),
                child: Text(
                  index == 0 ? "Whatsapp" : "Status",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, right: 18),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ConfigScreen()));
                      },
                      icon: const Icon(Icons.settings)),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(65),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SearchBar(
                    textEditingController: searchControler,
                    onKeywordChanged: searchContact,
                    maxHeight: 48,
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.15),
                    borderColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.15),
                    borderWidth: 0,
                    borderRadius: BorderRadius.circular(90.0),
                    textPadding: const EdgeInsets.symmetric(horizontal: 16),
                    hintText: index == 0
                        ? 'Procurar conversas..'
                        : 'Procurar status..',
                    hintStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(0.0, 0.0),
              child: Container(),
            ),
      body: selectedItem(index),
      bottomNavigationBar: NavigationBar(
          height: 70,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.chat_bubble_outline),
                selectedIcon: Icon(Icons.chat_bubble),
                label: 'Conversas'),
            NavigationDestination(
                icon: Icon(Icons.donut_large_outlined),
                selectedIcon: Icon(Icons.donut_large),
                label: 'Status'),
            NavigationDestination(
                icon: Icon(Icons.phone_in_talk_outlined),
                selectedIcon: Icon(Icons.phone_in_talk),
                label: 'Ligações'),
          ]),
      floatingActionButton: FloatingActionButton(
        child: index == 0 ? Icon(Icons.person_add) : Icon(Icons.edit),
        onPressed: () {},
      ),
    );
  }

  Widget selectedItem(int index) {
    switch (index) {
      case 0:
        {
          return ProfileScreen(users);
        }

      case 1:
        {
          return StatusScreen(users);
        }
      case 2:
        {
          return StatusScreen(users);
        }
    }
    return ProfileScreen(users);
  }

  bool _showAppBar() {
    return true;
  }

  void searchContact(String query) {
    final suggestions = allUsers.where((contact) {
      final contactTitle = contact.title.toLowerCase();
      final input = query.toLowerCase();

      return contactTitle.contains(input);
    }).toList();

    setState(() => users = suggestions);
  }
}
