@session @dev

Feature: Functional valid prospect tests for the Session Service APIs/endpoints
  As the owners of the Session Service Stubs
  We want to ensure the endpoints we are exposing to other services return the expected data
  In order to ensure service contracts are met

  Background:
    * url sessionServiceUrlBase
    * def randomUuidGenerator = read('classpath:helpers/randomUuidGenerator.js')


  @e02 @d03 @TDM @e05
  Scenario: Valid when attempting to create IRL prospect session under default TP_CORE catalogue
    * def randomUuid = call randomUuidGenerator
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
    And match $.sessionId == '#uuid'

  @e02 @d03 @TDM @e05
  Scenario: Valid when attempting to create IRL prospect session under specified TP_CORE catalogue
    * def randomUuid = call randomUuidGenerator
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country": "IRL",
        "catalogue": "TP_CORE"
      }
    """
    When method PUT
    Then status 201
    And match $.sessionId == '#uuid'

  @e02 @d03 @TDM @e05
  Scenario: Valid when attempting to create GBR prospect session under specified MOBILE catalogue
    * def randomUuid = call randomUuidGenerator
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country": "GBR",
        "catalogue": "MOBILE"
      }
    """
    When method PUT
    Then status 201
    And match $.sessionId == '#uuid'

  @e02 @d03 @TDM @e05
  Scenario: Return Interaction Ref For prospect, specified by Country
    * def createSession = call read('classpath:helpers/create-session-prospect.feature') {catalogue:null,channel:null,country:'IRL'}
    * def skySessionId = createSession.sessionId
    * def getSession = call read('classpath:helpers/get-session-prospect.feature') {uuid:'#(skySessionId)', domain:'trading'}
    * def getSessionResponse = getSession.response
    And match getSessionResponse.uuid == skySessionId
    And match getSessionResponse.transactionId == '#uuid'
    And match getSessionResponse.catalogue == 'TP_CORE'
    And match getSessionResponse.channel == 'ONLINE'
    And match getSessionResponse.backend == 'helix'
    And match getSessionResponse.journeyContext == 'ROSE_MIG_LFL'

  @e02 @d03 @TDM @e05
  Scenario: To ensure user provided Catalogue and Channel are stored in session objects
    * def createSession = call read('classpath:helpers/create-session-prospect.feature') {catalogue:'MOBILE',channel:'DEMO',country:'GBR'}
    * def skySessionId = createSession.sessionId
    * def getSession = call read('classpath:helpers/get-session-prospect.feature') {uuid:'#(skySessionId)', domain:'trading'}
    * def getSessionResponse = getSession.response
    And match getSessionResponse.uuid == skySessionId
    And match getSessionResponse.transactionId == '#uuid'
    And match getSessionResponse.catalogue == 'MOBILE'
    And match getSessionResponse.channel == 'DEMO'
    And match getSessionResponse.backend == 'helix'
    And match getSessionResponse.journeyContext == 'ROSE_MIG_LFL'

  @limathree249 @e02 @d03 @TDM @e05
  Scenario: To ensure user provided Catalogue and Channel are updated in existing session object
    * def createSession = call read('classpath:helpers/create-session-prospect.feature') {catalogue:'MOBILE',channel:'DEMO',country:'GBR'}
    * def skySessionId = createSession.sessionId
    * def getSession = call read('classpath:helpers/get-session-prospect.feature') {uuid:'#(skySessionId)', domain:'trading'}
    * def getSessionResponse = getSession.response
    And match getSessionResponse.uuid == skySessionId
    And match getSessionResponse.transactionId == '#uuid'
    And match getSessionResponse.catalogue == 'MOBILE'
    And match getSessionResponse.channel == 'DEMO'
    And match getSessionResponse.backend == 'helix'
    And match getSessionResponse.journeyContext == 'ROSE_MIG_LFL'
    * def createSession = call read('classpath:helpers/create-session-prospect.feature') {catalogue:'TP_CORE',channel:'ONLINE',uuid:skySessionId,country:'IRL'}
    * def skySessionId = createSession.sessionId
    * def getSession = call read('classpath:helpers/get-session-prospect.feature') {uuid:'#(skySessionId)', domain:'trading'}
    * def getSessionResponse = getSession.response
    And match getSessionResponse.uuid == skySessionId
    And match getSessionResponse.transactionId == '#uuid'
    And match getSessionResponse.catalogue == 'TP_CORE'
    And match getSessionResponse.channel == 'ONLINE'
    And match getSessionResponse.backend == 'helix'
    And match getSessionResponse.journeyContext == 'ROSE_MIG_LFL'

  @limathree249 @e02 @d03 @TDM @e05
  Scenario: To ensure default Catalogue and Channel are updated in existing session object
    * def createSession = call read('classpath:helpers/create-session-prospect.feature') {catalogue:'MOBILE',channel:'DEMO',country:'IRL'}
    * def skySessionId = createSession.sessionId
    * def getSession = call read('classpath:helpers/get-session-prospect.feature') {uuid:'#(skySessionId)', domain:'trading'}
    * def getSessionResponse = getSession.response
    And match getSessionResponse.uuid == skySessionId
    And match getSessionResponse.transactionId == '#uuid'
    And match getSessionResponse.catalogue == 'MOBILE'
    And match getSessionResponse.channel == 'DEMO'
    And match getSessionResponse.backend == 'helix'
    And match getSessionResponse.journeyContext == 'ROSE_MIG_LFL'
    * def createSession = call read('classpath:helpers/create-session-prospect.feature') {catalogue:null,channel:null,uuid:skySessionId,country:'IRL'}
    * def skySessionId = createSession.sessionId
    * def getSession = call read('classpath:helpers/get-session-prospect.feature') {uuid:'#(skySessionId)', domain:'trading'}
    * def getSessionResponse = getSession.response
    And match getSessionResponse.uuid == skySessionId
    And match getSessionResponse.transactionId == '#uuid'
    And match getSessionResponse.catalogue == 'TP_CORE'
    And match getSessionResponse.channel == 'ONLINE'
    And match getSessionResponse.backend == 'helix'
    And match getSessionResponse.journeyContext == 'ROSE_MIG_LFL'

  @e02 @d03 @TDM @e05
  Scenario: Sending two requests having same SessionId and both as prospect, should get back the same transaction Refs
    * def randomUuid = call randomUuidGenerator
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
    And match response.country == 'IRL'
    * def expectedProspectTransactionId = response.transactionId
    * def expectedUuid = response.uuid
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
       "domain":"trading",
       "uuid":"#(expectedUuid)",
            "country": "IRL"
      }
    """
    When method PUT
    Then status 201
    And path '/sessions/'+ randomUuid +'/domains/trading'
    And header Authorization = sessionAuthToken
    And method get
    And status 200
    And assert expectedProspectTransactionId == response.transactionId
    And assert expectedUuid == response.uuid
    And match response.backend == 'helix'
    And match response.country == 'IRL'
    Given path '/sessions/' + randomUuid + '/domains/trading/'
    And header Authorization = sessionAuthToken
    And method DELETE
    Then status 200
    And match response == ''

  @e02 @d03 @TDM @e05
  Scenario: When requesting sessionId created as prospect
    * def randomUuid = call randomUuidGenerator
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
    * def expectedTransactionId = response.transactionId
    * def expectedUuid = response.uuid
    Given path '/sessions/' + expectedUuid + '/domains/trading'
    And header Authorization = sessionAuthToken
    And method GET
    And status 200
    And assert expectedUuid == response.uuid
    And match response.backend == 'helix'
    And match response.country == 'IRL'
    Given path '/sessions/' + randomUuid + '/domains/trading/'
    And header Authorization = sessionAuthToken
    And method DELETE
    Then status 200
    And match response == ''
    Given path '/sessions/' + expectedUuid + '/domains/trading'
    And header Authorization = sessionAuthToken
    And method GET
    And status 404
    * print expectedUuid
    And match response.errors[0].code == 'session.not.found'
    And match response.errors[0].message == 'Session not found'
