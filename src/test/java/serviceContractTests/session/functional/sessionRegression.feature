@session @dev

Feature: Functional regression tests for the Session Service APIs/endpoints
  As the owners of the Session Service Stubs
  We want to ensure the endpoints we are exposing to other services return the expected data
  In order to ensure service contracts are met

  Background:
    * url sessionServiceUrlBase
    * def randomUuidGenerator = read('classpath:helpers/randomUuidGenerator.js')



  @e02 @d03 @TDM @e05
  Scenario: Check we still support retrieval by generatedSessionId & user provided randomUuid/domain when session created via PUT
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
    # old structure
    And match response.uuid == '#(randomUuid)'
    And match response.domain == 'trading'
    And match response.backend == 'helix'
    And match response.transactionId == '#uuid'
    And match response.userRoles == ["primary"]
    And match response.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.partyId == '#(generatedSkyId.partyId)'
    And match response.catalogue == 'TP_CORE'
    And match response.channel == 'ONLINE'
    And match response.journeyContext == 'ROSE_MIG_LFL'
  # new structure
    And match response.user.userRoles == ["primary"]
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'
    # get session via the client provided sessionId
    And path '/sessions/'+ randomUuid +'/domains/trading'
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    # old structure
    And match response.uuid == '#(randomUuid)'
    And match response.domain == 'trading'
    And match response.backend == 'helix'
    And match response.transactionId == '#uuid'
    And match response.userRoles == ["primary"]
    And match response.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.partyId == '#(generatedSkyId.partyId)'
    And match response.catalogue == 'TP_CORE'
    And match response.channel == 'ONLINE'
    And match response.journeyContext == 'ROSE_MIG_LFL'
  # new structure
    And match response.user.userRoles == ["primary"]
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'
    Given path '/sessions/' + randomUuid + '/domains/trading'
    And header Authorization = sessionAuthToken


  @e02 @d03 @TDM @e05
  Scenario: Check we still support retrieval by generatedSessionId & user provided randomUuid/domain when session created via POST
    * def randomUuid = call randomUuidGenerator
    * def generatedSkyId = call read('classpath:helpers/provisionCustomerSkyId.js') {dataPool:'HD_O',identifyOrConsume:'identify',skyId:'no',random:'yes'}

    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "uuid":"#(randomUuid)",
        "domain":"trading",
        "accountNumber":"#(generatedSkyId.accountNumber)",
        "authToken":"valid_sso_token",
        "userRoles": ["primary"]
      }
    """
    When method PUT
    Then status 201
      # check and store the generated sessionId
    * def sessionGeneratedId = response.sessionId
      # get session via the generated sessionId
    And path '/sessions/'+ sessionGeneratedId
    And header Authorization = sessionAuthToken
    And method get
    And status 200
      # old structure
    And match response.uuid == '#(randomUuid)'
    And match response.domain == 'trading'
    And match response.backend == 'helix'
    And match response.transactionId == '#uuid'
    And match response.userRoles == ["primary"]
    And match response.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.partyId == '#(generatedSkyId.partyId)'
    And match response.catalogue == 'TP_CORE'
    And match response.channel == 'ONLINE'
    And match response.journeyContext == 'ROSE_MIG_LFL'
    # new structure
    And match response.user.userRoles == ["primary"]
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'
      # get session via the client provided sessionId
    And path '/sessions/'+ randomUuid +'/domains/trading'
    And header Authorization = sessionAuthToken
    And method get
    And status 200
      # old structure
    And match response.uuid == '#(randomUuid)'
    And match response.domain == 'trading'
    And match response.backend == 'helix'
    And match response.transactionId == '#uuid'
    And match response.userRoles == ["primary"]
    And match response.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.partyId == '#(generatedSkyId.partyId)'
    And match response.catalogue == 'TP_CORE'
    And match response.channel == 'ONLINE'
    And match response.journeyContext == 'ROSE_MIG_LFL'
    # new structure
    And match response.user.userRoles == ["primary"]
    And match response.transaction.customerType == 'existing'
    And match response.customer.accountNumber == '#(generatedSkyId.accountNumber)'
    And match response.customer.partyId == '#(generatedSkyId.partyId)'
    And match response.transaction.provider == 'helix'
    And match response.transaction.customerType == 'existing'
    And match response.transaction.reference == '#uuid'
    And match response.transaction.catalogue == 'TP_CORE'
    And match response.transaction.channel == 'ONLINE'
    And match response.transaction.journeyContext == 'ROSE_MIG_LFL'


