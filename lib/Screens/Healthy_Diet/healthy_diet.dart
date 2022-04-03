
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'data.dart';

class HealthyDiet extends StatefulWidget {
  @override
  _HealthyDiet createState() => _HealthyDiet();
}

class _HealthyDiet extends State<HealthyDiet> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height:190,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
         decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
        ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          post["name"],
                          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        // Text(
                        //   post["details"],
                        //   style: const TextStyle(fontSize: 17, color: Colors.grey),
                        // ),
                      ],
                    ),
                    DialogButton(
                        onPressed:(){
                          Alert(
                              context: context,
                              title: "More Details",
                              content: Column(
                                children: <Widget>[
                                  Image.asset("assets/${post["image"]}"),
                                  Text(
                                    "${post["details"]}"
                                  ),
                                ],
                              ),
                              buttons: [
                                DialogButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    "OK",
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                  ),
                                )
                              ]).show();
                        },
                        child: Text("Read More",style: TextStyle(color: Colors.white, fontSize: 20)),
                    )
                  ],
                ),
              ),
            ),
          ));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {

      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height*0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.tealAccent,
        appBar: AppBar(
          title: Text("Healthy Diet Tips"),
          elevation: 0,
          backgroundColor: Colors.blueAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () {
              Navigator.pop(context);
              },
            color: Colors.black,
          ),
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer?0:1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer?0:categoryHeight,
                    child: categoriesScroller),
              ),
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform:  Matrix4.identity()..scale(scale,scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                                heightFactor: 0.7,
                                alignment: Alignment.topCenter,
                                child: itemsData[index]),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.orange.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextButton(
                        onPressed: (){
                          Alert(
                              context: context,
                              title: "Drink more Water to avoid dehydration",
                              content: Column(
                                children: <Widget>[
                                  Image.asset("assets/c1.jpeg"),
                                ],
                              ),
                              buttons: [
                                DialogButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    "OK",
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                  ),
                                )
                              ]).show();
                        },
                       child:Text("Do You drink Enough water ?",
                        style: TextStyle(fontSize: 25, color: Colors.black87, fontWeight: FontWeight.bold),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 180,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.orange.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextButton(
                          onPressed: (){
                            Alert(
                                context: context,
                                title: "Inspirational Quotes",
                                content: Column(
                                  children: <Widget>[
                                    Image.asset("assets/q1.jpeg"),
                                    Image.asset("assets/q2.jpeg"),
                                  ],
                                ),
                                buttons: [
                                  DialogButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      "OK",
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                    ),
                                  )
                                ]).show();
                          },
                          child:Text("Motivational Quotes for Fitness",
                            style: TextStyle(fontSize: 24, color: Colors.black87, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color:Colors.orange.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextButton(
                        onPressed: (){
                          Alert(
                              context: context,
                              title: "Follow the 7 days workout plan and see results yourself",
                              content: Column(
                                children: <Widget>[
                                  Image.asset("assets/c2.jpg",height: 400,),
                                ],
                              ),
                              buttons: [
                                DialogButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    "OK",
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                  ),
                                )
                              ]).show();
                        },
                        child:Text("7 Days workout plan ",
                          style: TextStyle(fontSize: 25, color: Colors.black87, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
