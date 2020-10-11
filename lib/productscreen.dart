import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class ProductScreen extends StatefulWidget {
  final imgpath;
  final name;
  final price;

  ProductScreen({this.name, this.imgpath, this.price});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Color blkclr = Colors.black;
  Color whiteclr = Colors.white;
  Color trans = Colors.transparent;
  String SelectedCard = 'Design';
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: trans,
        title: Text(
          'Details',
          style: TextStyle(color: blkclr),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: blkclr,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
            Icons.more_horiz,
            color: blkclr,
          ))
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: h,
            width: w,
            color: trans,
          ),
          Positioned(
            top: 150,
            child: Container(
              height: h,
              width: w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
                  color: blkclr,
                  boxShadow: [BoxShadow(color: blkclr, blurRadius: 7)]),
            ),
          ),
          Positioned(
            bottom: h / 1.65,
            left: w / 5.4,
            child: Hero(
              tag: widget.imgpath,
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.imgpath),
                        fit: BoxFit.contain)),
              ),
            ),
          ),
          Positioned(
            top: 250,
            left: 30,
            child: Text(
              widget.name,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 40,
                  color: whiteclr,
                  shadows: [Shadow(color: whiteclr, blurRadius: 10)]),
            ),
          ),
          Positioned(
            top: 350,
            left: 30,
            child: Container(
              width: w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    widget.price,
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 30,
                        color: whiteclr,
                        shadows: [Shadow(color: whiteclr, blurRadius: 5)]),
                  ),
                  Container(
                    width: 1,
                    height: 25,
                    decoration: BoxDecoration(
                        //   color: whiteclr,
                        boxShadow: [BoxShadow(color: whiteclr, blurRadius: 2)]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: whiteclr, blurRadius: 3)
                          ],
                          color: whiteclr),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(
                            Icons.remove,
                            size: 35,
                          ),
                          Text(
                            '2',
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.w500),
                          ),
                          Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: blkclr),
                              child: Icon(
                                Icons.add,
                                size: 35,
                                color: whiteclr,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            child: Container(
              height: 250,
              width: w,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[

                  detailcard('Company', 'Nike', '50 units available'),
                  detailcard('Color', 'Black', '5 different color available'),
                  detailcard('Size', '42', 'European Size'),
                  detailcard('Weight', '1', 'pound'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget detailcard(String cardtitle, String info, String unit) {
    return InkWell(
      onTap: (){
        selectcard(cardtitle);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          curve: Curves.easeIn,
          height: 250,
          width: 150,
          duration: Duration(milliseconds: 400),
          decoration: (BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: cardtitle == SelectedCard ? whiteclr : blkclr,
              border: Border.all(
                  color: cardtitle == SelectedCard ? Colors.transparent : whiteclr,
                  style: BorderStyle.solid,
                  width: 1),
              boxShadow: [
                BoxShadow(
                    color:
                        cardtitle == SelectedCard ? Colors.transparent : whiteclr,
                    blurRadius: 5)
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8,left: 15),
                child: Text(
                  cardtitle,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: cardtitle == SelectedCard ? blkclr : whiteclr),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      info,
                      style: TextStyle(
                          fontSize: 24,
                          color: cardtitle == SelectedCard ? blkclr : whiteclr,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      unit,
                      style: TextStyle(
                          fontSize: 12,
                          color: cardtitle == SelectedCard ? blkclr : whiteclr,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  selectcard(cardtitle) {
    setState(() {
      SelectedCard = cardtitle;
    });
  }
}
