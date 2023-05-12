// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:formation/controllers/password_widget_controller.dart';

// class PasswordWidget extends StatefulWidget {
//   //Propiétés possedant un comportemant d'etat lorsque la fonction setState est appelée
//   bool obscureText = true;
//   int TypeLength = 0;

//   PasswordWidget({super.key});

//   @override
//   State<StatefulWidget> createState() => _PasswordWidgetState();
// }

// class _PasswordWidgetState extends State<PasswordWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(25),
//       alignment: Alignment.center,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: TextFormField(
//                   //appel de l'etat de la propriété obscureText
//                   obscureText: widget.obscureText,
//                   decoration: const InputDecoration(
//                     label: Text('Saisir un Mot de passe'),
//                   ),
//                   onChanged: (String value) {
//                     //inspect(value);
//                     //setState permet de modifier l'etat de la propriété TypeLength
//                     setState(() {
//                       widget.TypeLength = value.length;
//                     });
//                   },
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   //setState permet de modifier l'etat de la propriété obscureText
//                   setState(() {
//                     //widget.obscureText = !widget.obscureText;
//                     widget.obscureText =
//                         PasswordWidgetController.getObscure(widget.obscureText);
//                   });
//                 },
//                 //icon: const Icon(Icons.visibility),
//                 icon: PasswordWidgetController.getIcon(widget.obscureText),
//               ),
//             ],
//           ),
//           //sizedBox : bloc possédant des dimensions
//           const SizedBox(height: 15),
//           Text(
//             '${widget.TypeLength} caractère saisis',
//           ),
//           const SizedBox(height: 15),
//           AnimatedContainer(
//               duration: const Duration(milliseconds: 500),
//               width: 150,
//               height: 5,
//               decoration: BoxDecoration(
//                 color: PasswordWidgetController.getColor(widget.TypeLength),
//               )),
//         ],
//       ),
//     );
//   }
// }
