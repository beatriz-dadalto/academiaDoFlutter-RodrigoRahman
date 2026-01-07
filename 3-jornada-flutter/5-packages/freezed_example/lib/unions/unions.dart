import 'package:freezed_annotation/freezed_annotation.dart';

part 'unions.freezed.dart';

/*
  !A union is a type that can be one of several different types, but only one
  at a time. It's a way to model data that can have multiple forms/variants.

  Example is the union type (parent)
  Person and City are the variants (children)
  An Example instance is either a Person or a City, never both
*/

@freezed
class Example with _$Example {
  const factory Example.person(String name, int age) = Person;
  const factory Example.city(String name, int population) = City;
}

void main() {
  var example = Example.person('Beatriz', 18);

  if (example is Person) {
    print(example.age);
  }

  if (example is City) {
    print(example.population); // ❌ Won't execute (example is Person, not City)
  }

  /*
  !Better Than Using if is - Use Pattern Matching
  Instead of if (example is Person), use the cleaner pattern matching methods:
    Benefits:
    ✅ Type-safe (compiler catches missing cases)
    ✅ Exhaustive (must handle all variants)
    ✅ Cleaner than nested if is statements
    ✅ Perfect for Flutter state management
  */

  example.when(
    person: (name, age) => print('Person: $name, age $age'),
    city: (name, population) => print('City: $name, pop $population'),
  );

  // Or with map to access full object:
  example.map(
    person: (person) => 'Name: ${person.name}',
    city: (city) => 'Population: ${city.population}',
  );
}
