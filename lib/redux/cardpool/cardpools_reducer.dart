import 'package:know_the_meta_app/redux/cardpool/cardpools_actions.dart';
import 'package:know_the_meta_app/redux/cardpool/cardpools_state.dart';
import 'package:redux/redux.dart';

final cardpoolsReducer = combineReducers<CardpoolsState>([
    TypedReducer<CardpoolsState,LoadCardpoolsAction>(_loadCardpools)
]);

CardpoolsState _loadCardpools(CardpoolsState state, LoadCardpoolsAction action) {
    return state;
}