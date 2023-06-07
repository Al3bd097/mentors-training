import 'package:flutter/material.dart';
import 'package:mentor/models/Students.dart';
import 'package:mentor/pages/StudentDetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _searchQuery = '';

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mentor"),
          backgroundColor: Color(0xff09051A),
        ),
        body: Column(
          children: [
            SearchBar(updateSearchQuery: _updateSearchQuery),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: Students.student.length,
                  itemBuilder: ((context, index) {
                    final student = Students.student[index];

                    if (!_searchQuery.isEmpty &&
                        !student.name
                            .toLowerCase()
                            .contains(_searchQuery.toLowerCase())) {
                      return SizedBox.shrink();
                    }

                    return Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) {
                                return StudentDetails(
                                  studentt: student,
                                );
                              }),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    student.name,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.all(10),
                            ),
                          ],
                        ),
                      ),
                      height: 170,
                      margin: EdgeInsets.only(
                        top: 30,
                        bottom: 20,
                        right: 20,
                        left: 20,
                      ),
                      padding: EdgeInsets.only(bottom: 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff4E32DD),
                            spreadRadius: 1.8,
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                color: Color(0xff09051A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final ValueChanged<String> updateSearchQuery;

  const SearchBar({required this.updateSearchQuery});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onChanged: updateSearchQuery,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xff4E32DD),
          labelText: 'Search',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
