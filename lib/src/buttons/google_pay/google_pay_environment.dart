/// The Google Pay environment to target.
enum GooglePayEnvironment {
  /// Test environment for integration testing and verification.
  test('TEST'),

  /// Production environment for live transactions.
  production('PRODUCTION');

  const GooglePayEnvironment(this.value);

  /// The string identifier expected by the Google Pay SDK (`'TEST'` or `'PRODUCTION'`).
  final String value;
}
