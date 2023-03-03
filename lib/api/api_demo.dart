// import 'package:final_matrimony/api/User.dart';
// import 'package:final_matrimony/api/remote_service.dart';
// import 'package:flutter/material.dart';
//
// class ApiDemo extends StatefulWidget {
//   @override
//   State<ApiDemo> createState() => _ApiDemoState();
// }
//
// List<User>? localList = [];
//
// class _ApiDemoState extends State<ApiDemo> {
//   var isData = false;
//
//   @override
//   void initState() {
//     super.initState();
//     apiCall();
//   }
//
//   apiCall() async {
//     localList = await RemoteService().getData();
//     if (localList != null) {
//       setState(() {
//         isData = true;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('CALL API'),
//       ),
//       body: Visibility(
//         visible: isData,
//         child: ListView.builder(
//           itemCount: localList?.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Text(localList![index].userName.toString());
//           },
//         ),
//         replacement: Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }
