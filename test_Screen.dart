import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udemy_flutter/shared/components/components.dart';

class TestError extends StatefulWidget {

  @override
  State<TestError> createState() => _TestErrorState();
}

class _TestErrorState extends State<TestError> {
  var testController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Error',),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            defultFormField(
              controller: testController,
              type: TextInputType.datetime,
              onTap: ()
              {
                showDatePicker(context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.parse('2022-08-30'),
                ).then((value)
                {
                  testController.text = DateFormat.yMMMMd().format(value!);
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
              label: 'Test',
              prefix: Icons.calendar_today,
            ),
          ],
        ),
      ),
    );
  }

//  Error Handlling:
// 1. try/catch
// 2. then/catchError
void onPressed()
//   async {
// try{
//   var name = await getName();
//   print(name);
//   print('Hassan');
//
//   throw('some Error !!!');
// } catch (error){
//   print('error is ${error.toString()}');
// }
// }
{
 getName().then((value)
{
    print(value);
    print('Hassan');
    throw('some Error !!!');
  }).catchError((error) {
    print('error is $error');
  });
}
Future<String> getName() async
{
  return 'Naira';
}
}
