import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_app/screen/onboarding/suggestion.dart';
import 'dart:convert';

class AddressSearch extends SearchDelegate<Suggestion> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  Future<List<Suggestion>> fetchSuggestions(String input) async {
    print(input);
    print("titotot");
    final response = await http.get(
        'https://data.education.gouv.fr/api/records/1.0/search/?dataset=fr-en-adresse-et-geolocalisation-etablissements-premier-et-second-degre&q=(nature_uai_libe:ECOLE%20DE%20NIVEAU%20ELEMENTAIRE%20AND%20libelle_commune:' +
            input +
            ')&rows=20&fields=libelle_commune,code_postal_uai,appellation_officielle,numero_uai');
    print(response.statusCode);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print("reesult:");
      print(result);
      print("records:");
      print(result['records']);

      return result['records']
          .map<Suggestion>((p) => Suggestion(
              p['recordid'],
              p['fields']['libelle_commune'],
              p['fields']['code_postal_uai'],
              p['fields']['appellation_officielle'],
              p['fields']['numero_uai']))
          .toList();
      //return Suggestion.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      // We will put the api call here
      future: query == "" ? null : fetchSuggestions(query),
      builder: (context, snapshot) => query == ''
          ? Container(
              padding: EdgeInsets.all(16.0),
              child: Text('Par exemple: paris ou ecole rousseau'),
            )
          : snapshot.hasData
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    print(snapshot.data[index]);
                    return ListTile(
                      // we will display the data returned from our future here
                      title:
                          Text(snapshot.data[index].get_appellation_officielle),
                      subtitle: Text(snapshot.data[index].get_libelle_commune),
                      onTap: () {
                        close(context, snapshot.data[index]);
                      },
                    );
                  },
                  itemCount: snapshot.data.length,
                )
              : Container(child: Text('Loading...')),
    );
  }
}
