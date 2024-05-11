import 'package:flutter/material.dart';
import 'package:my_app/controllers/task.dart';
import 'package:my_app/pages/editor.dart';
import 'package:my_app/shared/shared.dart';

class CompletedTasks extends StatefulWidget {
  const CompletedTasks({super.key});

  @override
  State<CompletedTasks> createState() => _vlTasksTasksState();
}

class _vlTasksTasksState extends State<CompletedTasks> {
  TaskController taskController3 = TaskController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Completed tasks",
          style: TextStyle(color: Color.fromARGB(255, 43, 18, 108)),
        ),
        backgroundColor: const Color(0xff8F8C8C).withOpacity(0.1),
        toolbarHeight: 50,
      ),
      body: ListView.builder(
        /* shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(), */
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
              child: vlTasks[index].favorite
                  ? Container(
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
                                        padding: const EdgeInsets.only(top: 13),
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
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    ));
        },
      ),
    );
  }
}
