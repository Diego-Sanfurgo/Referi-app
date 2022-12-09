class DTOAddress {
  String? id;
  String? calle;
  String? numero;
  String? ciudad;
  String? provincia;

  DTOAddress({
    this.id,
    this.calle,
    this.numero,
    this.ciudad,
    this.provincia,
  });

  factory DTOAddress.fromJson(Map<String, dynamic> json) => DTOAddress(
        id: json["id"],
        calle: json["calle"],
        numero: json["numero"]?.toString(),
        ciudad: json["ciudad"],
        provincia: json["provincia"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "calle": calle,
        "numero": numero,
        "ciudad": ciudad,
        "provincia": provincia,
      };
}
