import 'package:flutter/material.dart';
import 'package:my_app/models/task.dart';


class EditorPage extends StatefulWidget {
  final Task editedTask;
  const EditorPage({Key? key, required this.editedTask}) : super(key: key);

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  TextEditingController taskDesc = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController category = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.editedTask.taskDesc != null) {
      taskDesc.text = widget.editedTask.taskDesc!;
      startDate.text = widget.editedTask.startDate!;
      endDate.text = widget.editedTask.endDate!;
      category.text = widget.editedTask.category!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff8F8C8C),
        title: const Text("Edit Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              "Task Description",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                hintText: "Enter task description",
              ),
              controller: taskDesc,
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            const Text(
              "Start Date",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                hintText: "Enter start date",
              ),
              controller: startDate,
            ),
            const SizedBox(height: 20),
            const Text(
              "End Date",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                hintText: "Enter end date",
              ),
              controller: endDate,
            ),
            const SizedBox(height: 20),
            const Text(
              "Category",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                hintText: "Enter category",
              ),
              controller: category,
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Task returnedTask = Task(
                    taskDesc: taskDesc.text,
                    startDate: startDate.text,
                    endDate: endDate.text,
                    category: category.text);
                Navigator.pop(context, returnedTask);
              },
              child: Container(
                alignment: Alignment.center,
                width: 120,
                height: 45,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: const Color(0xff5F33E1),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
