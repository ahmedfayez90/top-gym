import '../../../../../../core/config/routes/app.dart';

class BodyUploadView extends StatelessWidget {
  const BodyUploadView({
    Key? key,
    required this.validationName,
    required this.validationDetails,
    required this.validationPrice,
  }) : super(key: key);

  final String? Function(String?) validationName;
  final String? Function(String?) validationDetails;
  final String? Function(String?) validationPrice;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Text(
            "Hey, Ahmed & Karem",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 5.h),
          TextFormFieldWidget(
            controller: UploadProductController.nameC,
            text: "Name",
            validator: validationName,
            onChanged: (val) {},
          ),
          TextFormFieldWidget(
              controller: UploadProductController.detailsC,
              maxLines: 5,
              text: "Details Item",
              validator: validationDetails,
              onChanged: (val) {}),
          TextFormFieldWidget(
              controller: UploadProductController.priceC,
              keyboardType: TextInputType.phone,
              text: "Price",
              validator: validationPrice,
              onChanged: (val) {}),
          TextFormFieldWidget(
              controller: UploadProductController.discountValue,
              keyboardType: TextInputType.phone,
              text: "DiscountValue",
              validator: validationPrice,
              onChanged: (val) {}),
          TextFormFieldWidget(
              controller: UploadProductController.category,

              text: "Category",
              validator: validationPrice,
              onChanged: (val) {}),
          SizedBox(height: 5.h),
        ],
      ),
    );
  }
}
