import 'package:consume/models/pokedex.model.dart';
import 'package:consume/repositories/user.repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PokedexRepository repository = PokedexRepository();
    return Scaffold(
      appBar: AppBar(
        title: Text("Make Up"),
        centerTitle: true,
      ),
      body: Container(
          child: FutureBuilder(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Pokedex pokedex = snapshot.data;
            return ListView.builder(
              itemCount: pokedex.pokemon.length,
              itemBuilder: (context, index) {
                var pokemon = pokedex.pokemon[index];
                return Container(
                  child: ListTile(
                    title: Text(pokemon.name),
                    subtitle: pokemon.type.first != pokemon.type.last
                        ? Text("${pokemon.type.first}/${pokemon.type.last}")
                        : Text("${pokemon.type.first}"),
                    leading: Image.network(
                      pokemon.img,
                      scale: 1,
                    ),
                  ),
                );
              },
            );
          } else {
            return Container(
              child: Center(
                child: Text("Not found"),
              ),
            );
          }
        },
      )),
    );
  }
}
