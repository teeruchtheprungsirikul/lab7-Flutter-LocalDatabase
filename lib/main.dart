import 'package:flutter/material.dart';
//import 'package:flutter_localdatabase/model/transaction.dart';
import 'package:flutter_localdatabase/providers/transaction_provider.dart';
import 'package:flutter_localdatabase/screens/form_screen.dart';
import 'package:flutter_localdatabase/screens/home_screen.dart';
//import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) {
            return TransactionProvider();
          })
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'แอปรายจ่าย'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.green,
          body: TabBarView(
            children: [
              HomeScreen(),
              FormScreen(),
            ],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.list),
                text: 'รายการ',
                
              ),
              Tab(
                icon: Icon(Icons.add),
                text: 'เพิ่มข้อมูล',
              )
            ],
          ),
        ));
  }
}
