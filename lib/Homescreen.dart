import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lisapicall/Apiservice.dart';
import 'package:lisapicall/Model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UsersModel> datalist = [];

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Api Calling'),
        centerTitle: true,
      ),
      body: Container(
        height: 300,
        child: ListView.builder(
            itemCount: datalist.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(datalist[index].address.street),
                ],
              );
            }),
      ),
    );
  }

  Future<void> fetchdata() async {
    List<UsersModel> model = await ApiService().getdata();
    setState(() {
      datalist = model;
    });
  }
}
