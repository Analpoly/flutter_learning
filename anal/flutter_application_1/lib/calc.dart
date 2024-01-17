// import 'dart:math';

import 'package:flutter/material.dart';

class CAlc3 extends StatelessWidget
{
  @override
 
   final _currencies=["rupees","pounds","dollars"];
  final _minimumPadding = 5.0;
  // var RaisedButton;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 196, 208, 114),
      appBar: AppBar(
        title: Text("Simple interest calculator"),
        backgroundColor: Color.fromARGB(255, 218, 223, 156),
      ),
      body: Container(
        
        // margin: EdgeInsets.all(_minimumPadding * 2),
        child: Column(

          children: <Widget>[
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
          ],
        ),
      ),
    );
  }

  Widget getImageAsset()
  {
    AssetImage assetImage = AssetImage( "assets/dojob.png");
    Image image=Image(image: assetImage, width: 190,height: 190,);

    return Container(child: image,margin: EdgeInsets.all(_minimumPadding * 10),);
  }
  
  
}