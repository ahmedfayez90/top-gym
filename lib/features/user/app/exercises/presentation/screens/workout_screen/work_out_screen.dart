import 'package:top_gym/features/user/app/exercises/presentation/screens/workout_screen/place_holder.dart';

import '../../../../../../../core/config/routes/app.dart';

class WorkOutScreen extends StatelessWidget {
  const WorkOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Column(
        children: [
          SizedBox(height: 3.h),
          Text(
            "Select Your Workout Plan",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Grouped, Men",
                style: Theme.of(context).textTheme.button,
              ),
              Icon(Icons.arrow_drop_down_sharp,
                  color: AppColor.subTitleTextColorInGoalScreen),
            ],
          ),
          SizedBox(height: 2.h),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 1.h),
              itemCount: 12,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlaceHolderView(
                          index: i,
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.sp),
                    child: Image.asset(
                      "$exPath/${i + 1}.jpg",
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 3.h)
        ],
      ),
    );
  }
}

//
//
// class WorkOutScreen extends StatelessWidget {
//   const WorkOutScreen({Key? key}) : super(key: key);
//
//   final List<Tab> _homeScreenTabs = const <Tab>[
//     Tab(text: 'Tab1', icon: Icon(Icons.camera)),
//     Tab(text: 'Tab2', icon: Icon(Icons.camera)),
//     Tab(text: 'Tab3', icon: Icon(Icons.camera)),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: _homeScreenTabs.length,
//       child: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             TabBar(
//               labelColor: Colors.blue,
//               tabs: _homeScreenTabs,
//             ),
//             Expanded(
//               child: TabBarView(
//                 children: _homeScreenTabs.map((Tab tab) {
//                   final String label = tab.text?.toLowerCase() ?? "";
//                   return Center(
//                     child: Text(
//                       'This is the home $label',
//                       style:
//                       const TextStyle(color: Colors.black87, fontSize: 18),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
