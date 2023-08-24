// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import '../screens/update_screen.dart';
//
//
// class Vehicle {
//   final String vehicleId;
//   final String vehicleName;
//   final String type;
//   final String vehicleNo;
//   final String vehicleImage;
//
//   Vehicle({
//     required this.vehicleId,
//     required this.vehicleName,
//     required this.type,
//     required this.vehicleNo,
//     required this.vehicleImage,
//   });
//
//   factory Vehicle.fromJson(Map<String, dynamic> json) {
//     return Vehicle(
//       vehicleId: json['vehicle_id'],
//       vehicleName: json['vehicle_name'],
//       type: json['type'],
//       vehicleNo: json['vehicle_no'],
//       vehicleImage: json['vehicle_image'],
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   List<Vehicle> vehicles = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchVehicles();
//   }
//
//   Future<void> fetchVehicles() async {
//     final response = await http.get(Uri.parse('https://creativethoughtsinfo.com/nmt/Api/vehicle_list'));
//
//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);
//       final dataList = jsonResponse['data'] as List<dynamic>;
//
//       final fetchedVehicles = dataList.map((item) => Vehicle.fromJson(item)).toList();
//
//       setState(() {
//         vehicles = fetchedVehicles;
//       });
//     } else {
//       // Handle error case
//       print('Failed to fetch vehicles.');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:  AppBar(
//         backgroundColor: const Color(0XFF567DF4),
//         title: const Center(
//             child: Text(
//               'NMT',
//               style: TextStyle(color: Colors.white),
//             )),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GestureDetector(
//                 onTap: () {
//                   Get.to(const UpdateScreen());
//                 },
//                 child: const Icon(
//                   Icons.add_box_outlined,
//                   color: Colors.white,
//                 )),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//             child: Container(
//                 height: 170,
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     )),
//                 child: Image.asset('assets/images/car.png')),
//           ),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   Icon(
//                     Icons.wallet,
//                     color: Colors.black54,
//                   ),
//                   Text('Fines & Due’s')
//                 ],
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               Column(
//                 children: [
//                   Icon(Icons.watch_later_outlined, color: Colors.black54),
//                   Text('History')
//                 ],
//               ),
//             ],
//           ),
//           ListView.builder(
//             shrinkWrap: true,
//             itemCount: vehicles.length,
//             itemBuilder: (context, index) {
//               final vehicle = vehicles[index];
//               return ListTile(
//                 title: Text(
//                   vehicle.vehicleName,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Text(vehicle.type),
//                 trailing: Container(
//                   height: 35,
//                   width: 35,
//                   decoration: BoxDecoration(
//                     color: const Color(0XFF567DF4),
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: const Icon(
//                     Icons.arrow_forward_ios,
//                     color: Colors.white,
//                   ),
//                 ),
//                 leading: Container(
//                   height: 40,
//                   width: 50,
//                   child: Image.network(vehicle.vehicleImage, fit: BoxFit.fill),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
