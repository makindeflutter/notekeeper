import 'package:flutter/material.dart';

class Notedetails extends StatefulWidget {
  String appBarTitle;
  Notedetails(this.appBarTitle);
  @override
  State<StatefulWidget> createState() {
    return NotedetailsState(this.appBarTitle);
  }
}

class NotedetailsState extends State<Notedetails> {
  final _formKey = GlobalKey<FormState>();
  final _priority = ['High', 'Low'];
  var _currentItemSelected = 'High';
  final _minpadding = 15.0;
  String appBarTitle;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  NotedetailsState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(_minpadding),
          child: ListView(children: <Widget>[
            DropdownButton(
              style: textStyle,
              items: _priority.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (newSelectedValue) {
                setState(() {
                  _currentItemSelected = newSelectedValue!;
                });
              },
              value: _currentItemSelected,
            ),
            Padding(
              padding: EdgeInsets.only(top: _minpadding, bottom: _minpadding),
              child: TextFormField(
                style: textStyle,
                controller: titleController,
                // validator: (String? value) {
                //   if (value!.isEmpty) {
                //     return 'Please enter principal amount';
                //   }
                //   return null;
                // },
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: textStyle,
                    errorStyle: const TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _minpadding, bottom: _minpadding),
              child: TextFormField(
                style: textStyle,
                controller: descriptionController,
                // validator: (String? value) {
                //   if (value!.isEmpty) {
                //     return 'Please enter rate of interest';
                //   }
                //   return null;
                // },
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: textStyle,
                    errorStyle: const TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _minpadding, bottom: _minpadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Theme.of(context).primaryColorLight,
                          backgroundColor:
                              Theme.of(context).primaryColorDark // foreground
                          ),
                      child: const Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    width: 10.0,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Theme.of(context).primaryColorLight,
                        backgroundColor:
                            Theme.of(context).primaryColorDark, // foreground
                      ),
                      child: const Text(
                        'Delete',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
