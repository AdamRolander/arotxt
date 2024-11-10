import 'dart:io'; // for file handling
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // for image selection, gallery + camera
import '../widgets/burger.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// set state triggers a ui update!

class _HomePageState extends State<HomePage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _selectedImages = []; // ? = nullable list of images

  // Function to pick multiple images from the gallery
  Future<void> _pickMultipleImages() async {
    final List<XFile>? images = await _picker.pickMultiImage(); // enables multi selection 
    if (images != null) {
      setState(() {
        _selectedImages!.addAll(images); // ! = null assertion operator, telling it we know it won't be null when doing this 
      });
    }
  }

  // Function to take a photo with the camera
  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _selectedImages!.add(photo);
      });
    }
  }

  // Function to remove an image
  void _removeImage(int index) {
    setState(() {
      _selectedImages!.removeAt(index);
    });
  }

  // Function to show a dialog with options for camera or gallery
  void _showImageSourceSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.pop(context); // Close the dialog
                  _takePhoto(); // Launch camera
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.pop(context); // Close the dialog
                  _pickMultipleImages(); // Launch gallery
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AROTXT Home'),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu), // Burger menu
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: const Burger(), // Burger menu from custom widget
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Making the page scrollable and displaying selected images
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _selectedImages != null && _selectedImages!.isNotEmpty
                        ? GridView.builder(
                            physics: const NeverScrollableScrollPhysics(), // Prevent GridView from scrolling
                            shrinkWrap: true, // Let the GridView take up as much space as needed
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Adjust the number of images per row
                            ),
                            itemCount: _selectedImages!.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  // Display each image
                                  Positioned.fill(
                                    child: Image.file(
                                      File(_selectedImages![index].path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // X button to remove the image
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: IconButton(
                                      icon: const Icon(Icons.close, color: Colors.red),
                                      onPressed: () {
                                        _removeImage(index);
                                      },
                                    ),
                                  ),
                                  // Numbering in the other corner
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      color: Colors.black54,
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        : const Center(
                            child: Text('No images selected'),
                          ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Button at the bottom of the screen for selecting image source
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => _showImageSourceSelectionDialog(context),
                child: const Text("Select Images"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}