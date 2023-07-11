import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:planner_app/ui/groups/groups_widget_model.dart';

class GroupsWidget extends StatefulWidget {
  const GroupsWidget({super.key});

  @override
  State<GroupsWidget> createState() => _GroupsWidgetState();
}

class _GroupsWidgetState extends State<GroupsWidget> {
  final _model = GroupsWidgetModel();

  @override
  Widget build(BuildContext context) {
    return GroupsWidgetModelProvider(
      model: _model,
      child: const _GroupsWidgetBody(),
    );
  }

  @override
  void dispose() async {
    await _model.dispose();
    super.dispose();
  }
}

class _GroupsWidgetBody extends StatelessWidget {
  const _GroupsWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const _GroupsListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            GroupsWidgetModelProvider.read(context)?.model.showForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _GroupsListWidget extends StatelessWidget {
  const _GroupsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final groupsCount =
        GroupsWidgetModelProvider.watch(context)?.model.groups.length ?? 0;
    return ListView.separated(
      itemCount: groupsCount,
      itemBuilder: (BuildContext context, int index) {
        return _GroupsListRowWidget(
          indexInList: index,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container();
        //const Divider(height: 1);
      },
    );
  }
}

class _GroupsListRowWidget extends StatelessWidget {
  final Function(BuildContext)? deleteTapped;
  final int indexInList;
  const _GroupsListRowWidget({
    super.key,
    required this.indexInList,
    this.deleteTapped,
  });

  @override
  Widget build(BuildContext context) {
    final model = GroupsWidgetModelProvider.read(context)!.model;
    final group = model.groups[indexInList];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) =>
                  model.deleteGroup(indexInList),
              //onPressed: deleteTapped,
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) {},
              backgroundColor: const Color(0xFF0392CF),
              foregroundColor: Colors.white,
              icon: Icons.save,
              label: 'Save',
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Card(
          child: ListTile(
            leading: const FlutterLogo(),
            title: Text(group.name),
            onTap: () => model.showTasks(context, indexInList),
          ),
        ),
      ),
    );
  }
}
