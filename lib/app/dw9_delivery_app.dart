import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:vaquinha_burguer/app/pages/auth/login/login_page.dart';
import 'package:vaquinha_burguer/app/pages/auth/login/login_router.dart';
import 'package:vaquinha_burguer/app/pages/auth/register/register_page.dart';
import 'package:vaquinha_burguer/app/pages/auth/register/register_router.dart';
import 'package:vaquinha_burguer/app/pages/home/home_router.dart';
import 'package:vaquinha_burguer/app/pages/order/order_completed_page.dart';
import 'package:vaquinha_burguer/app/pages/order/order_page.dart';
import 'package:vaquinha_burguer/app/pages/order/order_router.dart';
import 'package:vaquinha_burguer/app/pages/product_detail/product_detail_router.dart';
import 'package:vaquinha_burguer/app/pages/splash/splash_page.dart';

import 'core/global/global_context.dart';
import 'core/provider/application_binding.dart';
import 'core/ui/theme/theme_config.dart';

class Dw9DeliveryApp extends StatelessWidget {
  final _navKey = GlobalKey<NavigatorState>();

  Dw9DeliveryApp({super.key}) {
    GlobalContext.i.navigatorKey = _navKey;
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'delivery app',
        theme: ThemeConfig.theme,
        navigatorKey: _navKey,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/productDetail': (context) => ProductDetailRouter.page,
          '/auth/login': (context) => LoginRouter.page,
          '/auth/register': (context) => RegisterRouter.page,
          '/order': (context) => OrderRouter.page,
          '/order/completed': (context) => const OrderCompletedPage()
        },
      ),
    );
  }
}
