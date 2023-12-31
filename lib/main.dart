import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  List list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (String? value) {
              //   if (value?.trim().isEmpty ?? true) {
              //     return 'Enter your password';
              //   }
              //   return null;
              // },
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (String? value) {
              //   if (value?.trim().isEmpty ?? true) {
              //     return 'Enter your password';
              //   }
              //   return null;
              // },
              controller: numberController,
              decoration: const InputDecoration(
                hintText: 'Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey
                ),
                onPressed: () {
                  list.add({
                    'name': nameController.text,
                    'number': numberController.text
                  });
                  // nameController.clear();
                  // numberController.clear();

                  setState(() {});
                },
                child: const Text('Add'),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onLongPress: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Confirmation'),
                              content: const Text('Are you sure for Delete?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }, child: const Icon(Icons.no_sim_outlined)),
                                TextButton(
                                    onPressed: () {
                                      list.remove(list[index]);
                                      Navigator.pop(context);
                                      setState(() {

                                      });
                                    }, child: const Icon(Icons.delete_outline)),
                              ],
                            );
                          });
                    },
                    child: ListTile(
                      leading: const Icon(Icons.person, color: Colors.brown, size: 35,),
                      trailing: const Icon(Icons.call, color: Colors.blue,),
                      title: Text(list[index]['name'], style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.redAccent),),
                      subtitle: Text(list[index]['number'],style: const TextStyle(fontWeight: FontWeight.w400),),
                      tileColor: Colors.grey.shade200,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 8,
                    thickness: 2,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
