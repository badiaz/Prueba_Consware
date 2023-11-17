class CreditType {
  final String name;
  final double interestRate;

  CreditType(this.name, this.interestRate);
}

final List<CreditType> creditTypes = [
  CreditType('Crédito de vehículo', 0.03),
  CreditType('Crédito de vivienda', 0.01),
  CreditType('Crédito de libre inversión', 0.035),
];
