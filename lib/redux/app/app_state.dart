import 'package:know_the_meta_app/redux/cardpool/cardpools_state.dart';

class AppState {
    CardpoolsState cardpoolsState;
    
    // constructor
    AppState({this.cardpoolsState});

    factory AppState.initial() => AppState(cardpoolsState: CardpoolsState.initial());
}