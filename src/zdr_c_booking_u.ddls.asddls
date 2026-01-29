@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOOKING PROJECTION VIEW'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZDR_C_BOOKING_U
  as projection on ZDR_I_BOOKING_U
{
  key TravelId,

      @Search.defaultSearchElement: true
  key BookingId,

      BookingDate,


      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _Customer.LastName as CustomerName,

      @ObjectModel.text.element: [ 'CarrierName' ]
      AirlineId,
      _CARRIER.Name      as CarrierName,
      @Consumption.valueHelpDefinition: [{ entity: {
                                            name: '/DMO/I_Connection',
                                            element: 'ConnectionID'
                                        } }]

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'ConnectionId' ]
      ConnectionId,

      FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,

      /* Associations */
      _CARRIER,
      _CONNECTION,
      _Customer,
      _travel : redirected to parent ZDR_C_TRAVEL_U
}
