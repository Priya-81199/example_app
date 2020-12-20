import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

void main() {
  runApp(CounterView());
}

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CounterViewModel>.reactive(
      viewModelBuilder: () => CounterViewModel(),
      onModelReady: (model) => model.start,
      builder: (context, model, child) => MaterialApp(
              home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => model.updateTitle(),
            ),
            body: Center(child: Text(model.title),),
        ),
      ),
    );
  }
}

class CounterViewModel extends ChangeNotifier {
  String title = 'default';

  void start() {
    title = 'started';
    notifyListeners();
  }

  int counter = 0;
  void updateTitle() {
    counter++;
    title = '$counter';
    notifyListeners();
  }
}
