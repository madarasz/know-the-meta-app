import 'package:flutter/material.dart';
import 'package:know_the_meta_app/redux/app/app_reducer.dart';
import 'package:redux/redux.dart';
import 'package:know_the_meta_app/home.dart';
import 'package:know_the_meta_app/redux/app/app_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    // Redux store
    final Store<AppState> store = Store<AppState>(
        appReducer, /* Function defined in the reducers file */
        initialState: AppState.initial(),
        // middleware: createStoreMiddleware(),
    );

    // This widget is the root of the application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Know the Meta',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                primaryColor: const Color(0xFF3894b7),
                primaryColorLight: const Color(0xFF70c5e9),
                primaryColorDark: const Color(0xFF006687),
                // secondary: const Color(0xFFbf360c),
                // secondaryColorLight: const Color(0xFFf9683a),
                // secondaryColorDark: const Color(0xFFf9683a),
                canvasColor: const Color(0xFFfafafa),
            ),
            home: Home(),
        );
    }
}
