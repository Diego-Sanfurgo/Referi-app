import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/views/loadings/loading_screen.dart';
import '/theme/animations/activities_not_found.dart';

import 'bloc/credential_home_bloc.dart';
import 'widgets/credential_card.dart';

class CredentialHome extends StatelessWidget {
  const CredentialHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CredentialHomeBloc(),
      child: const _CredentialHomeView(),
    );
  }
}

class _CredentialHomeView extends StatelessWidget {
  const _CredentialHomeView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CredentialHomeBloc, CredentialHomeState>(
      builder: (context, state) {
        if (state is CredentialHomeInitial) {
          BlocProvider.of<CredentialHomeBloc>(context).add(FetchCredentials());
          return const Center(child: LoadingScreen("Cargando credenciales..."));
        } else if (state is CredentialHomeResults) {
          return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              itemCount: state.credentials.length,
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.black87),
              itemBuilder: ((context, index) {
                return CredentialCard(state.credentials[index]);
              }));
        } else {
          return const NotFoundAnimation();
        }
      },
    );
  }
}
