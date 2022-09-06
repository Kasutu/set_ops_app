import 'package:set_ops_app/src/api/set_ops_Interface.dart';

class SetOpsInfo<T> {
  Set<T> _setA = <T>{};
  Set<T> _setB = <T>{};

  get getA => _setA;
  get getB => _setB;
}

class SetOps<T> extends SetOpsInfo<T> implements ISetOps<T> {
  SetOps({required List<T> listA, required List<T> listB}) {
    _setA = listA.toSet();
    _setB = listB.toSet();
  }

  SetOps.fromSet({required Set<T> setA, required Set<T> setB}) {
    _setA = setA;
    _setB = setB;
  }

  @override
  Set<T> get getDifference {
    return getA.difference(getB);
  }

  @override
  Set<T> get getIntersection {
    return getA.intersection(getB);
  }

  @override
  Set<T> get getUnion {
    return getA.union(getB);
  }
}
