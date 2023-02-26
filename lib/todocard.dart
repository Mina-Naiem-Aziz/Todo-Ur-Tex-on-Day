import 'package:flutter/material.dart';

class Todocard extends StatelessWidget {
  final String vartitle;
  final bool yesORno;
  final Function myfunc;
  final int iii;
  final Function delete;
  Todocard({
    required this.vartitle,
    required this.myfunc,
    required this.yesORno,
    required this.iii,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myfunc(iii);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  Icon(
                    yesORno ? Icons.check : Icons.close,
                    size: 25,
                    color: yesORno ? Colors.green : Colors.red,
                  ),
                  IconButton(
                    onPressed: () {
                      delete(iii);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(209, 224, 224, 0.2),
          ),
        ),
      ),
    );
  }
}
