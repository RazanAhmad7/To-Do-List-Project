import 'package:flutter/material.dart';
import 'package:my_app/controllers/task.dart';
import 'package:my_app/models/task.dart';
import 'package:my_app/pages/completed.dart';
import 'package:my_app/pages/editor.dart';
import 'package:my_app/pages/inProgress.dart';
import 'package:my_app/shared/shared.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  IconData favIcon = Icons.check_circle_outline;

  TaskController taskController = TaskController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff8F8C8C).withOpacity(0.1),
          toolbarHeight: 50,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    EditorPage(editedTask: Task()),
              ),
            ).then((value) {
              if (value != null) {
                setState(() {
                  vlTasks.add(value);
                });
              }
            });
          },
          child: const Icon(Icons.add),
        ),
        body: vlTasks.isEmpty
            ? Center(
                child: Image.asset(
                  "assets/images/planning.png",
                  height: 220,
                ),
              )
            : ListView(children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 110,
                      height: 53,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Color.fromARGB(255, 149, 121, 232),
                      ),
                      child: const Text(
                        'All tasks',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const InProgress(),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        height: 53,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: const Color(0xff5F33E1),
                        ),
                        child: const Text(
                          'In progress',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const CompletedTasks(),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        height: 53,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: const Color(0xff5F33E1),
                        ),
                        child: const Text(
                          'Completed',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  itemCount: vlTasks.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => EditorPage(
                              editedTask: vlTasks[index],
                            ),
                          ),
                        ).then((value) {
                          if (value != null) {
                            setState(() {
                              vlTasks[index] = value;
                            });
                          }
                        });
                      },
                      child: Container(
                        height: 170,
                        width: 122,
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: index % 2 == 0
                                  ? vlTasks[index].taskColor =
                                      const Color.fromARGB(255, 129, 113, 169)
                                  : const Color.fromARGB(255, 192, 175, 220)),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(37.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff5F33E1).withOpacity(0.5),
                              blurRadius: 3.0,
                              offset: const Offset(0.0, 8.0),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                vlTasks[index].taskDesc!,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: vlTasks[index].taskDescDecoration,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(top: 9),
                                          child: Icon(
                                            Icons.date_range_outlined,
                                            color: Color(0xff565252),
                                            size: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13),
                                          child: Text(
                                            vlTasks[index].endDate!,
                                            style: const TextStyle(
                                              color: Color(0xff565252),
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      icon: Icon(
                                        vlTasks[index].favorite
                                            ? Icons.check_circle
                                            : Icons.check_circle_outline,
                                        color: const Color(0xff5F33E1),
                                        size: 40,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          vlTasks[index].favorite =
                                              !vlTasks[index].favorite;
                                          if (vlTasks[index].favorite) {
                                            Completed.add(vlTasks[index]);
                                            vlTasks[index].taskDescDecoration =
                                                TextDecoration.lineThrough;
                                          } else {
                                            vlTasks[index].taskDescDecoration =
                                                TextDecoration.none;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ]));
  }
}
