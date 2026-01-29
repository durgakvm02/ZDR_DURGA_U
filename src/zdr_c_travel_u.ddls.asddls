@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TRAVEL PROJECTION VIEW'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZDR_C_TRAVEL_U
  provider contract transactional_query
  as projection on ZDR_I_TRAVEL_U
{
  key TravelId,
      @Consumption.valueHelpDefinition: [{ entity: {
                                                   name: '/DMO/I_AGENCY',
                                                   element: 'AgencyID'
                                               } }]
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyId,
      _Agency.Name             as AgencyName,
      @Consumption.valueHelpDefinition: [{ entity: {
                                            name: '/DMO/I_CUSTOMER',
                                            element: 'CustomerID'
                                        } }]
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _Customer.LastName       as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'currencycode'
      BookingFee,
      @Semantics.amount.currencyCode: 'currencycode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity: {
                                                  name: 'I_Currency',
                                                  element: 'Currency'
                                              } }]
      CurrencyCode,
      @UI.lineItem: [{ position: 50 }]
      @UI.identification: [{ position: 50 }]
      Description,
      @Consumption.valueHelpDefinition: [{
      entity: {
      name: '/DMO/I_Travel_Status_VH',
      element: 'TravelStatus'
      }
      }]
      @ObjectModel.text.element: ['StatusName']
      Status,
      _TravelStatus._Text.Text as StatusName : localized,
      //    Createdby,
      //    Createdat,
      //    Lastchangedby,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZDR_C_BOOKING_U,
      _Currency,
      _Customer,
      _TravelStatus
}
