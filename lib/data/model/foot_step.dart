class FootSteps {
  final String value;
  final String unit;
  final DateTime? dateFrom;
  final DateTime? dateTo;

  FootSteps(
      {this.value = "0",
      this.unit = "",
      this.dateFrom,
      this.dateTo});

  FootSteps copyWith(
      {String? value, String? unit, DateTime? dateFrom, DateTime? dateTo}) {
    return FootSteps(
        value: value ?? this.value,
        unit: unit ?? this.unit,
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo);
  }
}
