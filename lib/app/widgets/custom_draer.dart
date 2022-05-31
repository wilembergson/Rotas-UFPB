import 'package:flutter/material.dart';
import 'package:routes_ufpb/app/about_project.dart';
import 'package:routes_ufpb/app/widgets/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final String? appVersion;
  const CustomDrawer({
    Key? key,
    required this.appVersion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          ListView(
            children: [
              DrawerHeader(
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.school,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'Mapamento da Universidade Federal da Paraíba',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              DrawerTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const AboutProject()),
                    ),
                  );
                },
                icon: Icons.contact_support,
                page: 0,
                text: 'SOBRE O PROJETO',
              ),
              const SizedBox(height: 10.0),
              const Divider(
                thickness: 2,
              ),
              if (appVersion!.isNotEmpty)
                Flexible(
                  child: Text(
                    appVersion!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 26.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
