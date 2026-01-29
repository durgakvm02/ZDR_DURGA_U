@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'UNMANAGED BOOKING VIEW'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZDR_I_BOOKING_U
  as select from /dmo/booking as Booking
  association to parent ZDR_I_TRAVEL_U as _travel
    on $projection.TravelId = _travel.TravelId
  association [1..1] to /DMO/I_Carrier as _CARRIER
  on $projection.AirlineId = _CARRIER.AirlineID
  association [1..1] to /DMO/I_Customer   as _Customer
    on $projection.CustomerId = _Customer.CustomerID
  association [1..1] to /DMO/I_Connection as _CONNECTION
    on $projection.ConnectionId = _CONNECTION.ConnectionID
{
  key Booking.travel_id      as TravelId,
  key Booking.booking_id     as BookingId,
      Booking.booking_date   as BookingDate,
      Booking.customer_id    as CustomerId,
      Booking.carrier_id     as AirlineId,
      Booking.connection_id  as ConnectionId,
      Booking.flight_date    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Booking.flight_price   as FlightPrice,
      Booking.currency_code  as CurrencyCode,
      _travel,
      _CARRIER,
      _Customer,
      _CONNECTION
}
