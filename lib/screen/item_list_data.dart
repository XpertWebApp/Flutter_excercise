import 'package:demo_project/bloc/get_api_bloc.dart';
import 'package:demo_project/bloc/get_api_event.dart';
import 'package:demo_project/bloc/get_api_state.dart';
import 'package:demo_project/model/model.dart';
import 'package:demo_project/utils/color_class.dart';
import 'package:demo_project/utils/progress_dialog.dart';
import 'package:demo_project/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'item_details.dart';

class ItemDemoList extends StatefulWidget {
  @override
  _ItemDemoListState createState() => _ItemDemoListState();
}

class _ItemDemoListState extends State<ItemDemoList> {
  GetApiBloc? apiBloc;

  @override
  void initState() {
    apiBloc = BlocProvider.of<GetApiBloc>(context, listen: false);
    apiBloc!.add(GetItemDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor().appColor,
        title: Text(
          "Items",
          style: AppTextStyle().appBarStyle,
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: BlocBuilder<GetApiBloc, GetApiProfileState>(
            bloc: apiBloc,
            builder: (context, stateW) {
              return ModalProgressHUD(
                inAsyncCall: stateW is GetApiLoadingEvent ? true : false,
                child: bodyData(
                    stateW is SubmissionItemSuccess ? stateW.getResponse : []),
              );
            }),
      ),
    );
  }

  Widget bodyData(List<ItemListModel> object) {
    return ListView.builder(
        itemCount: object.length,
        itemBuilder: (context, pos) {
          return Card(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(seconds: 2),
                        pageBuilder: (_, __, ___) =>
                            ItemDetails(model: object[pos]),
                        settings: RouteSettings(
                          arguments: pos,
                        )));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Hero(
                      tag: object[pos].image!,
                      transitionOnUserGestures: true,
                      child: Image.network(
                        object[pos].image!,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            object[pos].category!.toUpperCase(),
                            style: AppTextStyle().titleStyle,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            object[pos].title!,
                            style: AppTextStyle().subTitleStyle,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            object[pos].description!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle().descriptionStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
