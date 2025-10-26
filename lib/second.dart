import 'dart:html';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool? _ischecked = false;
  List<Map<String, dynamic>> tasks = [
    {"title": "Design New UI For Dashboard", "done": false},
    {"title": "Design New UI For Dashboard", "done": false},
    {"title": "Design New UI For Dashboard", "done": true},
    {"title": "Design New UI For Dashboard", "done": false},
    {"title": "Design New UI For Dashboard", "done": true},
    {"title": "Design New UI For Dashboard", "done": false},
    {"title": "Design New UI For Dashboard", "done": true},
    {"title": "Design New UI For Dashboard", "done": true},
    {"title": "Design New UI For Dashboard", "done": true},
    {"title": "Design New UI For Dashboard", "done": true},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xff007AFF),
          unselectedItemColor: Color(0xff49454F),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline),
              label: 'Completed',
            ),
          ]),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              ' Good Morning, Ali',
              style: TextStyle(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "   Monday, July 14",
              style: TextStyle(
                  color: Color(0xff999999),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Day Progress',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    minHeight: 8,
                    value: tasks.where((t) => t['done']).length / tasks.length,
                    color: Color(0xff2B7FFF),
                    backgroundColor: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '6/10 Tasks Completed',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff90A1B9)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    color: Colors.white,
                    height: 558,
                    width: 358,
                    child: Stack(
                      children: [
                        Positioned(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 50,
                                        offset: Offset(0, 5),
                                      )
                                    ]),
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  right: 255,
                                  top: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tasks',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ))),
                        ListView.builder(
                            padding: EdgeInsets.only(top: 40),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: tasks.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                activeColor: Color(0xff2B7FFF),
                                checkColor: Colors.white,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(
                                  tasks[index]["title"],
                                  style: TextStyle(
                                    decoration: tasks[index]["done"]
                                        ? TextDecoration.lineThrough
                                        : null,
                                    color: tasks[index]['done']
                                        ? Color(0xff646262)
                                        : Color(0xdd232323),
                                  ),
                                ),
                                value: tasks[index]["done"],
                                onChanged: (val) {
                                  setState(() {
                                    tasks[index]["done"] = val!;
                                  });
                                },
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff2B7FFF),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTaskSheet()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class AddTaskSheet extends StatefulWidget {
  const AddTaskSheet({super.key});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  String priority = "Low";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Add Task",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "What do you want to do?",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Date",
                    suffixIcon: const Icon(Icons.calendar_today),
                    border: const OutlineInputBorder(),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 10),
                const Text("Priority"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildPriorityButton("Low", Colors.green),
                    buildPriorityButton("Medium", Colors.orange),
                    buildPriorityButton("High", Colors.red),
                  ],
                ),
                const SizedBox(height: 10),
                const Text("Tags"),
                Row(
                  children: [
                    buildTag(
                      "Work",
                      Colors.green,
                    ),
                    SizedBox(width: 30),
                    buildTag("Personal", Colors.blue),
                    SizedBox(width: 30),
                    buildTag("+ Add Tag", Colors.grey),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0585ed),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Add Task",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildPriorityButton(String text, Color color) {
    final bool isSelected = priority == text;
    return GestureDetector(
      onTap: () => setState(() => priority = text),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.3) : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text),
      ),
    );
  }

  Widget buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text),
    );
  }
}
