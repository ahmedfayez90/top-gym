import 'package:top_gym/features/admin/app/uploaded/logic/upload_product/upload_cubit.dart';
import '../../../../../../core/config/routes/app.dart';

class SaveProductButton extends StatelessWidget {
  const SaveProductButton({Key? key, required this.productKey})
      : super(key: key);
  final GlobalKey<FormState> productKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadCubit, UploadState>(
      listener: (context, state) {
        UploadCubit cubit = UploadCubit.get(context);
        if (state is ErrorUploadProduct) {
          flutterToast(msg: "Error", color: AppColor.primaryColor);
        } else if (state is SuccessUploadProduct) {
          flutterToast(msg: "Success uploaded", color: AppColor.primaryColor);

        }
      },
      builder: (context, state) {
        UploadCubit cubit = UploadCubit.get(context);
        return Column(
          children: [
            if (state is LoadingUploadProduct)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (state is! LoadingUploadProduct)
              MainButton(
                borderRadius: 50,
                onPressed: () async {
                  ProductModel product = ProductModel(
                    imgUrl: cubit.linkImage ?? '',
                    name: UploadProductController.nameC.text,
                    detailsItem: UploadProductController.detailsC.text,
                    price: UploadProductController.priceC.text,
                    category: UploadProductController.category.text,
                    discountValue: UploadProductController.discountValue.text,
                  );
                  if (productKey.currentState!.validate()) {
                    QuickAlert.show(
                      confirmBtnText: AppStrings.ok,
                      cancelBtnText: AppStrings.cancel,
                      onConfirmBtnTap: () {
                        cubit.saveProduct(product);
                        UploadProductController.imgC.clear();
                        UploadProductController.priceC.clear();
                        UploadProductController.detailsC.clear();
                        UploadProductController.nameC.clear();
                        UploadProductController.category.clear();
                        UploadProductController.discountValue.clear();
                        cubit.linkImage ='';
                        Navigator.pop(context);
                      },
                      context: context,
                      type: QuickAlertType.success,
                      text: AppStrings.transactionCompete,
                    );

                  }
                },
                text: AppStringsOfUploadedAdmin.save,
              ),
          ],
        );
      },
    );
  }
}
