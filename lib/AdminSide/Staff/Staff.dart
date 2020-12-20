import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:MobilProject/App-Navigation-Loading/NavigationBarAdmin.dart';
import 'package:MobilProject/services/service_reqs.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Staff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NaavigationBarAdmin(),
      appBar: ApplicationBar(Colors.white, Color(0xff329D9C), "Staff",
          Color(0xff329D9C), RefreshButton()),
      body: FutureBuilder(
          future: ServiceReqs().getCrew(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {

              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) => CardItem(
                        snapshot.data[index].gender == "female" ? Colors.red : Colors.blue,
                        snapshot.data[index].gender == "female"
                            ? "Working for a customer"
                            : "Available now",
                        snapshot.data[index].name,
                        int.parse(snapshot.data[index].customerNum),
                        int.parse(snapshot.data[index].productNum),
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }

  RefreshButton() {
    return IconButton(
        icon: Icon(
          Icons.refresh,
          color: Color(0xff329D9C),
        ),
        onPressed: null);
  }

  CardItem(Color color, String Mission, String StaffName, int customerNum, int productNum) {
    return ExpansionTileCard(
      leading: AnimationTranstion.Avatar(
          "waiter", Colors.black, BoxFit.contain, 30, 30),
      title: Text(
        StaffName,
        style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        Mission,
        style: GoogleFonts.montserrat(color: color),
      ),
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Card(
                child: ListTile(
                  title: Text(
                    "Daily serviced customer number",
                    style: GoogleFonts.montserrat(
                      color: Colors.black87,
                    ),
                  ),
                  trailing: Text(
                    customerNum.toString(),
                    style: GoogleFonts.montserrat(color: Colors.green[900]),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Card(
                elevation: 5,
                shadowColor: Colors.black,
                child: ListTile(
                  title: Text(
                    "Daily prepared product number",
                    style: GoogleFonts.montserrat(
                      color: Colors.black87,
                    ),
                  ),
                  trailing: Text(
                    productNum.toString(),
                    style: GoogleFonts.montserrat(color: Colors.green[900]),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
