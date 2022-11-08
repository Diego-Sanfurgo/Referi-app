import 'package:flutter/material.dart';

import 'package:referi_app/widgets/forms/textfields.dart';
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
      slivers: <Widget>[
        _CreditCard(),
        _CardForm(),
        _ActionBtn(),
      ],
    );
  }
}

class _CreditCard extends StatelessWidget {
  const _CreditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      //El widget ya viene con un padding de 16 implementado
      padding: const EdgeInsets.only(bottom: 32),
      sliver: SliverToBoxAdapter(
          child: CreditCardWidget(
        cardNumber: "1234 1234 1234 1234",
        obscureCardNumber: true,
        //
        labelExpiredDate: "Vto",
        expiryDate: "MM/AA",
        //
        labelCardHolder: "Nombre del titular",
        cardHolderName: "APELLIDO Y NOMBRE",
        isHolderNameVisible: true,
        //
        cvvCode: "asds",
        obscureCardCvv: true,
        //
        showBackView: false,
        //
        width: 100.w,
        onCreditCardWidgetChange: (CreditCardBrand brand) {},
      )),
    );
  }
}

class _CardForm extends StatelessWidget {
  const _CardForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
        child: Form(
          child: Column(
            children: [
              const NumberTextField(true,
                  label: "Número de tarjeta", maxLength: 16),
              const NameTextField(true, label: "Nombre del titular"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40.w,
                    child: const NumberTextField(
                      true,
                      label: "Fecha de vencimiento",
                      maxLength: 4,
                    ),
                    // child: TextFormField(
                    //   maxLength: 4,
                    //   decoration: InputDecoration(
                    //     hintText: 'MM/AA',
                    //     labelText: 'Fecha de vencimiento',
                    //   ),
                    //   inputFormatters: [],
                    // ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                      width: 40.w,
                      child: const NumberTextField(true,
                          label: "CVV", maxLength: 3)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  const _ActionBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
        child: ElevatedButton(onPressed: () {}, child: const Text("PAGAR")),
      ),
    );
  }
}
