import '../../../../../../core/config/routes/app.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);
  final DataBase dataBase = FireStoreDatabase();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: StreamBuilder<List<ProductModel>>(
        stream: dataBase.newProductStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final product = snapshot.data;
            if (product == null || product.isEmpty) {
              return const Center(
                child: Text('No Data Available!'),
              );
            }
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 3.h),
              itemCount: product.length,
              itemBuilder: (_, i) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: ProductItem(productModel: product[i]),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
