import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:planner_app/ui/resources/colors.dart';

class GroupsWidget extends StatelessWidget {
  const GroupsWidget({super.key});
  void showFrom(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/form');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const _GroupsListWidget(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp.mainColor,
        onPressed: () => showFrom(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _GroupsListWidget extends StatelessWidget {
  const _GroupsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return _GroupsListRowWidget(
          indexInList: index,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return const SizedBox();
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              onPressed: deleteTapped,
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTapped,
              backgroundColor: Color(0xFF0392CF),
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
            title: const Text('One-line with leading widget'),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
