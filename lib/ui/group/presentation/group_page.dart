import '../../../utils/tools/file_importer.dart';

class GroupPage extends StatefulWidget {
  GroupModel group;
  GroupPage({required this.group, super.key});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  void initState() {
    context
        .read<GroupBloc>()
        .add(GetGroupsStudentsEvent(widget.group.students));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: height(context) * 0.25,
            centerTitle: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.group.groupName, textAlign: TextAlign.start),
              background: Image.asset(
                AppImages.najottalim3,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return Padding(
                  padding: EdgeInsets.all(20.h),
                  child: Column(
                    children: [
                      SizedBox(height: 6.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width(context) * 0.45,
                            child: TextButton(
                                onPressed: () {
                                  if (context
                                          .read<GroupBloc>()
                                          .state
                                          .groupsStudentsStatus ==
                                      ResponseStatus.inSuccess) {
                                    Navigator.pushNamed(
                                        context, RouteName.lessons,
                                        arguments: LessonInputDataModel(
                                            group: widget.group,
                                            isAddScore: false));
                                  }
                                },
                                child: Text("show_scores".tr)),
                          ),
                          SizedBox(
                            width: width(context) * 0.45,
                            child: TextButton(
                                onPressed: () {
                                  if (context
                                          .read<GroupBloc>()
                                          .state
                                          .groupsStudentsStatus ==
                                      ResponseStatus.inSuccess) {
                                    Navigator.pushNamed(
                                        context, RouteName.lessons,
                                        arguments: LessonInputDataModel(
                                            group: widget.group,
                                            isAddScore: true));
                                  }
                                },
                                child: Text("add_score".tr)),
                          ),
                        ],
                      ),
                      Divider(
                          color: AdaptiveTheme.of(context).theme.focusColor),
                      Text("list_of_students".tr,
                          style: AppTextStyles.labelLarge(context)),
                      SizedBox(height: 16.h),
                      BlocBuilder<GroupBloc, GroupState>(
                        builder: (context, state) {
                          if (state.groupsStudentsStatus ==
                              ResponseStatus.inSuccess) {
                            return SizedBox(
                              height: height(context) * 0.7,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) => StudentItem(
                                    student: state.groupsStudents[index]),
                                itemCount: state.groupsStudents.length,
                              ),
                            );
                          }
                          return CircularProgressIndicator(
                              color: AdaptiveTheme.of(context).theme.cardColor);
                        },
                      )
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
