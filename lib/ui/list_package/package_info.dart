import 'package:flutter/material.dart';

class PackageInfo extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String price;
  final VoidCallback destinationRead;
  final VoidCallback destinationOrder;

  const PackageInfo(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.destinationRead,
      required this.destinationOrder,
      required this.price
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child: Image.asset(
                    imageUrl,
                    height: 250,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                child: Text(
                  'Lorem ipsum dolor sit amet cobnsdjawds',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    price,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                child: Row(
                  children: [
                    TextButton(
                        onPressed: destinationRead, child: Text('Read More')),
                    TextButton(
                        onPressed: destinationOrder, child: Text('Order Now')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
