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
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: [
                    Container(
                      alignment: FractionalOffset.center,
                      child: Expanded(
                        child: Column(
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
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Container(
                          color: Colors.deepPurple[400],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'New set: $newSet',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Container(
                          color: Colors.deepPurple[400],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'EXPLANATION: $explanation',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 1,
                  childAspectRatio: 5,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple[600],
                        ),
                        onPressed: unionHandler,
                        child: const Text('GET UNION'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple[400],
                        ),
                        onPressed: intersectionHandler,
                        child: const Text('GET INTERSECTION'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple[300],
                        ),
                        onPressed: differenceHandler,
                        child: const Text('GET DIFFERENCE'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
