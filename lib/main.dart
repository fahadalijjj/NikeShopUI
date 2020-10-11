import 'package:flutter/material.dart';
import 'package:flutter_app_speedcode2/productscreen.dart';

void main() {
  runApp(Nike());
}

class Nike extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NikeUi(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NikeUi extends StatefulWidget {
  @override
  _NikeUiState createState() => _NikeUiState();
}

class _NikeUiState extends State<NikeUi> {
  Color blkcolor = Colors.black;
  Color whiteclr = Colors.white;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    Radius top = Radius.circular(60);
    return Scaffold(
      backgroundColor: blkcolor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.arrow_back_ios,
                    color: whiteclr,
                  ),
                  SizedBox(
                    width: w / 1.8,
                  ),
                  Icon(
                    Icons.filter_list,
                    color: whiteclr,
                    size: 30,
                  ),
                  Icon(
                    Icons.menu,
                    color: whiteclr,
                    size: 30,
                  )
                ],
              ),
            ),
            SizedBox(
              height: h / 35,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Nike',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: ' Shoes',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic))
              ]),
            ),
            SizedBox(
              height: h / 40,
            ),
            Expanded(
              child: Container(
                width: w,
                decoration: BoxDecoration(
                    color: whiteclr,
                    borderRadius: BorderRadius.only(topLeft: top)),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        height: h - 310,
                        child: ListView(
                          children: <Widget>[
                            buildcard('assets/nike2.png', 'Shoes Design One',
                                '300\$'),
                            buildcard('assets/nike1.png', 'Shoes Design Two',
                                '200\$'),
                            buildcard('assets/nike3.png', 'Shoes Design Three',
                                '700\$'),
                            buildcard('assets/nike4.png', 'Shoes Design Four',
                                '100\$'),
                            buildcard('assets/nike5.png', 'Shoes Design Five',
                                '600\$'),
                            buildcard(
                                'assets/nike6.png', 'Shoes Design Six', '900\$')
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: 60,
                              height: 60,
                              child: Icon(Icons.search),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(width: .7, color: blkcolor)),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              child: Icon(Icons.shopping_basket),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(width: .7, color: blkcolor)),
                            ),
                            Container(
                              width: 120,
                              height: 60,
                              child: Center(
                                child: Text(
                                  'Checkout',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: whiteclr,
                                      fontSize: 17),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: blkcolor, blurRadius: 10)
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: blkcolor),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildcard(String imgpath, String name, String price) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductScreen(
                  imgpath: imgpath,
              price: price,
              name: name,
                )));
      },
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Hero(
                    tag: imgpath,
                    child: Image(
                      image: AssetImage(imgpath),
                      fit: BoxFit.contain,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                            fontSize: 13, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                  Icon(
                    Icons.add,
                    size: 30,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
