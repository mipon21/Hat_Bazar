import 'package:go_router/go_router.dart';
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
  ],
);