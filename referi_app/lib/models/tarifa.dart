class Tarifa {
  Tarifa({
    required this.id,
    required this.nombre,
    required this.monto,
    required this.esOpcional,

    // required this.fechaCreacion,
    required this.fechaActualizacion,
    // this.fechaBaja,
  });

  final String id;
  final String nombre;
  final int monto;
  final bool esOpcional;
  final DateTime fechaActualizacion;

  factory Tarifa.fromJson(Map<String, dynamic> json) => Tarifa(
        id: json["id"],
        nombre: json["nombre"],
        monto: json["monto"],
        esOpcional: json["esOpcional"],
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "monto": monto,
        "esOpcional": esOpcional,
      };
}
