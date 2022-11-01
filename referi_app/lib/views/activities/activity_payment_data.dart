import 'package:flutter/material.dart';

import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import 'package:sizer/sizer.dart';

class ActivityPaymentData extends StatelessWidget {
  const ActivityPaymentData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Datos de pago"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[_CreditCard()],
    );
  }
}

class _CreditCard extends StatelessWidget {
  const _CreditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
      sliver: SliverToBoxAdapter(
          child: CreditCardWidget(
        cardNumber: "1234 1234 1234 1234",
        obscureCardNumber: false,
        //
        labelExpiredDate: "Vto",
        expiryDate: "MM/YY",
        //
        labelCardHolder: "Nombre del titular",
        cardHolderName: "APELLIDO Y NOMBRE",
        isHolderNameVisible: true,
        //
        cvvCode: "",
        obscureCardCvv: true,
        //
        showBackView: false,
        onCreditCardWidgetChange: (CreditCardBrand brand) {},
      )),
    );
  }
}
