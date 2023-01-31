import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/config/theme/app_color.dart';
import '../../../../../../core/remote_database/firebase_firestore.dart';
import '../../../../../../core/utils/app_images.dart';
import '../model/client_model.dart';
import '../widgets/details_item.dart';
import '../widgets/title_widget.dart';

class Inavtive extends StatefulWidget {
  const Inavtive({super.key});

  @override
  State<Inavtive> createState() => _InavtiveState();
}

class _InavtiveState extends State<Inavtive> {
  var startData = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bgImageApp),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 6.h),
            const TitleWidget(),
            CalendarTimeline(
              initialDate: startData,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              onDateSelected: (date) {
                // print(date);
                setState(() {});
                startData = date;
              },
              leftMargin: 20,shrink: true,
              monthColor: AppColor.primaryColor,
              dayColor: AppColor.primaryColor,
              activeDayColor: AppColor.wColor,
              activeBackgroundDayColor: AppColor.yColor,
              dotsColor: AppColor.wColor,
              selectableDayPredicate: (date) => true,
              locale: 'en_ISO',
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<ClientModel>>(
                stream: getClientFromFireStoreUsingStream(startData),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Something Went Wrong'),
                    );
                  }
                  List<ClientModel> clients =
                      snapshot.data!.docs.map((e) => e.data()).toList();
                  return ListView.builder(
                    itemCount: clients.length,
                    itemBuilder: (context, index) {
                      return DetailsItem(client: clients[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
