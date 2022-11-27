class DTOActivityFeePayment {
  String? id;
  String? monto;
  String? periodoInicio;
  String? periodoFin;
  String? fechaVencimiento;
  String? fechaCreacion;
  String? fechaActualizacion;
  String? fechaBaja;
  //  TarifaPayment tarifa;
  String? pago;
  //  Inscripcion inscripcion;

  DTOActivityFeePayment({
    this.id,
    this.monto,
    this.periodoInicio,
    this.periodoFin,
    this.fechaVencimiento,
    this.fechaCreacion,
    this.fechaActualizacion,
    this.fechaBaja,
    // this.tarifa,
    this.pago,
    // this.inscripcion,
  });

  factory DTOActivityFeePayment.fromJson(Map<String, dynamic> json) =>
      DTOActivityFeePayment(
        id: json["id"],
        monto: json["monto"],
        periodoInicio: DateTime.parse(json["periodoInicio"]).toString(),
        periodoFin: DateTime.parse(json["periodoFin"]).toString(),
        fechaVencimiento: DateTime.parse(json["fechaVencimiento"]).toString(),
        fechaCreacion: DateTime.parse(json["fechaCreacion"]).toString(),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]).toString(),
        fechaBaja: json["fechaBaja"],
        // tarifa: TarifaPayment.fromJson(json["tarifa"]),
        pago: json["pago"],
        // inscripcion: Inscripcion.fromJson(json["inscripcion"]), 
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "monto": monto,
  //       "periodoInicio": periodoInicio.toIso8601String(),
  //       "periodoFin": periodoFin.toIso8601String(),
  //       "fechaVencimiento": fechaVencimiento.toIso8601String(),
  //       "fechaCreacion": fechaCreacion.toIso8601String(),
  //       "fechaActualizacion": fechaActualizacion.toIso8601String(),
  //       "fechaBaja": fechaBaja,
  //       // "tarifa": tarifa.toJson(),
  //       "pago": pago,
  //       // "inscripcion": inscripcion.toJson(),
  //     };
}
