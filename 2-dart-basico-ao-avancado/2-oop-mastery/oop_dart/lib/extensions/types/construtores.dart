extension type Age._(int age) {
  Age.adult() : this._(18);
  Age.menor() : this._(10);

  factory Age(final int age) {
    return Age._(age);
  }
}

class AgeClass {
  int age;

  AgeClass._(this.age);

  factory AgeClass(final int age) {
    return AgeClass._(age);
  }
}

void main() {
  final adultClass = AgeClass(18);
  Age(10);

  final adult = Age.adult();
  Age.menor();

  print(adult is int); // true
  print(adultClass is int); // false
}
