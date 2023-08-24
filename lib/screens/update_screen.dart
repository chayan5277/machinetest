import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  final TextEditingController vehicleName = TextEditingController();
  final TextEditingController registrationNo = TextEditingController();
  final TextEditingController type = TextEditingController();
  final TextEditingController manufactureyear = TextEditingController();
  final TextEditingController vehiclenameexp = TextEditingController();

  void _postDataToAPI() async {
    final url =
        'https://creativethoughtsinfo.com/nmt/Api/update_vehicle'; // Replace with your actual API endpoint

    final Map<String, dynamic> postData = {
      "vehicle_id": "13",
      "name": vehicleName.text,
      "image": "imagename",
      "reg_no": registrationNo.text,
      "type": type.text,
      "manufacture_year": manufactureyear.text,
      "insurance_expiry": vehiclenameexp.text,
      "state_id": "3956",
    };


    print(vehicleName.text);
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(postData),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print('API call successful');
    } else {
      // Handle errors
      print('API call failed');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Vehicles',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color(0XFF567DF4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 70, right: 70, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.black54,
                      size: 40,
                    ),
                    Text(
                      'Add Vehicles Image',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          color: Colors.black45),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Vehicle Name',
                style: TextStyle(fontSize: 18),
              ),
              TextFormField(
                controller: vehicleName,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0XFFE8EDFF),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100))),
              ),
              const SizedBox(height: 10),
              const Text(
                'Vehicle Registration Number',
                style: TextStyle(fontSize: 18),
              ),
              TextFormField(
                controller: registrationNo,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0XFFE8EDFF),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100))),
              ),
              const SizedBox(height: 10),
              const Text(
                'Vehicle Type ',
                style: TextStyle(fontSize: 18),
              ),
              TextFormField(
                controller: type,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0XFFE8EDFF),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100))),
              ),
              const SizedBox(height: 10),
              const Text(
                'Vehicle Manufacture Year',
                style: TextStyle(fontSize: 18),
              ),
              TextFormField(
                controller: manufactureyear,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0XFFE8EDFF),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100))),
              ),
              const SizedBox(height: 10),
              const Text(
                'Vehicle insurance Expiry',
                style: TextStyle(fontSize: 18),
              ),
              TextFormField(
                controller: vehiclenameexp,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0XFFE8EDFF),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100))),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _postDataToAPI,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blue,
                  ),
                  height: 40,
                  child: const Center(
                      child: Text(
                    'Add Vehicle',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
