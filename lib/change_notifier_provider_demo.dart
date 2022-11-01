import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class ChangeNotifierProviderDemo extends StatelessWidget {
  ChangeNotifierProviderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final dataModel = ref.watch(peopleProvider);

      return Scaffold(
        body: ListView.builder(
            itemCount: dataModel.count,
            itemBuilder: (ctx, i) {
              final data = dataModel.people[i];
              return Dismissible(
                  key: ValueKey(data.uuid),
                  child: ListTile(
                    title: Text(data.displayName),
                    onTap: () async {
                      final updatedPerson =
                          await createOrUpdatePersonDialog(context, data);
                      dataModel.update(updatedPerson!);
                    },
                  ));
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final person = await createOrUpdatePersonDialog(context);
            if (person != null) {
              ref.watch(peopleProvider).add(person);
            }
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  Future<Person?> createOrUpdatePersonDialog(BuildContext context,
      [Person? person]) {
    String? name = person?.name;
    String? age = person?.age;
    nameController.text = name ?? '';
    ageController.text = age ?? '';
    return showDialog<Person?>(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text('Create Person'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    onChanged: (value) => name = value,
                    decoration:
                        const InputDecoration(hintText: 'Enter name...'),
                  ),
                  TextField(
                    onChanged: (value) => age = value,
                    controller: ageController,
                    decoration: const InputDecoration(hintText: 'Enter age...'),
                  )
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Cancel')),
                TextButton(
                    onPressed: () {
                      if (name != null && age != null) {
                        final newPerson = person!.updated(name, age);
                        Navigator.of(context).pop(newPerson);
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Save')),
              ],
            ));
  }
}

final peopleProvider = ChangeNotifierProvider((ref) => DataModel());

class DataModel extends ChangeNotifier {
  final List<Person> _people = [];

  int get count => _people.length;

  UnmodifiableListView<Person> get people => UnmodifiableListView(_people);

  void add(Person person) {
    _people.add(person);
    notifyListeners();
  }

  void remove(Person person) {
    _people.remove(person);
    notifyListeners();
  }

  void update(Person updatedPerson) {
    final index = _people.indexOf(updatedPerson);
    final oldPerson = _people[index];
    if (oldPerson.name != updatedPerson.name ||
        oldPerson.age != updatedPerson.age) {
      _people[index] = oldPerson.updated(
        updatedPerson.name,
        updatedPerson.age,
      );
      notifyListeners();
    }
  }
}

@immutable
class Person {
  final String name;
  final String age;
  final String? uuid;
  Person({
    required this.name,
    required this.age,
    String? uuid,
  }) : uuid = uuid ?? const Uuid().v4();

  Person updated([String? name, String? age]) =>
      Person(name: name ?? this.name, age: age ?? this.age, uuid: uuid);

  String get displayName => '$name ($age years old)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Person &&
        other.name == name &&
        other.age == age &&
        other.uuid == uuid;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ uuid.hashCode;

  @override
  String toString() => 'Person(name: $name, age: $age, uuid: $uuid)';
}
