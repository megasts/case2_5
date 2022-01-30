import 'package:flutter/material.dart';

void main() {
  runApp(const ListViewScreen());
}

class User {
  String name;
  String? phone='';

  User({required this.name, this.phone});
}

final users=[
  User(name: 'Абигель', phone: '+79031882143'),
  User(name: 'Авгалифена', phone: '+79141135215'),
  User(name: 'Гедалья', phone: '+79014724172'),
  User(name: "Эмеренция", phone: '+79223500532'),
  User(name: 'Хаджарбиби', phone: '+79555547361'),
  User(name: 'Францеслава', phone: '+79118178714'),
  User(name: 'Стефанида', phone: '+79203887745'),
  User(name: 'Светозара', phone: '+79678355277'),
  User(name: 'Роспарасковия', phone: '+79172602338'),
  User(name: 'Олеянна', phone: '+79236550631'),
  User(name: 'Амаяк', phone: '+79327625886'),
  User(name: 'Валиддин', phone: '+79182777310'),
  User(name: 'Воловдимир', phone: '+79685315471'),
  User(name: "Газимагомед", phone: '+79316775361'),
  User(name: 'Доминислав', phone: '+79657175761'),
  User(name: 'Ипполинарий', phone: '+79203658884'),
  User(name: 'Себастьян', phone: '+79823527012'),
  User(name: 'Теодозий', phone: '+79262184765'),
  User(name: 'Фагимех', phone: '+79617348012'),
  User(name: 'Фазанбульбекормянс', phone: '+79514784865'),
  User(name: 'Безтелефона',phone:''),
];

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Записная книжка',)),
        body: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: const MyStatefulWidget()),
      ),
    );
  }
}

class MyListItem extends StatelessWidget {
  const MyListItem({Key? key, required this.number}) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {

    return
      Container(width: double.infinity,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            border: Border.all()
        ),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.account_box_sharp),
              title: Text(" Абонент ${users[number].name}",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.phone),
                Text(" ${users[number].phone}",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ],
        ),
      );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  var list=users;
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: MyListItem(number: index,),
          selected: index == _selectedIndex,
          selectedTileColor: Theme.of(context).focusColor,
          onTap: () {
            setState(() {
              _selectedIndex=index;
            });
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(thickness: 1, color: Theme.of(context).dividerColor,);},
    );
  }
}