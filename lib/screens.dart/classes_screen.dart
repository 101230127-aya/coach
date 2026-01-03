import 'package:flutter_application_1/models.dart/class_model.dart';
import 'package:flutter/material.dart';

class ClassesScreen extends StatefulWidget {
  const ClassesScreen({Key? key}) : super(key: key);

  @override
  State<ClassesScreen> createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  final List<ClassModel> classes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Classes'),
      ),

      body: ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, index) {
          final currentClass = classes[index];

          return Dismissible(
            key: Key(currentClass.id.toString()),
            direction: DismissDirection.endToStart,

            onDismissed: (direction) {
              setState(() {
                classes.removeAt(index);
              });
            },

            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),

            child: InkWell(
              onTap: () {
                
              },
              
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      currentClass.name,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      currentClass.type.name,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          )
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String className = '';
              ClassType selectedType = ClassType.beginner;

              return AlertDialog(
                title: const Text('Add Class'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration:
                          const InputDecoration(labelText: 'Class Name'),
                      onChanged: (value) {
                        className = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    DropdownButton<ClassType>(
                      value: selectedType,
                      items: ClassType.values.map((type) {
                        return DropdownMenuItem(
                          value: type,
                          child: Text(type.name),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedType = value;
                          });
                        }
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (className.isNotEmpty) {
                        setState(() {
                          classes.add(
                            ClassModel(
                              id: classes.length + 1,
                              name: className,
                              type: selectedType,
                            ),
                          );
                        });
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
