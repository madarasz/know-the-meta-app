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
                title: FutureBuilder<List<Cardpool>>(
                    future: cardpools,
                    builder: (context, snapshot) {
                        if (snapshot.hasData) {
                            return DropdownButton(
                                value: snapshot.data[0].title,
                                isExpanded: true,
                                icon: Icon(Icons.keyboard_arrow_down),
                                items: cardpoolToDropdown(snapshot.data),
                                onChanged: (value) {
                                    setState(() {
                                        // _value = value;
                                    });
                                },
                                underline: Container(
                                    height: 0,
                                ),
                                style: TextStyle(color: Colors.black),
                                // iconEnabledColor: Colors.white,
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
            // body: Container(
            //     alignment: Alignment.center,
            //     child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         mainAxisSize: MainAxisSize.max,
            //         children: <Widget>[
                        
            //         ],
            //     )
                
            // )
        );   
    }

}