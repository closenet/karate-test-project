@session @dev

Feature: Functional valid prospect to customer tests for the Session Service APIs/endpoints
  As the owners of the Session Service Stubs
  We want to ensure the endpoints we are exposing to other services return the expected data
  In order to ensure service contracts are met

  Background:
    * url sessionServiceUrlBase
    * def randomUuidGenerator = read('classpath:helpers/randomUuidGenerator.js')

  @e02 @d03 @TDM @e05
  Scenario: Sending two requests having same SessionId, first prospect and second as customer partyId, should be converted and retain using pc transaction Refs
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country": "IRL",
        "userRoles": []
      }
    """
    When method PUT
    Then status 201
    And path '/sessions/'+ randomUuid +'/domains/trading'
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.uuid == '#(randomUuid)'
    And match response.userRoles == []
    And match response.backend == 'helix'
    And match response.country == 'IRL'
    And match response.journeyContext == 'ROSE_MIG_LFL'
    * def expectedProspectTransactionId = response.transactionId
    * def expectedUuid = response.uuid
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
       "domain":"trading",
       "uuid":"#(expectedUuid)",
        "partyId": "#(generatedSkyId.partyId)",
        "authToken":"valid_sso_token",
        "userRoles": ["primary"]

      }
    """
    When method PUT
    Then status 201
    And path '/sessions/'+ randomUuid +'/domains/trading'
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And assert expectedProspectTransactionId != response.transactionId
    And assert expectedUuid == response.uuid
    And match response.backend == 'helix'
    And match response.userRoles == ["primary"]
    And match response.journeyContext == 'ROSE_MIG_LFL'
    Given path '/sessions/' + randomUuid + '/domains/trading/'
    And header Authorization = sessionAuthToken
    And method DELETE
    Then status 200
    And match response == ''

  @e02 @d03 @TDM @e05
  Scenario: Sending two requests having same SessionId, first prospect and second as customer account no, should be converted and retain using pc transaction Refs
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country": "IRL"
      }
    """
    When method PUT
    Then status 201
    And path '/sessions/'+ randomUuid +'/domains/trading'
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.uuid == '#(randomUuid)'
    And match response.backend == 'helix'
    And match response.country == 'IRL'
    And match response.journeyContext == 'ROSE_MIG_LFL'
    * def expectedProspectTransactionId = response.transactionId
    * def expectedSessionId = response.sessionId
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
    And path '/sessions/'+ randomUuid +'/domains/trading'
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And assert expectedProspectTransactionId != response.transactionId
    And assert expectedSessionId == response.sessionId
    And match response.backend == 'helix'
    And match response.journeyContext == 'ROSE_MIG_LFL'
    And match response.accountNumber == '#(generatedSkyId.accountNumber)'
    Given path '/sessions/' + randomUuid + '/domains/trading/'
    And header Authorization = sessionAuthToken
    And method DELETE
    Then status 200
    And match response == ''

  @e02 @d03 @TDM @e05
  Scenario: When requesting sessionId created as prospect and converted to customer then gets sessionId
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country": "IRL"
      }
    """
    When method PUT
    Then status 201
    And path '/sessions/'+ randomUuid +'/domains/trading'
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And match response.uuid == '#(randomUuid)'
    And match response.backend == 'helix'
    And match response.country == 'IRL'
    * def expectedProspectTransactionId = response.transactionId
    * def expectedUuid = response.uuid
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
       "domain":"trading",
       "uuid":"#(randomUuid)",
        "accountNumber": "#(generatedSkyId.accountNumber)",
        "prospectTransactionId": "#(expectedProspectTransactionId)",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status 201
    And path '/sessions/'+ randomUuid +'/domains/trading'
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And assert expectedProspectTransactionId != response.transactionId
    And assert expectedUuid == response.uuid
    And match response.backend == 'helix'
    And match response.accountNumber == '#(generatedSkyId.accountNumber)'
    Given path '/sessions/' + expectedUuid + '/domains/trading'
    And header Authorization = sessionAuthToken
    And method GET
    And status 200
    And assert expectedUuid == response.uuid
    Given path '/sessions/' + randomUuid + '/domains/trading/'
    And header Authorization = sessionAuthToken
    And method DELETE
    Then status 200
    And match response == ''