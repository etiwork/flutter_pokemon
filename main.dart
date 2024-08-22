import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class GraphqlConfig {
 

  HttpLink httpLink = HttpLink("https://graphql-pokemon2.vercel.app/",
      );

  GraphQLClient clientToQuery() =>
      GraphQLClient(link: httpLink, cache: GraphQLCache());
}

void main() {
  runApp(const MyApp());
}

//create dumb widget
class MyApp extends StatelessWidget {
  const MyApp ({ Key? key}) : super(key:key);
  
  //container like a div in html
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("Pokemon App"),
        ),
        body: ListView( //to scroll
          scrollDirection: Axis.vertical,
          children: const[
            Text('List of Pokemons'),
            Icon(Icons.person),
            Icon(Icons.backpack),
          ],
        ),
      ),
    );
  }

  Query(
      options: QueryOptions(
        document: gql(r'''
          query {
            pokemons(first:10000) {
              id
              name
            }
            pokemon(name: "Ivysaur") {
              id
              name
              types 
              image
            }
          }
        '''),
      ),

  
}



