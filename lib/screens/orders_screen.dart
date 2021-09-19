import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/widgets/main_drawer.dart';
import 'package:shop_app/widgets/order_item.dart' as ord;

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders-screen';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    final isEmpty = orderData.orders.length == 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: MainDrawer(),
      body: isEmpty
          ? Center(
            child: Text(
                'No Orders',
                style: TextStyle(
                  fontFamily: 'Lato-Regular',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
          )
          : ListView.builder(
              itemCount: orderData.orders.length,
              itemBuilder: (ctx, i) => ord.OrderItem(orderData.orders[i]),
            ),
    );
  }
}
