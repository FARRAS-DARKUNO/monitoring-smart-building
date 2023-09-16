import 'package:flutter/material.dart';
import 'package:itera_monitoring_ac/utils/route.dart';
import '../../global/colors.dart';
import '../../global/fonts.dart';
import '../../global/size.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 250,
          width: sWidthFull(context),
          child: Image.network(
            'https://picsum.photos/250?image=9',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: MediaQuery.of(context).viewPadding.top + 10,
          ),
          height: 250,
          width: sWidthFull(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(138, 0, 0, 0),
                Color.fromARGB(0, 0, 0, 0),
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => gotoBack(context),
                child: const CircleAvatar(
                  backgroundColor: cPremier,
                  child: Icon(Icons.arrow_back_ios_sharp, color: cWhite),
                ),
              ),
              SizedBox(
                width: sWidthFull(context) - 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Meeting Room A', style: h2(cWhite)),
                    Text('Gedung DPRD 3 ITERA', style: h5(cWhite))
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => openModal(context),
                child: const Icon(Icons.info_sharp, color: cTersier, size: 35),
              )
            ],
          ),
        )
      ],
    );
  }

  openModal(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 300,
          color: cWhite,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Information', style: h2(cPremier)),
                const SizedBox(height: 20),
                Text(
                  'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is availabl In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface',
                  style: h4(cBlack),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
