import '../../../../../../../core/config/routes/app.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;
  final bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.sp),
              child: Container(
                color: AppColor.grayColor,
                child: Image.network(
                  productModel.imgUrl,
                  fit: BoxFit.contain,
                  height: 24.h,
                  width: 40.w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3.w),
              child: SizedBox(
                width: 10.w,
                height: 3.h,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: AppColor.redColor,
                  ),
                  child: Center(
                    child: Text(
                      '${productModel.discountValue}%',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: AppColor.wColor),
                    ),
                  ),
                ),
              ),
            ),
            // TODO : Create one component for the favorate button
            Positioned(
              bottom: -2.h,
              right: 0,
              child: FloatingActionButton(
                onPressed: () {
                  // setState(() {
                  //   isFavorite = !isFavorite;
                  // });
                },
                mini: true,
                backgroundColor: AppColor.wColor,
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: AppColor.grayColor,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.h),
              DetailsTextProduct(
                  details: productModel.name, detailsName: "Name: "),
              DetailsTextProduct(
                  details: productModel.category, detailsName: "Category: "),
              SizedBox(height: 0.5.h),
              SizedBox(
                width: 50.w,
                child: DetailsTextProduct(
                    details: productModel.detailsItem,
                    detailsName: "Details ${productModel.name}: "),
              ),
              SizedBox(height: 0.5.h),
              DetailsTextProduct(
                  details: '${productModel.price}\$', detailsName: "Price: "),
            ],
          ),
        ),
      ],
    );
  }
}
