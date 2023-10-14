import 'package:flutter/material.dart';

import '../../presentation/home/home_controller.dart';


class HomeAppBarWidget extends AppBar {
  final BuildContext context;
  final HomeController controller;
  HomeAppBarWidget(
      {super.key,
      required this.context,
      required this.controller,
      })
      : super(
          backgroundColor: Colors.white,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "E-Commerz",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          elevation: 2,
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: controller.goToCartScreen,
                icon: Icon(Icons.shopping_cart_outlined, color: Theme.of(context).primaryColor,)),

          ],
          leading:  IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.person, color: Theme.of(context).primaryColor,)
          ),
        );
}
