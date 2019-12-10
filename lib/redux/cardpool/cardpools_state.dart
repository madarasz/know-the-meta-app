import 'package:flutter/material.dart';
import 'package:know_the_meta_app/redux/cardpool/cardpool.dart';

@immutable
class CardpoolsState {
    final List<Cardpool> cardpoolsState;

    CardpoolsState({ @required this.cardpoolsState});

    factory CardpoolsState.initial() {
        return new CardpoolsState(
            cardpoolsState: new List<Cardpool>()
        );
    }
}