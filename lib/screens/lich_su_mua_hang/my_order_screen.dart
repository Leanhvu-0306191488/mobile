import 'package:doan/screens/lich_su_mua_hang/components/my_order_being_transported.dart';
import 'package:doan/screens/lich_su_mua_hang/components/my_order_cancelled.dart';
import 'package:doan/screens/lich_su_mua_hang/components/my_order_delivered.dart';
import 'package:doan/screens/lich_su_mua_hang/components/my_order_processing.dart';
import 'package:flutter/material.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);
  static String routeName = "/MyOder";
  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Đơn Hàng Của Tôi'),
            centerTitle: true,
            backgroundColor: Colors.blue,
            elevation: 10,
            bottom: const TabBar(
              isScrollable: true,
              indicatorColor: Colors.blueAccent,
              indicatorWeight: 3,
              tabs: [
                Tab(text: 'Đang xử lý'),
                Tab(text: 'Đang vận chuyển'),
                Tab(text: 'Đã giao'),
                Tab(text: 'Đã hủy'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Processing(),
              BeingTransported(),
              Delivered(),
              Cancelled(),
            ],
          ),
        ),
      );
}
