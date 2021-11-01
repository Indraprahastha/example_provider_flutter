import 'package:example_flutter/pages/product_detail_screen.dart';
import 'package:example_flutter/providers/all_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final bool isFavorite;

  ProductItem(this.id, this.title, this.imageUrl, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    print("ProductItem");
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: id,
            );
          },
          child: Icon(Icons.add),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: !isFavorite
                ? Icon(Icons.favorite_border_outlined)
                : Icon(Icons.face),
            color: Theme.of(context).accentColor,
            onPressed: () {
              productData.changeFaf(id);
            },
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
