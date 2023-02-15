import '../../../../../../../core/config/routes/app.dart';

class ListTileItem extends StatelessWidget {
   ListTileItem({
    Key? key,
    required this.icon,
    this.switchValue = false,
    required this.title,
    this.onChanged,
    this.onTap,
    this.isCheck = false,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final bool switchValue;
  final void Function(bool)? onChanged;
   void Function()? onTap;

  final bool isCheck;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),
          color: AppColor.profileBackgroundColor,
        ),
        child: Row(
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  icon,
                  size: 22.sp,
                  color: AppColor.wColor,
                ),
              ),
            ),
            SizedBox(width: 5.w),
            Text(
              title,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            const Spacer(),
            isCheck == true
                ? Switch(
              activeColor: Theme
                  .of(context)
                  .primaryColor,
              inactiveTrackColor: AppColor.bColor,
              value: switchValue,
              onChanged: onChanged,
            )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
