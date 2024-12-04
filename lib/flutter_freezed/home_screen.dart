import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PersonModel> personList = [
    PersonModel(name: null),
    PersonModel(name: 'Shivam'),
    PersonModel(name: 'Rohit'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: personList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              personList[index].name.toString(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PersonModel personModel = PersonModel(name: 'Aman');
          PersonModel personModel1 = PersonModel(name: 'Aman');

          Map<String, dynamic> data = {'name': 'Aman Tyagi'};

          PersonModel model = PersonModel.fromJson(data);
          print(model.name.toString());
          print(personModel == personModel1);

          model = model.copyWith(name: 'Aman Bhardwaj');
          print(model.name.toString());
        },
      ),
    );
  }
}

class PersonModel {
  String? name;

  PersonModel({
    this.name,
  });

  /// the below function is used to allocate same hashcode to the Object if they have same data inside
  @override
  bool operator ==(Object other) => identical(this, other) || other is PersonModel && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;

  /// This funtion is used to convert json data into variables.
  PersonModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  /// This funtion is used to convert variables into json.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    return data;
  }

  /// copyWith function is used to change the values of class is variables
  PersonModel copyWith({
    String? name,
  }) {
    return PersonModel(
      name: name ?? this.name,
    );
  }

  @override
  String toString() {
    return 'PersonModel(name: $name)';
  }
}
