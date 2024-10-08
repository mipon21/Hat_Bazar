import 'package:go_router/go_router.dart';
import 'package:hat_bazar/Pages/Auth/Auth.dart';
import 'package:hat_bazar/Pages/Category/AddCategory.dart';
import 'package:hat_bazar/Pages/HomePage/HomePage.dart';
import 'package:hat_bazar/Pages/Product/AddProduct.dart';

// GoRouter configuration
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => 
      Homepage(),
    ),
    GoRoute(
      path: '/addProduct',
      builder: (context, state) => 
      AddProduct(),
    ),
    GoRoute(
      path: '/addCategory',
      builder: (context, state) => 
      AddCategory(),
    ),
    GoRoute(
      path: '/authPage',
      builder: (context, state) => 
      AuthPage(),
    ),
  ],
);