import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vaquinha_burguer/app/pages/home/home_page.dart';

import '../../repositories/products/product_repository_impl.dart';
import '../../repositories/products/products_repository.dart';
import 'home_controller.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepository>(
              create: (context) => ProductsRepositoryImpl(
                    dio: context.read(),
                  )),
          Provider(
            create: (context) => HomeController(context.read()),
          )
        ],
        child: const HomePage(),
      );
}
