import 'package:flutter/material.dart';
import 'package:set_ops_app/src/api/set_cache_model.dart';
import 'package:set_ops_app/src/controller/text_field.dart';

class MyApp extends State<Home> {
  String setA = '';
  String setB = '';

  String newSet = '';
  String explanation = '';

  unionHandler() {
    final listA = setA.split(',').toList();
    final listB = setB.split(',').toList();

    final setOps = SetOps(listA: listA, listB: listB);

    setState(() {
      newSet = setOps.getUnion.toString();
      explanation =
          'set A and B will be mixed but the matching values will be written once into the new set';
    });
  }

  intersectionHandler() {
    final listA = setA.split(',').toList();
    final listB = setB.split(',').toList();

    final setOps = SetOps(listA: listA, listB: listB);

    setState(() {
      newSet = setOps.getIntersection.toString();
      explanation =
          'intersection is creating a new set with matching values from set A vs set B';
    });
  }

  differenceHandler() {
    final listA = setA.split(',').toList();
    final listB = setB.split(',').toList();

    final setOps = SetOps(listA: listA, listB: listB);

    setState(() {
      newSet = setOps.getDifference.toString();
      explanation =
          'difference is like if a value from set A has NO matching value in set B';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'add set A (separated by ",")',
                ),
                onChanged: (text) => setState(() {
                  setA = text;
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'add Set B (separated by ",")',
                ),
                onChanged: (text) => setState(() {
                  setB = text;
                }),
              ),
            ),
            Container(
              color: Colors.red[700],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'New set: $newSet',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'EXPLANATION: $explanation',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: unionHandler,
                child: const Text('GET UNION'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: intersectionHandler,
                child: const Text('GET INTERSECTION'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: differenceHandler,
                child: const Text('GET DIFFERENCE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
