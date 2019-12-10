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
    String _currentCardpoolText = "";

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
            _currentCardpoolText = result[0].title;
            print("loading cardpool success!");
            return result;
        } else {
            throw Exception('Failed to load Cardpools');
        }
    }

    List<DropdownMenuItem> cardpoolToDropdown(List<Cardpool> cp) {
        List<DropdownMenuItem> result = new List<DropdownMenuItem>();
        cp.forEach((element) => result.add(
            DropdownMenuItem(
                value: element.title,
                child: Text(element.title),
            ),
        ));
        return result;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: const Color(0xFF006687),
                title: FutureBuilder<List<Cardpool>>(
                    future: cardpools,
                    builder: (context, snapshot) {
                        if (snapshot.hasData) {
                            return DropdownButton(
                                value: null,
                                isExpanded: true,
                                icon: Icon(Icons.keyboard_arrow_down),
                                items: cardpoolToDropdown(snapshot.data),
                                onChanged: (value) {
                                    setState(() {
                                        _currentCardpoolText = value;
                                    });
                                },
                                underline: Container(
                                    height: 0,
                                ),
                                style: TextStyle(color: Colors.black),
                                iconEnabledColor: Colors.white,
                                hint: Text(
                                    _currentCardpoolText,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24
                                    ),
                                ),
                            );
                        } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                        }

                        // By default, show a loading spinner.
                        return CircularProgressIndicator(
                            backgroundColor: Colors.white,
                        );
                    },
                ),
            ),
            body: DefaultTabController (
                length: 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                        Container(
                            constraints: BoxConstraints(maxHeight: 40, minHeight: 40),
                            color: const Color(0xFF3894b7),
                            child: TabBar(
                                indicatorColor: const Color(0xFF006687),
                                indicatorWeight: 4,
                                tabs: [
                                    Text('CORPORATION'),
                                    Text('RUNNER'),
                                ],
                            ),
                        ),               
                        Expanded(
                            child: TabBarView(
                                children: <Widget>[
                                    DefaultTabController(
                                        length: 3,
                                        child: Column(
                                            children: <Widget>[
                                                Container(
                                                    constraints: BoxConstraints(maxHeight: 40, minHeight: 40),
                                                    color: const Color(0xFF3894b7),
                                                    child: TabBar(
                                                        indicatorColor: const Color(0xFF006687),
                                                        indicatorWeight: 4,
                                                        tabs: [
                                                            Text('IDENTITIES'),
                                                            Text('DECKS'),
                                                            Text('ICE')
                                                        ],
                                                    ),
                                                ),      
                                                Expanded(
                                                    child: TabBarView(
                                                        children: <Widget>[
                                                            Text('corp IDs'),
                                                            Text('corp decks'),
                                                            Text('corp ice')
                                                        ],
                                                    )
                                                )
                                            ],
                                        )
                                    ),
                                    DefaultTabController(
                                        length: 3,
                                        child: Column(
                                            children: <Widget>[
                                                Container(
                                                    constraints: BoxConstraints(maxHeight: 40, minHeight: 40),
                                                    color: const Color(0xFF3894b7),
                                                    child: TabBar(
                                                        indicatorColor: const Color(0xFF006687),
                                                        indicatorWeight: 4,
                                                        tabs: [
                                                            Text('IDENTITIES'),
                                                            Text('DECKS'),
                                                            Text('BREAKERS')
                                                        ],
                                                    ),
                                                ),
                                                Expanded(
                                                    child: TabBarView(
                                                        children: <Widget>[
                                                            Text('runnder IDs'),
                                                            Text('runner decks'),
                                                            Text('runner breakers')
                                                        ],
                                                    )
                                                )      
                                            ],
                                        )
                                    ),
                                ],
                            )
                        )  
                    ]
                ),
            )            
        );   
    }

}