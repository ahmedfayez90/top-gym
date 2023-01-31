import 'dart:developer';
import 'package:top_gym/core/config/routes/app.dart';
part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(UploadInitial());

  static UploadCubit get(context) => BlocProvider.of(context);

  void saveProduct(ProductModel product) {
    emit(LoadingUploadProduct());

    addProductToFireStore(product).then((value) {
      emit(SuccessUploadProduct());
    }).catchError((e) {
      emit(ErrorUploadProduct());
    });
  }

  File? file;
  String? imageName;
  final imageHelper = ImageHelper();
  String? linkImage;
  final _cloudStorage = FirebaseStorage.instance;

  tackImage() async {
    var imgPicker = await imageHelper.pickImageFromCamera();
    if (imgPicker != null) {
      file = File(imgPicker.path);
      imageName = basename(imgPicker.path);
      emit(LoadingUploadImage());
      try {
        Reference refStorage =
            _cloudStorage.ref("${ApiPath.productsImage}/$imageName");
        await refStorage.putFile(file!);
        linkImage = await refStorage.getDownloadURL();
        emit(SuccessUploadImage());
      } catch (e) {
        emit(ErrorUploadImage());
      }
    } else {
      log("Please Choose image");
    }
  }
}
