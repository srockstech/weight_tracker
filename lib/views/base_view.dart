import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker/locator.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  const BaseView({
    super.key,
    required this.builder,
  });
  final Widget Function(BuildContext, T, Widget?) builder;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  Widget build(
    BuildContext context,
  ) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
