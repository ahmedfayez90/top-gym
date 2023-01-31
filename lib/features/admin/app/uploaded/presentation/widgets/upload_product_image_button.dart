import 'package:top_gym/features/admin/app/uploaded/logic/upload_product/upload_cubit.dart';
import '../../../../../../core/config/routes/app.dart';

class UploadProductImageButton extends StatelessWidget {
  const UploadProductImageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadCubit, UploadState>(
      listener: (context, state) {
        if (state is ErrorUploadImage) {
          flutterToast(msg: "Error", color: AppColor.primaryColor);
        } else if (state is SuccessUploadImage) {
          flutterToast(
              msg: "Success Upload Image", color: AppColor.primaryColor);
        }
      },
      builder: (context, state) {
        UploadCubit cubit = UploadCubit.get(context);
        return Column(
          children: [
            if (state is LoadingUploadImage)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (state is! LoadingUploadImage)
              InkWell(
                onTap: () {
                  cubit.tackImage();
                },
                child: SizedBox(
                  height: 20.h,
                  width: 90.w,
                  child: cubit.linkImage == ''
                      ? Image.asset(
                          AppImages.noImage,
                          fit: BoxFit.fill,
                        )
                      : ImageNetworkComponent(
                          image: cubit.linkImage,
                        ),
                ),
              ),
          ],
        );
      },
    );
  }
}
