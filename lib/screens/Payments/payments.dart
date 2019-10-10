import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zing_fitnes_trainer/providers/paymentsProvider.dart';
import 'package:zing_fitnes_trainer/screens/Payments/modules/paymentRecordedElement.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class Payments extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: PaymentsHome(),
    );
  }
}

class PaymentsHome extends StatelessWidget{
  final col=MyColors();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: Drawer(),

      appBar: AppBar(
        title: Center(
          child:Text('Payments',style:TextStyle(color: col.textBlack)) ,
        ),

        iconTheme: IconThemeData(
          color: col.textBlack
        ),

        actions: <Widget>[
          Icon(Icons.add)
        ],


        elevation: 0,

        backgroundColor:col.skyBlue ,

        
      ),


      body: Container(
        decoration: BoxDecoration(
          color:col.skyBlue,
        ),

        child: ListView(
          children: <Widget>[

            //this is the container holding the slide show
            Container(
            
              child: SlideShow(),
            ),



          ///
          ///this is the section below the slider
          ///
           Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width/20, 
                
              ),

              child: Column(
                children: <Widget>[
                  //
                  //this is the header to the white box
                  //
                    Container(
                      child:Text('Payment History', textAlign: TextAlign.left,) ,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical:MediaQuery.of(context).size.height/70,
                        horizontal: 0 
                      ),
                    ),


                    ///
                    ///This is  the section for the white box with the 
                    ///
                    Container(
                      decoration:BoxDecoration(
                        color:col.white,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      // padding:  EdgeInsets.symmetric( 
                      //   vertical: MediaQuery.of(context).size.height/20
                      // ),

                      padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/25),

                      //height: MediaQuery.of(context).size.height/1.8,
                      width: double.infinity,

                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height/1.9
                      ), 

                      child: SingleChildScrollView(
                        child:
                          Column(
                            children: <Widget>[
                              PaymentRecordedElement(userName: 'Charlottte Karlsen', date: '23-08-2018, 8:15pm', amount: '200',),
                              Divider(thickness: 2,),
                              PaymentRecordedElement(userName: 'Charlotte Karlden', date: '23-08-2018, 8:15pm', amount: '200',),
                              Divider(thickness: 1,),
                              PaymentRecordedElement(userName: 'Alora Griffiths', date: '23-08-2018, 8:15pm', amount: '200',),
                              Divider(thickness: 1,),
                              PaymentRecordedElement(userName: 'Arthur Edelman', date: '23-08-2018, 8:15pm', amount: '200',),
                              Divider(thickness: 2,),
                              PaymentRecordedElement(userName: 'Jakob Owens', date: '23-08-2018, 8:15pm', amount: '200',),
                              Divider(thickness: 1,),
                              PaymentRecordedElement(userName: 'victor Freitas', date: '23-08-2018, 8:15pm', amount: '200',),
                              Divider(thickness: 1,),
                            ],
                      ),
                        
                      )

                    )
                ],
              ),
           )
          ],
        ),
      ),


    );
  }
}





///
///This is the class for the slide show here, it is been called above
///

class SlideShow extends StatelessWidget{
  final col=MyColors();
  
  ///
  ///this is the map function we will use in creating the dots indicators under the slide
  ///
  List<T> map<T>(List list, Function handler){
    List<T> result=[];
    for (var i=0; i<list.length; i++){
      result.add(handler(i,list[i]));
    }
    return result;
  }


  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_)=>PaymentsProvider(),
        )
      ],

      child:  Consumer<PaymentsProvider>(
        builder: (context, data, child)=>
        Column(
          children: <Widget>[
            Container(
              child: CarouselSlider(
                height: MediaQuery.of(context).size.height/4,
                initialPage: 0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
                pauseAutoPlayOnTouch: Duration(seconds: 10),
                onPageChanged: (index){
                  data.currentcounter=index;
            
                },
                


                items: data.readlist.map((Widget text){
                  return new  Container(
                    height: MediaQuery.of(context).size.height/5.1,
                    width: MediaQuery.of(context).size.width/1.4,
                    color: Colors.blue,
                    child: Center(child:text)
                  );
                }).toList(),
                
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/50),
              child: Consumer<PaymentsProvider>(
                builder: (context, data, child)=>
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   //
                   //here we create three containers based on the number of elements in the list for the slide items
                   //instead of us giving children, we use the map function created above to create the container
                   //
                    children:map<Widget>(
                      data.readlist, (index, text){
                        return Container(
                          width:10,
                          height: 10,
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),

                          decoration: BoxDecoration(
                            shape:BoxShape.circle,
                            color:data.currentcounter==index ? col.deepBlue:col.white 
                          ),

                        );
                      }
                    )
                  ),
                
              )
            )


          ],
        )
      ),
    );
  }
}













