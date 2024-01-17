import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

class clickz extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return cs();
  }
}
  class cs extends State<clickz>
  {
   
  var _minimumPadding=5.0;
  var _currencies=["rupees","dollers","pounds"];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
      title:Text ("yes"),
      backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView( children: <Widget>[
             getImageAsset(),
             Padding(
            
              padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
              child: TextField(
              decoration: InputDecoration(

                labelText: "principal",
               
                

                // hintText: "enter principle e.g. 12000",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
             )),
              Padding(
                padding: EdgeInsets.only(top: _minimumPadding,bottom:_minimumPadding),
                child: TextField(
              decoration: InputDecoration(
                labelText: "rate of interest",
                // hintText: "enter principle e.g. 12000",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
             )),
               Padding(
              padding:EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
               child:Row(
                children: <Widget>[
                Expanded( child: TextField(
              decoration: InputDecoration(
                labelText: "term",
                // hintText: "time in interest",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
             )),
             Container(width: _minimumPadding*5,),
              Expanded(child: DropdownButton<String>(
                items: _currencies.map((String value){
                  return DropdownMenuItem<String>(

                    value: value,
                    child: Text(value),
                  );
                }).toList(),

                value: "rupees",
                onChanged: (String? newValueSelected){},

               ))


                ],
               )),
                Padding(padding:EdgeInsets.only(bottom: _minimumPadding,top: _minimumPadding),
               child: Row(children:<Widget> [
                Expanded(
                 child:ElevatedButton(
                
                 child:Text("calculate"),
                    onPressed:(){

                    },
                  ),
                  ),
                  SizedBox(width: 5,),
               
                Expanded(
                  child: ElevatedButton(
                    child:Text("reset"),
                    onPressed:(){

                    },
                  ),
               ),

              ],))
             

        ]

        ),
      ),
    );
    
  }
  Widget getImageAsset()
  {
    AssetImage assetImage = AssetImage( "assets/money.png");
    Image image=Image(image: assetImage, width: 190,height: 190,);

    return Container(child: image,margin: EdgeInsets.all(_minimumPadding * 10),);
  }
  
}