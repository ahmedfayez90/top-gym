import '../../../../../../../core/config/routes/app.dart';

class DetailsTextProduct extends StatelessWidget {
  const DetailsTextProduct({
    Key? key,
    required this.details,
    required this.detailsName,
  }) : super(key: key);
  final String detailsName;
  final String details;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detailsName,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontWeight: FontWeight.w400, fontSize: 15.sp),
          ),
          Flexible(
            child: Text(
              details,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
