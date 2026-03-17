import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final employees = FirebaseFirestore.instance.collection('employees');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD OPERATION'),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[300],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: employees.snapshots(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          if (!snap.hasData || snap.data!.docs.isEmpty) {
            return const Center(child: Text('No Employees Found'));
          }

          final docs = snap.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  docs[index]['name'] ?? 'No Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing:Row(
                  children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.edit), color: Colors.black,),
                ],),
              );
            },
          );
        },
      ),
    );
  }
}
