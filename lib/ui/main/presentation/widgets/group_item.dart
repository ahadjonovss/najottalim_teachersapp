import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';

class GroupItem extends StatelessWidget {
  GroupModel group;
  GroupItem({required this.group, super.key});

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: () {
        Navigator.pushNamed(context, RouteName.group, arguments: group);
      },
      child: BlocBuilder<TeacherBloc, TeacherState>(
        builder: (context, state) {
          if (state.groupsStatus == ResponseStatus.inSuccess) {
            return Container(
              margin: EdgeInsets.only(left: 12.h),
              height: height(context) * 0.18,
              width: width(context) * 0.33,
              padding: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                  color: AdaptiveTheme.of(context).theme.indicatorColor,
                  borderRadius: BorderRadius.circular(10.h)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage(AppImages.najottalim3),
                    radius: 28.h,
                  ),
                  Column(
                    children: [
                      Text(group.groupName,
                          style: AppTextStyles.labelLarge(context)),
                      Text(group.room, style: AppTextStyles.labelLarge(context))
                    ],
                  )
                ],
              ),
            );
          } else {
            return CustomShimmer(
              child: Container(
                margin: EdgeInsets.only(left: 12.h),
                height: height(context) * 0.18,
                width: width(context) * 0.33,
                padding: EdgeInsets.all(12.h),
                decoration: BoxDecoration(
                    color: AdaptiveTheme.of(context).theme.indicatorColor,
                    borderRadius: BorderRadius.circular(10.h)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundImage: const AssetImage(AppImages.najottalim3),
                      radius: 28.h,
                    ),
                    Column(
                      children: [
                        Text(group.groupName,
                            style: AppTextStyles.labelLarge(context)),
                        Text(group.room,
                            style: AppTextStyles.labelLarge(context))
                      ],
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
