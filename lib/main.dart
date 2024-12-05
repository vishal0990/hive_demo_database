import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive_demo_database/parent_class.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // Register adapters
  Hive.registerAdapter(ParentClassAdapter());
  Hive.registerAdapter(SubClassAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImagePickerExample(),
    );
  }
}

class ImagePickerExample extends StatefulWidget {
  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  late Box<ParentClass> parentBox;

  @override
  void initState() {
    super.initState();
    openBox();
  }

  Future<void> openBox() async {
    parentBox = await Hive.openBox<ParentClass>('parentBox');
  }

  Future<void> pickAndSaveImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final Uint8List imageBytes = await image.readAsBytes();

      // Create a ParentClass object with the image
      final subClass = SubClass(childName: 'Child One', childAge: 10);
      final parentClass = ParentClass(
        parentName: 'Parent Name',
        subClass: subClass,
        image: imageBytes,
      );

      // Save to Hive
      await parentBox.add(parentClass);

      setState(() {}); // Refresh UI
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker Example')),
      body: FutureBuilder(
        future: Hive.openBox<ParentClass>('parentBox'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final parentClasses = parentBox.values.toList();
            return ListView.builder(
              itemCount: parentClasses.length,
              itemBuilder: (context, index) {
                final parent = parentClasses[index];
                return ListTile(
                  title: Text(parent.parentName),
                  subtitle: Text(
                    'Child: ${parent.subClass.childName}, Age: ${parent.subClass.childAge}',
                  ),
                  leading: parent.image != null
                      ? Image.memory(parent.image!, width: 50, height: 50)
                      : const Icon(Icons.image_not_supported),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickAndSaveImage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
