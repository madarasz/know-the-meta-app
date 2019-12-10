import 'package:know_the_meta_app/redux/app/app_state.dart';
import 'package:know_the_meta_app/redux/cardpool/cardpools_reducer.dart';

AppState appReducer(AppState state, dynamic action) =>
    new AppState(
        cardpoolsState: cardpoolsReducer(state.cardpoolsState, action)
    );