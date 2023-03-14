import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:whatsapp_material_you/data/users.dart';
import 'package:whatsapp_material_you/screens/home_screen.dart';
import 'dart:math' as math;

class StatusScreen extends StatelessWidget {
  const StatusScreen(
    this.users, {
    super.key,
  });
  final List<Users> users;
  @override
  Widget build(BuildContext context) {
    return _buildStatus(context);
  }

  _buildStatus(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        dynamic user = users[index];

        if (index == 0) {
          return _buildUserStatus(context);
        } else {
          return _buildStatusTiles(index, user, context);
        }
      },
    );
  }

  _buildUserStatus(BuildContext context) {
    double size = 17;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Material(
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.20),
              borderRadius: BorderRadius.circular(30)),
          child: ListTile(
            leading: Stack(
              children: [
                Image(
                  image: AssetImage("assets/UserProfile.png"),
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
                Positioned(
                  width: size,
                  height: size,
                  right: 1,
                  bottom: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(40)),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.45),
                            borderRadius: BorderRadius.circular(40)),
                        child: Icon(
                          Icons.add,
                          size: size,
                        )),
                  ),
                )
              ],
            ),
            title: Text("Meu Status"),
            subtitle: Text("Adicionar aos meus status"),
          ),
        ),
      ),
    );
  }

  _buildStatusTiles(int index, user, BuildContext context) {
    double circle = 55;
    return ListTile(
      leading: CircularStepProgressIndicator(
        totalSteps: 7,
        currentStep: 5,
        stepSize: 3,
        selectedColor: Theme.of(context).colorScheme.primary,
        unselectedColor:
            Theme.of(context).colorScheme.onBackground.withOpacity(0.40),
        padding: math.pi / 12,
        width: circle,
        height: circle,
        startingAngle: -math.pi * 0.96,
        // arcSize: math.pi * 2 / 3 * 2,

        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 5,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.20),
            ),
            borderRadius: BorderRadius.circular(100), //<-- SEE HERE
          ),
          child: Image(
            image: AssetImage(users[index].assetImage),
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
      ),

      title: Text(
        user.title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        users[index].formatedLastStatusTime,
        overflow: TextOverflow.ellipsis,
      ),
      //onTap: () => //TODO: implement MaterialPageRouter to => chat,
    );
  }
}
