import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '/models/dto/organization_dto.dart';
import '/controllers/navigation_controller.dart';

class ClubCard extends StatelessWidget {
  final DTOOrganization organization;
  final String heroKey;
  const ClubCard(this.organization, {Key? key, required this.heroKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final Widget imageLogo;
    try {
      imageLogo = Image.network(
        organization.logo!,
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) => Image.asset(
            "assets/images/no_image_placeholder.png",
            fit: BoxFit.fill),
      );
    } catch (e) {
      imageLogo = Image.asset("assets/images/no_image_placeholder.png",
          fit: BoxFit.fill);
    }

    // Map<String, dynamic> mapToPass = {
    //   "org": organization,
    //   "tag": heroKey,
    // };

    return Container(
      width: double.infinity,
      height: 30.h,
      margin: const EdgeInsets.only(top: 16),
      child: InkWell(
        onTap: () => NavigationController.goToWithArguments(Routes.clubDetail,
            args: organization),
        borderRadius: BorderRadius.circular(15),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.black)),
          clipBehavior: Clip.antiAlias,
          elevation: 10,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Hero(tag: heroKey, child: imageLogo),
              _ClubInfoTile(organization: organization)
            ],
          ),
        ),
      ),
    );
  }
}

class _ClubInfoTile extends StatelessWidget {
  const _ClubInfoTile({
    Key? key,
    required this.organization,
  }) : super(key: key);

  final DTOOrganization organization;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: const Color.fromRGBO(0, 0, 0, 0.7),
        height: 10.h,
        width: double.infinity,
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          title: Text(
            organization.nombre!,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            "${organization.direccion!.calle} ${organization.direccion!.numero}",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
