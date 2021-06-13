import 'package:flutter/material.dart';
import 'package:shopping_app/ShoppingBasketData.dart';
import 'Product.dart';
class DescriptionPage extends StatelessWidget {

  Product _product;
  DescriptionPage(this._product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "فروشگاه",style:
        TextStyle(color: Colors.black45)
        ),
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black45,
        ),
        backgroundColor: Colors.white,
        elevation: 0,

      ),
      body: Builder(
        builder:(context)=> Column(
           children: <Widget>[
             SizedBox(
               height: 10,
             ),
             Align(
               child: Padding(
                 padding: EdgeInsets.only(left: 10),
                 child: Text(
                   "Shoes",
                   style: TextStyle(
                     color:Colors.red[700],
                     fontSize: 40
                   ),
                 ),
               ),
               alignment:Alignment.topLeft,
             ),
             SizedBox(
               height: 30,
             ),
             Center(
               child: Image.network(
                   _product.imageUrl,
                    height: 200,
                    width: 200,
                    fit: BoxFit.contain,
               ),
             ),
             Text(_product.price,
             style: TextStyle(
               color: Colors.red[700],
               fontSize: 30,
             )),

             Text(_product.productName,
                 style: TextStyle(
                   color: Colors.grey[700],
                   fontSize: 20,
                 )),

             SizedBox(
               height: 40,
             ),
             Padding(
               padding: EdgeInsets.only(left: 45,right: 45),
               child: Text(_product.description,
               style: TextStyle(
                 color: Colors.grey[500],
                 fontSize: 16,
               ),
                 textDirection: TextDirection.rtl,
                 textAlign: TextAlign.center,
               ),
             ),
             Expanded(
               child: Align(
                 child: Padding(
                   padding: EdgeInsets.only(bottom: 20),
                   child: GestureDetector(
                     onTap: (){
                       print("added to basket${_product.productName}");
                       ShoppingBasketData.getInstance().basketItems.add(_product);
                       print(ShoppingBasketData.getInstance().basketItems.length);
                       Scaffold.of(context).showSnackBar(
                           SnackBar(
                             content: Text("${_product.productName}"+"به سبد خرید شما افزوده شد",
                             style: TextStyle(fontSize: 15),),
                           ));
                     },
                     child: Container(
                       child: Center(
                         child: Text("افزودن به سبد خرید",
                           style: TextStyle(
                             fontSize: 18,
                             color: Colors.white,
                           ),
                         ),
                       ),

                       decoration: BoxDecoration(
                           color: Colors.red[600],
                         borderRadius: BorderRadius.all((Radius.circular(10)))
                       ),

                       width: MediaQuery.of(context).size.width-50,
                       height: 70,

                     ),
                   ),
                 ),
                 alignment: Alignment.bottomCenter,
               ),
             )
           ],
        ),
      ),
    );
  }
}
