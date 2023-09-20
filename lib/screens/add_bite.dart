import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lasbite/screens/dashboard.dart';




class AddABitePage extends StatefulWidget {
  const AddABitePage({Key? key}) : super(key: key);

  @override
  _AddABitePageState createState() => _AddABitePageState();
}

class _AddABitePageState extends State<AddABitePage> {
  String? _selectedShareOrRequest;
  String? _selectedBiteCategory;
  String? _selectedShareType;
  TextEditingController _textController = TextEditingController();
  TextEditingController _textController2 = TextEditingController();
  final picker = ImagePicker();
  String? _imageUrl;
  String? _selectedImage;

  final List<String> shareTypes = [
    'My Current Location',
    'Share live location',
    'Kigali, Rwanda',
    'Kimironko Road, Kigali'
  ];
  final List<String> shareOrrequest = ['Share', 'Request'];
  final List<String> biteCategories = [
    'Bakery Products',
    'Nuts and Seeds',
    'Spices',
    'Fruits',
    'Dairy Products',
    'Frozen Foods',
    'Vegetarian and Vegan',
    'Ready Meals',
    'Other'
  ];

  void _selectShareType(String? shareType) {
    setState(() {
      _selectedShareType = shareType;
    });
  }

  Future<void> _selectImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = pickedFile.path;
      });
    }
  }

   @override
  void initState() {
    super.initState();
    openCamera();
  }

  Future<void> openCamera() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageUrl = pickedFile.path;
      });
      print(_imageUrl);
    }
  }

  double boxWidth = double.infinity;

  @override
  Widget build(BuildContext context) {
    double availableWidth = MediaQuery.of(context).size.width - 40.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
             Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Align(
              alignment: Alignment.center,
              child: PopupMenuButton<String>(
                onSelected: _selectShareType,
                itemBuilder: (BuildContext context) {
                  return shareTypes.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
                child: const Text('Share',
                    style: TextStyle(
                        color: const Color.fromRGBO(37, 68, 6, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 500.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Share or Request?',
                        labelStyle: TextStyle(fontSize: 18),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                      ),
                      value: _selectedShareOrRequest,
                      items: shareOrrequest.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedShareOrRequest = newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'What is your Bite’s Category?',
                        labelStyle: TextStyle(fontSize: 18),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                      ),
                      value: _selectedBiteCategory,
                      items: biteCategories.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedBiteCategory = newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Enter your bite’s name',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _textController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your bite’s name',
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Describe your bite',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _textController2,
                          decoration: const InputDecoration(
                            hintText: 'Describe your bite',
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'What is your Location?',
                        labelStyle: TextStyle(fontSize: 18),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                      ),
                      value: _selectedShareType,
                      items: shareTypes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedShareType = newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Upload a photo of your bite',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: _selectImage,
                    child: Container(
                      width:
                          boxWidth < availableWidth ? boxWidth : availableWidth,
                      height: 100,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(39, 69, 6, 1),
                            width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 30.0,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Select File',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(height: 10),
                  // if (_selectedImage != null)
                  //   Image.network(
                  //     // 'file://$_selectedImage',
                  //     // width: 200,
                  //     // height: 200,
                  //   ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1.0,
                          width: 150.0,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 10.0),
                        const Text(
                          'or',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10.0),
                        Container(
                          height: 1.0,
                          width: 150.0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: openCamera,
                    child: Container(
                      width:
                          boxWidth < availableWidth ? boxWidth : availableWidth,
                      height: 50,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(156, 206, 234, 177),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt,
                              size: 18.0, color: Color.fromRGBO(39, 69, 6, 1)),
                          SizedBox(width: 10.0),
                          Text(
                            'Open Camera & Take a photo',
                            style: TextStyle(
                                color: Color.fromRGBO(39, 69, 6, 1),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
