import 'package:demo_project/screen/item_list_data.dart';
import 'package:demo_project/utils/color_class.dart';
import 'package:demo_project/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'api_request_module/api_request.dart';
import 'bloc/get_api_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          BlocProvider(
            create: (context) => GetApiBloc(apiRequest: ApiRequest()),
          ),
        ],
        child: MaterialApp(debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  ItemDemoList()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor().appColor,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Text(
            "Splash",
            style: AppTextStyle().splashStyle,
          ),
        ),
      ),
    );
  }
}
