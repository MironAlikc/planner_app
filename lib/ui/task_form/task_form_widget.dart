import 'package:flutter/material.dart';
import 'package:planner_app/ui/task_form/task_form_widget_model.dart';

class TaskFormWidget extends StatefulWidget {
  final int groupKey;
  const TaskFormWidget({
    super.key,
    required this.groupKey,
  });

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  late final TasksFormWidgetModel _model;

  @override
  void initState() {
    super.initState();
    _model = TasksFormWidgetModel(groupKey: widget.groupKey);
  }

  @override
  Widget build(BuildContext context) {
    return TaskFormWidgetModelProvider(
      model: _model,
      child: const _TextFormWidgetBody(),
    );
  }
}

class _TextFormWidgetBody extends StatelessWidget {
  const _TextFormWidgetBody({super.key});
  @override
  Widget build(BuildContext context) {
    final model = TaskFormWidgetModelProvider.watch(context)?.model;
    final actionButton = FloatingActionButton(
        onPressed: () => model?.saveTask(context),
        child: const Icon(Icons.done));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новая Задача'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: _TaskTextWidget(),
        ),
      ),
      floatingActionButton: model?.isValid == true ? actionButton : null,
    );
  }
}

class _TaskTextWidget extends StatelessWidget {
  const _TaskTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = TaskFormWidgetModelProvider.read(context)?.model;
    return TextField(
      autofocus: true, // Автоматически заходит в текст
      maxLines: null,
      minLines: null,
      expands: true, // на весь экран
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Текст задачи',
      ),
      onChanged: (value) => model?.taskText = value,
      onEditingComplete: () => model?.saveTask(context),
    );
  }
}
