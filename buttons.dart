import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  var toggleValues = [true, false, false];
  var dropDownValue = 1;
  var dropDownValue1 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1 / 0.7,
          crossAxisCount: 2,
        ),
        children: <Widget>[
          ButtonWidget(
            name: "Material Button",
            child: MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.pink,
              child: Text(
                "BUTTON",
                style: Theme.of(context).textTheme.subtitle.copyWith(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
              ),
            ),
          ),
          ButtonWidget(
            name: "Raw Material Button",
            child: RawMaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              fillColor: Colors.deepOrange,
              child: Text(
                "BUTTON",
                style: Theme.of(context).textTheme.subtitle.copyWith(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
              ),
            ),
          ),
          ButtonWidget(
            name: "Flat Button",
            child: FlatButton(
              onPressed: () {},
              color: Colors.deepPurple,
              child: Text(
                "BUTTON",
                style: Theme.of(context).textTheme.subtitle.copyWith(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
              ),
            ),
          ),
          ButtonWidget(
            name: "Outline Button",
            child: OutlineButton(
              onPressed: () {},
              borderSide: BorderSide(color: Colors.pink),
              child: Text(
                "BUTTON",
                style: Theme.of(context).textTheme.subtitle.copyWith(
                      fontSize: 14.0,
                      color: Colors.pink,
                    ),
              ),
            ),
          ),
          ButtonWidget(
            name: "Raised Button",
            child: RaisedButton(
              onPressed: () {},
              color: Colors.green,
              child: Text(
                "BUTTON",
                style: Theme.of(context).textTheme.subtitle.copyWith(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
              ),
            ),
          ),
          ButtonWidget(
            name: "Icon Button",
            child: IconButton(
              onPressed: () {},
              color: Colors.red,
              icon: Icon(Icons.restaurant_menu),
            ),
          ),
          ButtonWidget(
            name: "Toggle Buttons",
            child: ToggleButtons(
              onPressed: (t) {
                setState(() {
                  toggleValues[t] = !toggleValues[t];
                });
              },
              isSelected: toggleValues,
              children: <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.g_translate),
                Icon(Icons.satellite),
              ],
            ),
          ),
          ButtonWidget(
            name: "PopupMenu Buttons",
            child: PopupMenuButton(
              itemBuilder: (_) => [
                PopupMenuItem(child: Text("One")),
                PopupMenuItem(child: Text("Two")),
                PopupMenuItem(child: Text("Three")),
                PopupMenuItem(child: Text("Four")),
              ],
            ),
          ),
          ButtonWidget(
            name: "Dropdown Buttons",
            child: DropdownButton(
              onChanged: (t) {
                setState(() {
                  dropDownValue = t;
                });
              },
              value: dropDownValue,
              items: [
                DropdownMenuItem(child: Text("Test 1"), value: 1),
                DropdownMenuItem(child: Text("Test 2"), value: 2),
                DropdownMenuItem(child: Text("Test 3"), value: 3),
                DropdownMenuItem(child: Text("Test 4"), value: 4),
                DropdownMenuItem(child: Text("Test 5"), value: 5),
              ],
            ),
          ),
          ButtonWidget(
            name: "Without Underline Dropdown Buttons",
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                onChanged: (t) {
                  setState(() {
                    dropDownValue1 = t;
                  });
                },
                value: dropDownValue1,
                items: [
                  DropdownMenuItem(child: Text("Test 1"), value: 1),
                  DropdownMenuItem(child: Text("Test 2"), value: 2),
                  DropdownMenuItem(child: Text("Test 3"), value: 3),
                  DropdownMenuItem(child: Text("Test 4"), value: 4),
                  DropdownMenuItem(child: Text("Test 5"), value: 5),
                ],
              ),
            ),
          ),
          ButtonWidget(
            name: "Floating Action Button",
            child: FloatingActionButton(
              onPressed: () {},
              heroTag: UniqueKey(),
              key: UniqueKey(),
              child: Icon(Icons.add),
            ),
          ),
          ButtonWidget(
            name: "Floating Action Button Extended",
            child: FloatingActionButton.extended(
              heroTag: UniqueKey(),
              key: UniqueKey(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ButtonWidget(
                            name: "Back Button",
                            child: BackButton(),
                          ),
                          ButtonWidget(
                            name: "Back Button",
                            child: CloseButton(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              label: Text("MORE BUTTONS"),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String name;
  final Widget child;

  ButtonWidget({
    this.name,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              name,
              style: Theme.of(context).textTheme.headline.copyWith(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
