import 'package:flutter/material.dart';

class NetworkDialog extends StatefulWidget {
  final bool isConnected;
  const NetworkDialog({super.key, required this.isConnected});

  @override
  State<NetworkDialog> createState() => NetworkDialogState();
}

class NetworkDialogState extends State<NetworkDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text( "Network Dialog", textAlign: TextAlign.center,),
      content: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.isConnected ? Icon(Icons.sentiment_satisfied_alt_outlined, color: Colors.green, size: 50,)
                    : Icon(Icons.warning_amber, color: Colors.red, size: 50,),
              Text(widget.isConnected ? "Network Connected." : "No Network Available.",
              style: TextStyle(fontSize: 14.0, color: widget.isConnected ? Colors.green : Colors.red, fontWeight: FontWeight.w600),),
            ]
        ),
      ),
      elevation: 20.0,
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(fixedSize: const Size(100, 40), backgroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Okay', style: TextStyle(color: Colors.white, fontSize: 16.0, fontStyle: FontStyle.italic),),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}