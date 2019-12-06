import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data/cardpool.dart';

class MetaWidget extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => _MetaWidgetState();
}

class _MetaWidgetState extends State<MetaWidget> {

    Future<List<Cardpool>> cardpools;
    int _currentCardpoolIndex = 0;

    @override
    void initState() {
        super.initState();
        cardpools = fetchCardPools();
    }

    Future<List<Cardpool>> fetchCardPools() async {
        print("loading cardpool");
        final response = await http.get('https://www.knowthemeta.com/JSON/Cardpool');
        if (response.statusCode == 200) {
            List<Cardpool> result = new List<Cardpool>();
            json.decode(response.body).forEach((element) => 
                result.add(Cardpool.fromJson(element))
            );
            print("loading cardpool success!");
            return result;
        } else {
            throw Exception('Failed to load Cardpools');
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: FutureBuilder<List<Cardpool>>(
                future: cardpools,
                builder: (context, snapshot) {
                    if (snapshot.hasData) {
                        return Text(snapshot.data[0].title);
                    } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner.
                    return CircularProgressIndicator(
                        backgroundColor: Colors.white,
                    );
                },
            ),
            actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.keyboard_arrow_left),
                    onPressed: () {
                        
                    },
                ),
            ],
            // bottom: TabBar(
            //     isScrollable: false,
            //     tabs: [
            //         Tab(icon: Icon(Icons.directions_car)),
            //         Tab(icon: Icon(Icons.directions_transit)),
            //         Tab(icon: Icon(Icons.directions_bike)),
            //     ]
            // )
            ),
            body: Container(
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                        
                    ],
                )
                
            )
        );   
    }

}