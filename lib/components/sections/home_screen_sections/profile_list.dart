import 'package:flutter/material.dart';
import 'package:whatsapp_material_you/data/users.dart';
import 'package:whatsapp_material_you/screens/chat_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen(this.users, {super.key});
  final List<Users> users;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.users.length,
      itemBuilder: (context, index) {
        final user = widget.users[index];

        return ListTile(
            leading: Image(
              image: AssetImage(widget.users[index].assetImage),
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '11:11',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.done_all,
                  size: 20,
                )
              ],
            ),
            title: Text(
              user.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              widget.users[index].subtitle,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ChatScreen())));
      },
    );
  }
}
