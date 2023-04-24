import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/common/widget/listItems.dart';
import 'package:machine_test/common/widget/ui.dart';
import 'package:machine_test/repository/listApi.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ListApi listApi = ListApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Users List",
          style: GoogleFonts.openSans(
              fontSize: 25, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: Ui.getBoxDecorationRound(),
          child: Center(
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: FutureBuilder(
          future: listApi.getListItems(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: listApi.listModel.length,
                itemBuilder: ((context, index) {
                  return ListItems(
                    name: listApi.listModel[index].name,
                    email: listApi.listModel[index].email,
                    companyName: listApi.listModel[index].company.name,
                  );
                }),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }),
    );
  }
}
