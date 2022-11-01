import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_flutter/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:udemy_flutter/modules/done_tasks/done_tasks_screen.dart';
import 'package:udemy_flutter/modules/new_tasks/new_tasks_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';

class HomeLayout extends StatefulWidget {

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

// sqflite:
// 1. create database
// 2. create tables
// 3. open database
// 4. insert to DB
// 5. get from DB
// 6 update in DB
// 7. delete from DB

class _HomeLayoutState extends State<HomeLayout>
{
  //Lists:
  List<Widget> screens =
  [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles =
  [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  //Variables:
  int currentIndex = 0;
  IconData fabIcon = Icons.edit;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formdKey = GlobalKey<FormState>();
  bool isBottomSheetShown = false;
  late Database database;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  //Functions:
  void createDatabase() async
  {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version)
      {
        // id integer
        // title String
        // date String
        // time String
        // status String

        // try{
        //   print('database created');
        //   database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)');
        //     print('table created');
        // } catch (error){
        //     print('Error When Creating Table ${error.toString()}');
        // }
        print('database created');
        database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)').then((value){
          print('table created');
        }).catchError((error)
        {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        print('database opened');
      },
    );
  }

  Future insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async
  {
    return await database.transaction((txn) async
    {
      txn.rawInsert(
        'INSERT INTO tasks(title, date, time, status) VALUES("$title","$time","$date","new")',
      ).then((value)
      {
        print('$value iserted successfully');
      }).catchError((error)
      {
        print('Error When Inserting New Record ${error.toString()}');
      });
      return null;
    });
  }

  //initState Function:
  @override
  void initState(){
    super.initState();
    createDatabase();
  }

  //Build Widget:
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
        ),
      ),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(
          fabIcon,
        ),
        onPressed: ()
        {
          if(isBottomSheetShown)
          {
            if(formdKey.currentState!.validate())
            {
              insertToDatabase(
                title: titleController.text,
                time: timeController.text,
                date: dateController.text,
              ).then((value){
                Navigator.pop(context);
                isBottomSheetShown = false;
                setState(()
                {
                  fabIcon = Icons.edit;
                });
              });
            }
          } else {
            scaffoldKey.currentState!.showBottomSheet(
                  (context) => Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(20.0,),
                    child: Form(
                      key: formdKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          defultFormField(
                              controller: titleController,
                              type: TextInputType.text,
                              validate: (value)
                              {
                                if (value.isEmpty)
                                {
                                  return 'title is required';
                                }
                                return null;
                              },
                              label: 'Task Title',
                              prefix: Icons.title,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defultFormField(
                            controller: timeController,
                            type: TextInputType.datetime,
                            onTap: (){
                              showTimePicker(context: context,
                                  initialTime: TimeOfDay.now(),
                              ).then((value) {
                                timeController.text = value!.format(context).toString();
                              });
                            },
                            validate: (value)
                            {
                              if (value.isEmpty)
                              {
                                return 'time is required';
                              }
                              return null;
                            },
                            label: 'Task Time',
                            prefix: Icons.watch_later_outlined,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defultFormField(
                            controller: dateController,
                            type: TextInputType.datetime,
                            onTap: ()
                            {
                              showDatePicker(context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2022-08-30'),
                              ).then((value) 
                              {
                                dateController.text = DateFormat.yMMMMd().format(value!);
                              });
                            },
                            validate: (value)
                            {
                              if (value.isEmpty)
                              {
                                return 'date is required';
                              }
                              return null;
                            },
                            label: 'Task Date',
                            prefix: Icons.calendar_today,
                          ),
                        ],
                      ),
                    ),
              ),
              elevation: 20.0,
            );
            isBottomSheetShown = true;
            setState(()
            {
              fabIcon = Icons.add;
            });
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index)
        {
          setState((){
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
                Icons.menu,
              ),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_circle_outline,
            ),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.archive_outlined,
            ),
            label: 'Archived',
          ),
        ],
      ),
    );
  }
 }
