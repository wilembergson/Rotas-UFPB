import 'package:flutter/material.dart';
import 'package:routes_ufpb/app/widgets/profile_info.dart';
import 'package:routes_ufpb/utils/consts.dart';

class AboutProject extends StatelessWidget {
  const AboutProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final consts = Consts();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sobre o projeto"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              consts.projectInfo,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Professora Orientadora",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ProfileInfo(
                  image: consts.studentsImage.first,
                  title: consts.profTitle,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Alunos que participaram do desenvolvimento:",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: AlignedGrid(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AlignedGrid extends StatelessWidget {
  final double runSpacing = 4;
  final double spacing = 4;
  final int listSize = Consts().studentsImage.length;
  final columns = 4;

  AlignedGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        runSpacing: runSpacing,
        spacing: spacing,
        alignment: WrapAlignment.center,
        children: List.generate(listSize, (index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ProfileInfo(
              image: Consts().studentsImage[index],
              title: Consts().studentsName[index],
              color: Colors.amber,
            ),
          );
        }),
      ),
    );
  }
}
