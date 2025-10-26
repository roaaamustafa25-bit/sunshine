import 'package:flutter/material.dart';

class CompletedPage extends StatefulWidget {
  const CompletedPage({Key? key}) : super(key: key);

  @override
  State<CompletedPage> createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage> {
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
    );
  }
}
