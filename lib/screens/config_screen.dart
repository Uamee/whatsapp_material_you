import 'package:flutter/material.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Padding(
            padding: EdgeInsets.only(top: 4.0, right: 120),
            child: Text(
              "Configurações",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          _buildUserConfig(context),
          _buildUserDevices(context),
          _buildDefinitions(context), //Just mock possible configs, not accurate
        ],
      ),
    );
  }
}

_buildUserConfig(BuildContext context) {
  double size = 40;
  double iconSize = 24;
  double borderRadius = 12;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    child: Material(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.20),
                borderRadius: BorderRadius.circular(30)),
            child: const ListTile(
              leading: Image(
                image: AssetImage("assets/UserProfile.png"),
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
              title: Text("Nathan"),
              subtitle:
                  Text("Estudante de engenharia mecatrônica, entusias..."),
            ),
          ),
          Positioned(
            width: size,
            height: size,
            right: 18,
            top: 65,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(borderRadius)),
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.45),
                      borderRadius: BorderRadius.circular(borderRadius)),
                  child: Icon(
                    Icons.edit,
                    size: iconSize,
                  )),
            ),
          )
        ],
      ),
    ),
  );
}

_buildUserDevices(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 30.0, top: 12),
        child: Text(
          "Dispositivos",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      _buildConfigCardContent(
        context,
        Icon(Icons.devices),
        "Aparelhos conectados",
        Icon(Icons.arrow_forward_ios),
      )
    ],
  );
}

_buildDefinitions(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 30.0, top: 12),
        child: Text(
          "Definir",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      _buildConfigCardContent(
        context,
        Icon(Icons.lock),
        "Conta e privacidade",
        Icon(Icons.arrow_forward_ios),
      ),
      _buildConfigCardContent(
        context,
        Icon(Icons.chat_bubble),
        "Conversas",
        Icon(Icons.arrow_forward_ios),
      ),
      _buildConfigCardContent(
        context,
        Icon(Icons.folder),
        "Armazenamento e dados",
        Icon(Icons.arrow_forward_ios),
      ),
    ],
  );
}

_buildConfigCardContent(BuildContext context, icon, title, trailing) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    child: Material(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.20),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(30)),
              child: icon,
            ),
            title: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            trailing: trailing,
          ),
        ),
      ),
    ),
  );
}
