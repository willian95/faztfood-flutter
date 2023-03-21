import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController passwordController =  TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.menu, color: Colors.black87),
          actions: [
            Container(
              height: 40,
              width: 40,
              margin: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage("resources/images/profile.jpg"),
                backgroundColor: Colors.transparent,
              ),
            )
          ],
        ),
        backgroundColor: Colors.grey.shade50,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          elevation: 0,
          currentIndex: 0,
          selectedItemColor: Colors.green.shade200,
          unselectedItemColor: Colors.grey.shade400,
          showSelectedLabels: false,
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Icon(Icons.home)),
            label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Icon(Icons.list)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Icon(Icons.shopping_bag)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Icon(Icons.settings)),
              label: '',
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi Mr Terrance,"),
                Text("Welcome Back!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                Container(
                  margin: EdgeInsets.only(top: 25, bottom: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                              topLeft: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0)),
                          ),
                          child: Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                                hintText: 'Search Here',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Food category", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                    TextButton(onPressed: (){}, child: Text("see all", style: TextStyle(color: Colors.green[400])))
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                  
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.green.shade300,
                            border: Border.all(
                              color: Colors.green.shade300,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset("resources/images/burger.png", height: 25, width: 25),
                              SizedBox(width: 5),
                              Text("Hamburger", style: TextStyle(color: Colors.white, fontSize: 15),)
                            ],
                          ),
                        ),
                  
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset("resources/images/french-fries.png", height: 25, width: 25),
                              SizedBox(width: 5),
                              Text("Fries", style: TextStyle(color: Colors.black, fontSize: 15),)
                            ],
                          ),
                        ),
                  
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset("resources/images/soft-drink.png", height: 25, width: 25),
                              SizedBox(width: 5),
                              Text("Drinks", style: TextStyle(color: Colors.black, fontSize: 15),)
                            ],
                          ),
                        ),
                  
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset("resources/images/coffee-cups.png", height: 25, width: 25),
                              SizedBox(width: 5),
                              Text("Coffee", style: TextStyle(color: Colors.black, fontSize: 15),)
                            ],
                          ),
                        )
                  
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Popular", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                      TextButton(onPressed: (){}, child: Text("see all", style: TextStyle(color: Colors.green[400])))
                    ],
                  ),
                ),
                GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.92,
                    mainAxisSpacing: 10
                  ),
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Text("Cheese Burguer")),
                          Image.asset("resources/images/food1.jpg"),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 6, left: 10),
                                child: Text("\$ 4.55", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)
                                )
                              ),
                              Container(
                                transform: Matrix4.translationValues(0, 8, 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.green.shade200
                                  ),
                                  onPressed: (){}, 
                                  child: Icon(Icons.add)
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Text("Cheese Burguer")),
                          Image.asset("resources/images/food1.jpg"),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 6, left: 10),
                                child: Text("\$ 4.55", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)
                                )
                              ),
                              Container(
                                transform: Matrix4.translationValues(0, 8, 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.green.shade200
                                  ),
                                  onPressed: (){}, 
                                  child: Icon(Icons.add)
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Text("Cheese Burguer")),
                          Image.asset("resources/images/food1.jpg"),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 6, left: 10),
                                child: Text("\$ 4.55", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)
                                )
                              ),
                              Container(
                                transform: Matrix4.translationValues(0, 8, 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.green.shade200
                                  ),
                                  onPressed: (){}, 
                                  child: Icon(Icons.add)
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Text("Cheese Burguer")),
                          Image.asset("resources/images/food1.jpg"),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 6, left: 10),
                                child: Text("\$ 4.55", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)
                                )
                              ),
                              Container(
                                transform: Matrix4.translationValues(0, 8, 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.green.shade200
                                  ),
                                  onPressed: (){}, 
                                  child: Icon(Icons.add)
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Text("Cheese Burguer")),
                          Image.asset("resources/images/food1.jpg"),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 6, left: 10),
                                child: Text("\$ 4.55", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)
                                )
                              ),
                              Container(
                                transform: Matrix4.translationValues(0, 8, 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.green.shade200
                                  ),
                                  onPressed: (){}, 
                                  child: Icon(Icons.add)
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Text("Cheese Burguer")),
                          Image.asset("resources/images/food1.jpg"),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 6, left: 10),
                                child: Text("\$ 4.55", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)
                                )
                              ),
                              Container(
                                transform: Matrix4.translationValues(0, 8, 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.green.shade200
                                  ),
                                  onPressed: (){}, 
                                  child: Icon(Icons.add)
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 50)
              ]
            ),
          ),
        )
      ),
    );
  }

}

