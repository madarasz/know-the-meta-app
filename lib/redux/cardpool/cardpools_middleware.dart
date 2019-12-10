import 'package:know_the_meta_app/redux/app/app_state.dart';
import 'package:know_the_meta_app/redux/cardpool/cardpools_actions.dart';
import 'package:redux/redux.dart';

class CardpoolsMiddleware extends MiddlewareClass<AppState>{
    @override
    call(Store<AppState> store, dynamic action, NextDispatcher next) {
        if (action is LoadCardpoolsAction) {
            // TODO
        }
        next(action);
    }
    
}