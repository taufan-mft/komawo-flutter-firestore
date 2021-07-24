
import 'package:flutter/material.dart';
import 'package:komawo/ui/login/login_ui.dart';


class PackageCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final void Function() destination;
  const PackageCard({Key? key, this.title='', this.imageUrl='', required this.destination}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.5,
        child: InkWell(
          onTap: destination,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text(imageUrl, style: TextStyle(fontSize: 50),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
