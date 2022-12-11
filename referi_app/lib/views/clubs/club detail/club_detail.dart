import 'package:flutter/material.dart';
import 'package:referi_app/models/dto/organization_dto.dart';

import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'bloc/club_detail_bloc.dart';
import '/theme/colors.dart' as colors;
import '/theme/animations/loading_animation.dart';
import '/theme/animations/activities_not_found.dart';

import 'widgets/extended_app_bar.dart';
import '/views/activities/activity_search/widgets/activities_list.dart';

class ClubDetail extends StatelessWidget {
  const ClubDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DTOOrganization org =
        ModalRoute.of(context)?.settings.arguments as DTOOrganization;
    return BlocProvider(
      create: (context) => ClubDetailBloc(),
      child: _ClubDetailView(org),
    );
  }
}

class _ClubDetailView extends StatelessWidget {
  final DTOOrganization org;
  const _ClubDetailView(this.org);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(org),
    );
  }
}

class _Body extends StatelessWidget {
  final DTOOrganization org;
  const _Body(this.org, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final String heroTag = map["tag"];
    // final Organization org = map["org"];

    return CustomScrollView(
      slivers: [
        ExtendedClubAppBar(org: org),
        SliverToBoxAdapter(
            child: ListTile(
          onTap: () {},
          leading: Icon(Icons.location_pin, color: colors.secondary),
          title: Text(
              "${org.direccion?.calle} ${org.direccion?.numero}, ${org.direccion?.ciudad}"),
          visualDensity: VisualDensity.compact,
        )),
        SliverToBoxAdapter(
            child: org.descripcion != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    child: Text(
                      org.descripcion as String,
                      textAlign: TextAlign.center,
                    ),
                  )
                : null),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: AutoSizeText(
              "Actividades del club",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
              maxFontSize: 26,
              minFontSize: 22,
            ),
          ),
        ),
        _ClubActivities(org)
      ],
    );
  }
}

class _ClubActivities extends StatelessWidget {
  final DTOOrganization org;
  const _ClubActivities(this.org, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var blocProvider = BlocProvider.of<ClubDetailBloc>(context);

    return SliverFillRemaining(
      child: BlocBuilder<ClubDetailBloc, ClubDetailState>(
        builder: (context, state) {
          if (state is ClubDetailInitial) {
            blocProvider.add(FetchClubActivities(org));
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [LoadingAnimation(size: 30.w)],
            );
          } else if (state is ActivitiesResult && state.list.isNotEmpty) {
            return ActivitiesList(state.list);
          } else {
            return const NotFoundAnimation();
          }
        },
      ),
    );
  }
}
