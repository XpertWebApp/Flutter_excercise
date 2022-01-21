import 'package:demo_project/model/model.dart';
import 'package:demo_project/utils/color_class.dart';
import 'package:demo_project/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemDetails extends StatefulWidget {
  ItemListModel? model;

  ItemDetails({this.model});

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor().appColor,
        title: Text(
          "Product detail",
          style: AppTextStyle().appBarStyle,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Hero(
              tag: widget.model!.image!,
              transitionOnUserGestures: true,
              child: Image.network(
                widget.model!.image!,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .30,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.model!.category!.toUpperCase(),
                      style: AppTextStyle().titleStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Rs ${widget.model!.price.toString()}",
                      style: AppTextStyle().priceStyle,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.model!.title!.toUpperCase(),
                style: AppTextStyle().subTitleStyle,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.model!.description!,
                style: AppTextStyle().descriptionStyle,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              child: RatingBar.builder(
                initialRating:
                    double.parse(widget.model!.rating!.rate.toString()),
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: true,
                itemSize: 30,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 2),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
