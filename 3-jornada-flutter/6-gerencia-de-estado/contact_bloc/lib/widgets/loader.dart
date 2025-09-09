import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// StateStreamable eh a classe do BLoc
// B é generics, recebe um Bloc
// S eh um state
class Loader<B extends StateStreamable<S>, S> extends StatelessWidget {
  final BlocWidgetSelector<S, bool> selector;

  const Loader({super.key, required this.selector});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<B, S, bool>(
      selector: selector,
      builder: (context, loading) {
        return Visibility(
          visible: loading,
          child: Expanded(child: Center(
            child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
