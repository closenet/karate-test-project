@session @dev

Feature: Functional internal Error tests for the Session Service APIs/endpoints
  As the owners of the Session Service Stubs
  We want to ensure the endpoints we are exposing to other services return the expected data
  In order to ensure service contracts are met

  Background:
    * url sessionServiceUrlBase
    * def randomUuidGenerator = read('classpath:helpers/randomUuidGenerator.js')

  @e02 @d03 @TDM @e05 @failingTDM
  Scenario: Bad Request if no sessionID provided
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain": "trading",
        "country":"GBR"
      }
    """
    When method PUT
    Then status 400
    And match response.errors[0].code == 'missing.field.uuid'
    And match response.errors[0].message == 'Must provide a uuid'

  @e02 @d03 @TDM @e05 @failingTDM
  Scenario: Bad Request if no sessionID provided
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain": "trading",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 400
    And match response.errors[0].code == 'missing.field.uuid'
    And match response.errors[0].message == 'Must provide a uuid'

  @e02 @d03 @TDM @e05 @failingTDM
  Scenario: Bad Request if no sessionID provided
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain": "trading",
        "partyId":"#(generatedSkyId.partyId)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 400
    And match response.errors[0].code == 'missing.field.uuid'
    And match response.errors[0].message == 'Must provide a uuid'

  @e02 @d03 @TDM @e05
  Scenario: Bad Request if no country or customerIdentifier provided
    * def randomUuid = call randomUuidGenerator
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain": "trading",
        "uuid":"#(randomUuid)",
      }
    """
    When method PUT
    Then status 400
    And match response.errors[0].code == 'must.supply.one.identifier'
    And match response.errors[0].message == 'Must supply customer identifier or country code'

  @e02 @d03 @TDM @e05 @failingTDM
  Scenario: Return Error where Customer not found, specified by Account Number & Country
    * def randomUuid = call randomUuidGenerator
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain": "trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "accountNumber":"#(invalid_account_number)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 500
    And match response.errors[0].code == 'transaction.customer.not.found'
    And match response.errors[0].message == 'Customer not found.'


  @e02 @d03 @TDM @e05 @failingTDM
  Scenario: Return Error where Customer not found, specified by PartyId & Country
    * def randomUuid = call randomUuidGenerator
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain": "trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "partyId":"#(invalid_party_id)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 500
    And match response.errors[0].code == 'transaction.customer.not.found'
    And match response.errors[0].message == 'Customer not found.'


  @e02 @d03 @TDM @e05 @failingTDM
  Scenario: Return Error where Customer not found, specified by Account Number
    * def randomUuid = call randomUuidGenerator
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain": "trading",
        "uuid":"#(randomUuid)",
        "accountNumber":"#(invalid_account_number)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 500
    And match response.errors[0].code == 'transaction.customer.not.found'
    And match response.errors[0].message == 'Customer not found.'


  @e02 @d03 @TDM @e05 @failingTDM
  Scenario: Return Error where Customer not found, specified by PartyId
    * def randomUuid = call randomUuidGenerator
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain": "trading",
        "uuid":"#(randomUuid)",
        "partyId":"#(invalid_party_id)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 500
    And match response.errors[0].code == 'transaction.customer.not.found'
    And match response.errors[0].message == 'Customer not found.'

  @e02 @d03 @TDM @e05
  Scenario: map-post-session-errorNoSSOTokenGetCustInteractionAccountNo
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain": "trading",
        "uuid":"#(randomUuid)",
        "accountNumber":"#(generatedSkyId.accountNumber)"
      }
    """
    When method PUT
    Then status 400
    And match response.errors[0].code == 'missing.field.authtoken'
    And match response.errors[0].message == 'Must provide an authentication token for existing customers'

  @e02 @d03 @TDM @e05  @failinge05 @failingTDM @failingd03
  Scenario: map-post-session-errorNoSSOTokenGetCustInteractionPartyId
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain": "trading",
        "uuid":"#(randomUuid)",
        "partyId":"#(generatedSkyId.partyId)"
      }
    """
    When method PUT
    Then status 400
    And match response.errors[0].code == 'missing.field.authtoken'
    And match response.errors[0].message == 'Must provide an authentication token for existing customers'

  @limathree145 @e02 @d03 @TDM @e05
  Scenario: Basic Auth Credentials must be supplied for POST
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}
    Given path '/sessions'
    And header Authorization = 'test'
    And request
    """
      {
        "domain": "trading",
        "uuid":"#(randomUuid)",
        "accountNumber": "#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 401
    And match response.errors[0].code == "unauthorized"
    And match response.errors[0].message == "Not authorized"

  @limathree145 @e02 @d03 @TDM @e05
  Scenario: Basic Auth Credentials must be supplied for GET
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain": "trading",
        "uuid":"#(randomUuid)",
        "accountNumber": "#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 201
    And path '/sessions/'+ randomUuid +'/domains/trading'
    And method get
    Then status 401
    And match response.errors[0].code == "unauthorized"
    And match response.errors[0].message == "Not authorized"

  @limathree145 @e02 @d03 @TDM @e05
  Scenario: Basic Auth Credentials must be supplied for DELETE
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain": "trading",
        "uuid":"#(randomUuid)",
        "accountNumber": "#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 201
    And path '/sessions/'+ randomUuid +'/domains/trading'
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.uuid == '#(randomUuid)'
    * def expectedTransactionId = response.transactionId
    * def expectedUuid = response.uuid
    Given path '/sessions/' + expectedUuid + '/domains/trading'
    And header Authorization = sessionAuthToken
    And method GET
    And status 200
    And assert expectedUuid == response.uuid
    Given path '/sessions/' + randomUuid + '/domains/trading'
    And method DELETE
    Then status 401
    And match response.errors[0].code == "unauthorized"
    And match response.errors[0].message == "Not authorized"

  @limathree145 @e02 @d03 @TDM @e05
  Scenario: Basic Auth Credentials must be valid for POST
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}
    Given path '/sessions'
    And header Authorization = 'invalid'
    And request
    """
      {
        "domain": "trading",
        "uuid":"#(randomUuid)",
        "accountNumber": "#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 401
    And match response.errors[0].code == "unauthorized"
    And match response.errors[0].message == "Not authorized"

  @limathree145 @e02 @d03 @TDM @e05
  Scenario: Basic Auth Credentials must be valid for GET
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain": "trading",
        "uuid":"#(randomUuid)",
        "accountNumber": "#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 201
    And path '/sessions/'+ randomUuid +'/domains/trading'
    And header Authorization = 'invalid'
    And method get
    Then status 401
    And match response.errors[0].code == "unauthorized"
    And match response.errors[0].message == "Not authorized"

  @limathree145 @e02 @d03 @TDM @e05
  Scenario: Basic Auth Credentials must be valid for DELETE
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain": "trading",
        "uuid":"#(randomUuid)",
        "accountNumber": "#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 201
    And path '/sessions/'+ randomUuid +'/domains/trading'
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.uuid == '#(randomUuid)'
    * def expectedTransactionId = response.transactionId
    * def expectedUuid = response.uuid
    Given path '/sessions/' + expectedUuid + '/domains/trading'
    And header Authorization = sessionAuthToken
    And method GET
    And status 200
    And assert expectedUuid == response.uuid
    Given path '/sessions/' + randomUuid + '/domains/trading'
    And header Authorization = 'invalid'
    And method DELETE
    Then status 401
    And match response.errors[0].code == "unauthorized"
    And match response.errors[0].message == "Not authorized"

  @e02 @d03 @TDM @e05
  Scenario: Throw error if multiple identifiers sent and one identifier is not found
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain": "trading",
        "uuid":"#(randomUuid)",
        "partyId":"#(invalid_party_id)",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 400
    And match response.errors[0].code == "mismatch.partyid"
    And match response.errors[0].message == "Customer partyId mismatch between session and transaction"

  @e02 @d03 @TDM @e05 @failingTDM
  Scenario: Throw error if multiple identifiers sent and one identifier is not found
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain": "trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "partyId":"#(generatedSkyId.partyId)",
        "accountNumber":"#(invalid_account_number)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 500
    And match response.errors[0].code == 'transaction.customer.not.found'
    And match response.errors[0].message == "Customer not found."

  @e02 @d03 @TDM @e05
  Scenario: Reject property creation, if supplied sessionId doesn't exist
    * def randomUuid = call randomUuidGenerator
    * def propertyData =
      """
          "test"
      """
    Given path '/sessions/'+ randomUuid + '/domains/trading/properties'
    And header Authorization = sessionAuthToken
    And request
    """
      {
          "properties": [{
              "key": "testkey",
              "value": "#(propertyData)"
               }]
      }
    """
    When method PUT
    Then status 400
    And match $.errors.[*]message == ["Properties cannot be created without a session."]
    And match $.errors.[*]code == ["save.properties.failed"]

  @e02 @d03 @TDM @e05
  Scenario: Reject property creation, if value is null
    * def randomUuid = call randomUuidGenerator
    * def propertyData =
      """
          "test"
      """
    Given path '/sessions/'+ randomUuid + '/domains/trading/properties'
    And header Authorization = sessionAuthToken
    And request
    """
      {
          "properties": [{
              "key": "testkey",
              "value": null
               }]
      }
    """
    When method PUT
    Then status 400
    And match $.errors.[*]message == ["Value must be provided"]
    And match $.errors.[*]code == ["invalid.property.provided"]

  @e02 @d03 @TDM @e05
  Scenario: Reject property creation, if value isn't present
    * def randomUuid = call randomUuidGenerator
    * def propertyData =
      """
          "test"
      """
    Given path '/sessions/'+ randomUuid + '/domains/trading/properties'
    And header Authorization = sessionAuthToken
    And request
    """
      {
          "properties": [{
              "key": "testkey"
               }]
      }
    """
    When method PUT
    Then status 400
    And match $.errors.[*]message == ["Value must be provided"]
    And match $.errors.[*]code == ["invalid.property.provided"]

  @e02 @d03 @TDM @e05
  Scenario: Reject property creation, if property key has dots in it
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
        """
          {
            "uuid":"#(randomUuid)",
            "domain" : "trading",
            "country":"GBR",
            "accountNumber":"#(generatedSkyId.accountNumber)",
            "authToken":"S1-valid_sso_token",
            "userRoles": ["primary"]
          }
        """
    When method PUT
    Then status 201
    * def propertyData =
          """
              "test1"
          """
    Given path '/sessions/'+ randomUuid + '/domains/trading/properties'
    And header Authorization = sessionAuthToken
    And request
        """
          {
                "properties": [{
                  "key": "test.key",
                  "value": "#(propertyData)"
                 }]
          }
        """
    When method PUT
    Then status 400
    And match $.errors.[*]message == ["Key must only contain alphanumeric characters, dashes and underscores"]
    And match $.errors.[*]code == ["invalid.property.provided"]


