import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';

class MyTablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Demo'),
      ),
      body: BlocBuilder<GroupBloc, GroupState>(
        builder: (context, state) {
          return Center(
            child: DataTable(columns: [
              // DataColumn(label: Text('Name')),
              // ...List.generate(
              //     state.groupsStudents.first.balls.length,
              //     (index) => DataColumn(
              //         label:
              //             Text(state.groupsStudents[index].balls[1].ball))),
              // DataColumn(label: Text('Name')),
              // DataColumn(label: Text('Age')),
              // DataColumn(label: Text('Location')),
            ], rows: [
              // DataRow(cells: [
              //   DataCell(Text('John')),
              //   DataCell(Text('25')),
              //   DataCell(Text('New York')),
              // ]),
              // DataRow(cells: [
              //   DataCell(Text('Jane')),
              //   DataCell(Text('30')),
              //   DataCell(Text('London')),
              // ]),
              // DataRow(cells: [
              //   DataCell(Text('Alice')),
              //   DataCell(Text('28')),
              //   DataCell(Text('Paris')),
            ]),
            // ],
            // ),
          );
        },
      ),
    );
  }
}
