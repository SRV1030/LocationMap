import 'package:flutter/material.dart';
import 'package:locmap/providers/great_places.dart';
import 'package:provider/provider.dart';
import 'package:locmap/screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List of Places"),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<GreatPlaces>(
                      child: const Text(
                          "NO places added yet"), //the part tha doesn't chage even id the data chages in builder as chld
                      builder: (ctx, greatplaces, chld) =>
                          greatplaces.items.length <= 0
                              ? chld
                              : ListView.builder(
                                  itemCount: greatplaces.items.length,
                                  itemBuilder: (ctx, i) => ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          FileImage(greatplaces.items[i].image),
                                    ),
                                    title: Text(greatplaces.items[i].title),
                                    onTap: () {
                                      //Detailpage
                                    },
                                  ),
                                ),
                    ),
        ));
  }
}
