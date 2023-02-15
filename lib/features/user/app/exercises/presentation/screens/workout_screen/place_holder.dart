import '../../../../../../../core/config/routes/app.dart';

class PlaceHolderView extends StatelessWidget {
  const PlaceHolderView({Key? key, required this.index}) : super(key: key);
  final int index;
  final List<Widget> workOutViews = const [
    BuildMuscle(),
    LargeArms(),
    PowerfulChest(),
    WideBack(),
    BigShoulders(),
    StrongLegs(),
    WeightLoss(),
    SculptedBody(),
    SixPackABS(),
    PowerLifting(),
    Crossfit(),
    FullBodyIn45Minutes(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.wColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Where to train',
          style: Theme.of(context).textTheme.button!.copyWith(fontSize: 15.sp),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: AppColor.bColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          child: workOutViews[index]),
    );
  }
}
