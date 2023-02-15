import '../../../../../../../core/config/routes/app.dart';

class FieldUserDetails extends StatelessWidget {
  FieldUserDetails({Key? key}) : super(key: key);

  String? phone;
  String? name;
  String? imageUrl;
  String? email;
  String? age;
  String? country;
  String? zipCode;
  String? height;
  String? weight;
  String? male;
  String? feMale;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileUserCubit, ProfileUserState>(
      listener: (context, state) {
        if (state is UpdateDateSuccess) {
          flutterToast(
              toastLength: Toast.LENGTH_LONG,
              msg: "Success Edit",
              color: AppColor.primaryColor);
        } else if (state is UpdateDateError) {
          flutterToast(
              toastLength: Toast.LENGTH_LONG,
              msg: "Error Edit",
              color: AppColor.primaryColor);
        }
      },
      builder: (context, state) {
        final userData = ProfileUserCubit.get(context).userData;
        ProfileUserCubit cubit = ProfileUserCubit.get(context);
        return Expanded(
          child: ListView(
            children: [
              TextFormModifyProfile(
                title: 'Name',
                initialValue: userData != null ? userData.name : 'Loading...',
                onChanged: (nameValue) {
                  name = nameValue;
                },
                onEditingComplete: () {
                  cubit.updateDate(
                    key: UserDetails.name,
                    value: name!,
                  );
                },
              ),
              TextFormModifyProfile(
                title: 'E-mail',
                initialValue: userData != null ? userData.email : 'Loading...',
                onChanged: (emailValue) {
                  email = emailValue;
                },
                onEditingComplete: () {
                  cubit.updateDate(
                    key: UserDetails.email,
                    value: email!,
                  );
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormModifyProfile(
                      title: 'age',
                      initialValue:
                          userData != null ? userData.age : 'Loading...',
                      onChanged: (ageValue) {
                        age = ageValue;
                      },
                      onEditingComplete: () {
                        cubit.updateDate(key: UserDetails.age, value: age!);
                      },
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: TextFormModifyProfile(
                      title: 'country',
                      initialValue:
                          userData != null ? userData.country : 'Loading...',
                      onChanged: (countryValue) {
                        country = countryValue;
                      },
                      onEditingComplete: () {
                        cubit.updateDate(
                          key: UserDetails.country,
                          value: country!,
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormModifyProfile(
                      title: 'height',
                      initialValue:
                          userData != null ? userData.height : 'Loading...',
                      onChanged: (heightValue) {
                        height = heightValue;
                      },
                      onEditingComplete: () {
                        cubit.updateDate(
                          key: UserDetails.height,
                          value: height!,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: TextFormModifyProfile(
                      title: 'weight',
                      initialValue:
                          userData != null ? userData.weight : 'Loading...',
                      onChanged: (weightValue) {
                        weight = weightValue;
                      },
                      onEditingComplete: () {
                        cubit.updateDate(
                          key: UserDetails.weight,
                          value: weight!,
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormModifyProfile(
                      title: 'zip Code',
                      initialValue:
                          userData != null ? userData.zipCode : 'Loading...',
                      onChanged: (zipCodeValue) {
                        zipCode = zipCodeValue;
                      },
                      onEditingComplete: () {
                        cubit.updateDate(
                          key: UserDetails.zipCode,
                          value: zipCode!,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: TextFormModifyProfile(
                      title: 'Gender',
                      initialValue: userData != null
                          ? userData.male == true
                              ? 'Male'
                              : 'Female'
                          : 'Loading...',
                      onChanged: (maleValue) {
                        male = maleValue;
                      },
                      onEditingComplete: () {
                        cubit.updateDate(
                          key: UserDetails.male,
                          value: male!,
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormModifyProfile(
                      title: 'Phone Number',
                      onChanged: (value) {
                        phone = value;
                      },
                      onEditingComplete: () {
                        cubit.updateDate(
                          key: UserDetails.phoneNumber,
                          value: phone!,
                        );
                      },
                      initialValue: userData != null
                          ? userData.phoneNumber
                          : 'Loading...',
                    ),
                  ),
                  SizedBox(width: 2.w),
                  const Spacer(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
