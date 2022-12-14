import 'package:flutter/material.dart';

List<String> myList1 = ['happy', 'good', 'tall'];
List<String> myList2 = ['sad', 'bad', 'short'];

class CardsPage extends StatefulWidget{
  CardsPage({Key? key}) : super(key: key);
  @override
  _CardsPageState createState() => _CardsPageState();

}


class _CardsPageState extends State<CardsPage>{
  createAlertDialog(BuildContext context){
    TextEditingController textController1 = TextEditingController();
    TextEditingController textController2 = TextEditingController();
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('NEW PAIR OF OPPOSITES'),
        content: Column(
          children: [
            TextField(
              controller: textController1,
              decoration: InputDecoration(hintText: "Enter the first word")
            ),
            TextField(
                controller: textController2,
                decoration: InputDecoration(hintText: "Enter the antonym of the first word")
            ),
          ]
        ),
        actions: <Widget> [
          TextButton(onPressed: (){
            setState((){
              myList1.add(textController1.text);
              myList2.add(textController2.text);
              textController1.clear();
              textController2.clear();
              Navigator.of(context).pop();
            });
          },
              child: Text("SUBMIT"),
          ),
        ]
      );
    });
  }
  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text('FlashCards'),
    ),
    body: new Column(
        children: <Widget>[
          const Divider(
            color: Colors.grey,
            thickness: 3,
          ),
          new Expanded(
            child: GridView.builder( itemBuilder: (BuildContext context, int index){
              return Container(
                child: Column(
                    children: [
                      Text(myList1[index], style: TextStyle(color:Colors.white),),
                      Text(myList2[index], style: TextStyle(color:Colors.white),),
                      IconButton(onPressed: (){
                        setState(() {
                          myList1.removeAt(index);
                          myList2.removeAt(index);
                        });
                      }, icon: Icon(Icons.delete), color: Colors.white,),
                    ]
                ),

                alignment: Alignment.center,
                width: 200,
                height: 100,
                color: Colors.black,
              );
            }, itemCount: myList1.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 100,
                mainAxisSpacing: 11,
                crossAxisSpacing: 11,
              ),
            ),

          ),
        ]
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){createAlertDialog(context);},
      backgroundColor: Colors.black,
    ),
  );


}