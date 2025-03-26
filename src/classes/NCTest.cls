@isTest
private class NCTest {
  @isTest static void testWarmTemp() {
    Decimal celsius = NC.FahrenheitToCelsius(70);
    System.assertEquals(21.11,celsius);
  }
  @isTest static void testFreezingPoint() {
    Decimal celsius = NC.FahrenheitToCelsius(32);
    System.assertEquals(0,celsius);
  }
  @isTest static void testBoilingPoint() {
    Decimal celsius = NC.FahrenheitToCelsius(212);
    System.assertEquals(100,celsius,'Boiling point temperature is not expected.');
  }
  @isTest static void testNegativeTemp() {
    Decimal celsius = NC.FahrenheitToCelsius(-10);
    System.assertEquals(-23.33,celsius);
  }
}