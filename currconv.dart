import 'package:curr/but.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Curcon extends StatefulWidget {
  const Curcon({super.key});

  @override
  State<Curcon> createState() => _CurconState();
}

class _CurconState extends State<Curcon> {
  bool isvisible = false;
  String num = " ";
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    num.isEmpty ? "0" : num,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 3, 204, 244),
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            Wrap(
              children: isvisible == true
                  ? But.butval
                      .map((value) => SizedBox(
                          width: screen.width / 4,
                          height: screen.width / 7,
                          child: buildButton(value)))
                      .toList()
                  : But.butval1
                      .map((value) => SizedBox(
                          width: screen.width / 4,
                          height: screen.width / 4,
                          child: buildButton(value)))
                      .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        color: const Color.fromARGB(255, 71, 68, 68),
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 0, 194, 253)),
            borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          onTap: () => onbtntap(value),
          child: Center(
              child: Text(value,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 4, 220, 236),
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }

  void onbtntap(String value) {
    setState(() {
      switch (value) {
        case "C":
          num = "";
          break;
        case "tan" || "cos" || "sin":
          num += "$value(";
          break;
        case "x^y":
          num == "" ? "" : "^";
          break;
        case "1/x":
          num += "1/";
        case "pi":
          num += "3.14";
          break;
        case "D":
          num = num.substring(0, num.length - 1);
          break;
        case "_/x":
          num += "sqrt(";
          break;
        case "X":
          if (isvisible == false)
            // ignore: curly_braces_in_flow_control_structures
            isvisible = true;
          else
            // ignore: curly_braces_in_flow_control_structures
            isvisible = false;
          break;
        default:
          num += value;
      }
    });
  }
}
