import 'package:najottalim_teachersapp/ui/main/presentation/widgets/group_item.dart';
import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
      body: BlocBuilder<TeacherBloc, TeacherState>(
        builder: (context, state) {
          if (state.status == ResponseStatus.inSuccess) {
            return SizedBox(
              height: height(context),
              width: width(context),
              child: Stack(
                children: [
                  Positioned(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: height(context) * 0.27,
                        width: width(context),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppImages.najottalim3),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(height: height(context) * 0.18),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text("groups".tr,
                            style: AppTextStyles.labelLarge(context)),
                      ),
                      SizedBox(height: 12.h),
                      SizedBox(
                        height: height(context) * 0.18,
                        width: width(context),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.groups.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                GroupItem(group: state.groups[index])),
                      )
                    ],
                  )),
                  Positioned(
                      top: height(context) * 0.23,
                      child: Container(
                        width: width(context) * 0.9,
                        margin: EdgeInsets.symmetric(horizontal: 22.h),
                        padding: EdgeInsets.all(20.h),
                        decoration: BoxDecoration(
                            color: AdaptiveTheme.of(context).theme.canvasColor,
                            borderRadius: BorderRadius.circular(10.h)),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${state.teacher!.name} ${state.teacher!.surname}",
                                  style: AppTextStyles.labelLarge(context),
                                ),
                                SizedBox(height: 10.h),
                                const Divider(color: Colors.white),
                                SizedBox(height: 10.h),
                                Text(
                                  "Guruh nomi: ",
                                  style: AppTextStyles.labelLarge(context),
                                ),
                                SizedBox(height: 10.h),
                                const Divider(color: Colors.white),
                                SizedBox(height: 10.h),
                                Text(
                                  '',
                                  style: AppTextStyles.labelLarge(context),
                                ),
                              ],
                            ),
                            Positioned(
                                top: -60,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 40.h,
                                  backgroundImage:
                                      const AssetImage(AppImages.najottalim2),
                                ))
                          ],
                        ),
                      ))
                ],
              ),
            );
          } else if (state.status == ResponseStatus.pure) {
            context.read<TeacherBloc>().add(GetTeacherEvent());
          }
          return Container();
        },
      ),
    );
  }
}
