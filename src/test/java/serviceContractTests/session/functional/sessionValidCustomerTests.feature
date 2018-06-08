@session @dev

Feature: Functional valid customer tests for the Session Service APIs/endpoints
  As the owners of the Session Service Stubs
  We want to ensure the endpoints we are exposing to other services return the expected data
  In order to ensure service contracts are met

  Background:
    * url sessionServiceUrlBase
    * def randomUuidGenerator = read('classpath:helpers/randomUuidGenerator.js')

  @e02 @d03 @TDM @e05
  Scenario: Return Interaction Ref for Customer, specified by Account Number & Country
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
        "userRoles": ["primary"]
      }
    """
    When method PUT
    Then status 201
    # check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
        # new structure
    And match response.user.userRoles == ["primary"]
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'

  @e02 @d03 @TDM @e05
  Scenario: Return Interaction Ref for Customer, specified by PartyId & Country
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "partyId":"#(generatedSkyId.partyId)",
        "authToken":"valid_sso_token",
        "userRoles": ["secondary"]
      }
    """
    When method PUT
    Then status 201
   # check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    # new structure
    And match response.user.userRoles == ["secondary"]
    And match response.transaction.customerType == 'existing'
    And match response !contains { accountNumber: '#notnull' }
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'

  @e02 @d03 @TDM @e05
  Scenario: Return Interaction Ref for Customer, specified by Account Number
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
        "userRoles": ["secondaryAuthorised"]
      }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    # new structure
    And match response.user.userRoles == ["secondaryAuthorised"]
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'

  @e02 @d03 @TDM @e05
  Scenario: Return Interaction Ref for Customer, specified by PartyId
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "partyId":"#(generatedSkyId.partyId)",
        "authToken":"valid_sso_token",
        "userRoles": null
       }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
        # new structure
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'

  @e02 @d03 @TDM @e05
  Scenario: When requesting sessionId created using account Number
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "accountNumber": "#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'
    * def expectedTransactionId = response.transactionId
    * def expectedUuid = response.uuid
    Given path '/sessions/' + expectedUuid + '/domains/trading'
    And header Authorization = sessionAuthToken
    And method GET
    And status 200
    And assert expectedUuid == response.uuid
    And match response.backend == 'helix'
    Given path '/sessions/' + expectedUuid + '/domains/trading'
    And header Authorization = sessionAuthToken
    And method DELETE
    Then status 200
    And match response == ''

  @limathree127 @e02 @d03 @TDM @e05
  Scenario: Valid Request if multiple customer identifiers provided
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "partyId":"#(generatedSkyId.partyId)",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'

  @limathree127 @e02 @d03 @TDM @e05
  Scenario: Valid Request if country & multiple customer identifiers provided
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "partyId":"#(generatedSkyId.partyId)",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'

  @e02 @d03 @TDM @e05
  Scenario: Valid put request, followed by mismtached partyId request, must not invalidate initial session
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "partyId":"#(generatedSkyId.partyId)",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
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
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'

  @limathree369 @e02 @d03 @TDM @e05
  Scenario: Valid put request by partyId, followed by request by account number, must return partyId
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "uuid":"#(randomUuid)",
        "domain":"trading",
        "country":"GBR",
        "partyId":"#(generatedSkyId.partyId)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.uuid == '#(randomUuid)'
    And match response.transactionId == '#uuid'
    * def salTransactionId = response.transactionId
    And match response.partyId == "#(generatedSkyId.partyId)"
    And match response !contains { accountNumber: '#notnull' }
    And match response.backend == 'helix'
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    And status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.uuid == '#(randomUuid)'
    And match response !contains { transactionId: '#(salTransactionId)' }
    And match response.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.partyId == '#(generatedSkyId.partyId)'
    And match response.backend == 'helix'

  @limathree369 @e02 @d03 @TDM @e05
  Scenario: Two identical sessions, requested with partyId must not regenerate transactionId
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    * def randomUuid = call randomUuidGenerator
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    * def salTransactionId = response.transactionId
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    And status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#(salTransactionId)'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'

  @e02 @d03 @TDM @e05
  Scenario: Valid put request by accountNumber, followed by request by partyId, must return accountNumber
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "authToken":"valid_sso_token",
        "partyId":"#(generatedSkyId.partyId)"
      }
    """
    When method PUT
    And status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.uuid == '#(randomUuid)'
    And match response.transactionId == '#uuid'
    And match response.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.partyId == '#(generatedSkyId.partyId)'
    And match response.backend == 'helix'

  @limathree414 @e02 @d03 @TDM @e05
  Scenario: Can create a valid session when specifying any journeyContext
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    * def randomUuid = call randomUuidGenerator
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
        "journeyContext":"test_journey_context"
      }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'test_journey_context'

  @limathree414 @e02 @d03 @TDM @e05
  Scenario: A subsequent session call with only the journeyContext different to the initial request, should generate a new interaction
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
        "journeyContext":"test_journey_context"
      }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    * def transactionIdOne = response.transaction.reference
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'test_journey_context'
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
        "journeyContext":"test_journey_context2"
      }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.reference != '#(transactionIdOne)'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'test_journey_context2'

  @limathree414 @e02 @d03 @TDM @e05
  Scenario: A subsequent session call with only the journeyContext different (set by default) to the initial request, should generate a new interaction
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
       "journeyContext":"test_journey_context"
      }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    * def transactionIdOne = response.transaction.reference
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'test_journey_context'
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
       }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.reference != '#(transactionIdOne)'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'

  @limathree414 @e02 @d03 @TDM @e05
  Scenario: A subsequent session call with only the journeyContext different to the initial request, should generate a new interaction
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
              }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    * def transactionIdOne = response.transaction.reference
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
        "journeyContext":"test_journey_context"
       }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.reference != '#(transactionIdOne)'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'test_journey_context'

  @limathree414 @e02 @d03 @TDM @e05
  Scenario: The same session request twice, will not generate a new session interaction
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
              }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    * def transactionIdOne = response.transaction.reference
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
         "journeyContext":"ROSE_MIG_LFL"
       }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.user == {}
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'

  @e02 @failingTDM @e02 @d03 @TDM @e05
  Scenario: Can create an interaction under catalogue MOBILE if preactive mobile customer under default domain
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'MOBILE_IV_INACTIVE',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
        "catalogue":"MOBILE",
        "channel":"ONLINE",
        "userRoles": ["primary"]
      }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    # new structure
    And match response.user.userRoles == ["primary"]
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.provider == 'helix'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'MOBILE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'

  @e02 @failingTDM @e02 @d03 @TDM @e05
  Scenario: Can create an interaction under catalogue MOBILE if active mobile customer under default domain
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'MOBILE_IV_ACTIVE',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
        "catalogue":"MOBILE",
        "channel":"ONLINE",
        "userRoles": ["primary"]
      }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    # new structure
    And match response.user.userRoles == ["primary"]
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.provider == 'helix'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'MOBILE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'

  @failingTDM @e02 @d03 @TDM @e05
  Scenario: Can create an interaction under catalogue MOBILE if preactive mobile customer under MOBILE domain
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'MOBILE_IV_INACTIVE',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"mobile",
        "uuid":"#(randomUuid)",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
        "catalogue":"MOBILE",
        "channel":"ONLINE",
        "userRoles": ["primary"],
        "domain":"mobile"
      }
    """
    When method PUT
    Then status 201
    # check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    # new structure
    And match response.user.userRoles == ["primary"]
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'MOBILE'
    And match response.transaction.channel == 'ONLINE'

  @failingTDM @e02 @d03 @TDM @e05
  Scenario: Can create an interaction under catalogue MOBILE if active mobile customer under mobile domain
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'MOBILE_IV_ACTIVE',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"mobile",
        "uuid":"#(randomUuid)",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
        "catalogue":"MOBILE",
        "channel":"ONLINE",
        "domain":"mobile",
        "userRoles": ["primary"]
      }
    """
    When method PUT
    Then status 201
    # check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
    # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    # new structure
    And match response.user.userRoles == ["primary"]
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'MOBILE'
    And match response.transaction.channel == 'ONLINE'

  @failingTDM @e02 @d03 @TDM @e05
  Scenario: Two interactions with same sessionId but different domains do not clash
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'MOBILE_IV_ACTIVE',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "uuid":"#(randomUuid)",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
        "catalogue":"MOBILE",
        "channel":"ONLINE",
        "domain":"mobile",
        "userRoles": ["primary"]
      }
    """
    When method PUT
    Then status 201
       # check and store the generated sessionId
    * def sessionGeneratedId1 = response.sessionId
    And match sessionGeneratedId1 == '#uuid'
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "uuid":"#(randomUuid)",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
        "catalogue":"MOBILE",
        "channel":"ONLINE",
        "domain":"trading",
        "userRoles": ["primary"]
      }
    """
    When method PUT
    Then status 201
   # check and store the generated sessionId
    * def sessionGeneratedId2 = response.sessionId
    And match sessionGeneratedId2 == '#uuid'
    # get session via the generated sessionId1
    And path '/sessions/'+ sessionGeneratedId1
    And header Authorization = sessionAuthToken
    And method get
    And status 200
  # new structure
    And match response.user.userRoles == ["primary"]
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'MOBILE'
    And match response.transaction.channel == 'ONLINE'
    * def tradingInteractionRef = response.transaction.reference
    # get session via the generated sessionId2
    And path '/sessions/'+ sessionGeneratedId2
    And header Authorization = sessionAuthToken
    And method get
    And status 200
  # new structure
    And match response.user.userRoles == ["primary"]
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'MOBILE'
    And match response.transaction.channel == 'ONLINE'
    * def mobileInteractionRef = response.transaction.reference
    And match tradingInteractionRef != mobileInteractionRef

  @failingTDM @e02 @d03 @TDM @e05
  Scenario: Updating interest source should not create a new interaction ref
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'MOBILE_IV_ACTIVE',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "uuid":"#(randomUuid)",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
        "catalogue":"MOBILE",
        "channel":"ONLINE",
        "domain":"mobile",
        "userRoles": ["primary"]
      }
    """
    When method PUT
    Then status 201
    And path '/sessions/'+ randomUuid +'/domains/mobile'
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    * def mobileInteractionRef = response.transaction.reference
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "uuid":"#(randomUuid)",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
        "catalogue":"MOBILE",
        "channel":"ONLINE",
        "domain":"mobile",
        "userRoles": ["primary"],
        "interestSource": '654321'
      }
    """
    When method PUT
    Then status 201
    And path '/sessions/'+ randomUuid +'/domains/mobile'
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    * def mobileInteractionRef2 = response.transaction.reference
    And match mobileInteractionRef == mobileInteractionRef2
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "uuid":"#(randomUuid)",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
        "catalogue":"MOBILE",
        "channel":"ONLINE",
        "domain":"mobile",
        "userRoles": ["primary"]
      }
    """
    When method PUT
    Then status 201
    And path '/sessions/'+ randomUuid +'/domains/mobile'
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    * def mobileInteractionRef3 = response.transaction.reference
    And match mobileInteractionRef2 == mobileInteractionRef3

  @e02 @d03 @TDM @e05 @bob
  Scenario: Ensure if blank offerURN is passed, the offerURN is not visible in the session object
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
        "userRoles": ["primary"],
        "offerUrn":""
      }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
# get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    # new structure
    And match response.user.userRoles == ["primary"]
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'
    And match response.transaction contains {offerType: '##notpresent'}
    And match response.transaction contains {offerCode: '##notpresent'}

    # URN HAS BEEN USED!!!
  @e05 @failinge05
  Scenario: Ensure if valid offerURN is passed, the offerURN is visible in the session object
    * def randomUuid = call randomUuidGenerator
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country":"GBR",
        "accountNumber":"#(urnCustomer)",
        "authToken":"valid_sso_token",
        "userRoles": ["primary"],
        "offerUrn":"TGUP00X0L01W"
      }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'
# get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    # new structure
    And match response.user.userRoles == ["primary"]
    And match response.customer.accountNumber == '#(urnCustomer)'

    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'
    And match response.transaction.offerType == 'URN'
    And match response.transaction.offerCode == 'TGUP00X0L01W'

  @e02
  Scenario: Allow transaction to be deleted and allow multiple versions to fetch a session
  ## POST New Session and store the generated SessionId
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "accountNumber": "#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 201
# check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
    And match sessionGeneratedId == '#uuid'

  ## new GET session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    * def sessionResponseNewGETMethod = response

  ## Check the contents of the session get, should contain transaction detail
    And match response.user == {}
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'
    And match response.transaction.customerType == 'existing'

   ## DELETE transaction via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId + '/transaction'
    And header Authorization = sessionAuthToken
    And method DELETE
    And status 200

  ## new GET session via the generated sessionId
  ## Check transaction section doesn't exist
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response != sessionResponseNewGETMethod

  ## Check the contents of the session get, should not contain transaction detail
    And match response.user == {}
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'



