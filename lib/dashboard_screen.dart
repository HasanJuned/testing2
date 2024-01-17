import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  List list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tech Store'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              keyboardType: TextInputType.emailAddress,
              validator: (String? text) {
                if (text!.isEmpty) {
                  return 'Enter your Product title';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: 'Title', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.emailAddress,
              validator: (String? text) {
                if (text!.isEmpty) {
                  return 'Enter your product price';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: 'Price', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    list.add(
                      {
                        'title': _titleController.text,

                        /// asus
                        'price': _priceController.text,
                      },
                    );
                    setState(() {});
                  },
                  child: Text('Add')),
            ),
            Expanded(
                child: ListView.separated(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    list[index]['title'].toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    list[index]['price'].toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  leading: Image.asset('assets/images/laptop.jpg'),
                  trailing: InkWell(
                      onTap: () {
                        list.remove(list[index]);
                        setState(() {});
                      },
                      child: Icon(Icons.delete)),
                  tileColor: Colors.grey.shade100,
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 3,
                  height: 2,
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
