@stubs @session

Feature: Functional tests for the Session Stub Service APIs/endpoints
  As the owners of the Session Service Stubs
  We want to ensure the endpoints we are exposing to other services return the expected data
  In order to ensure service contracts are met

  Background:
    * url sessionServiceUrlBase

  Scenario: map-delete-session-errorSessionNotFound
    Given path '/sessions/invalid_session_id/domains/trading'
    And header Authorization = sessionAuthToken
    When method delete
    Then status 200
    And match response == ''

  Scenario: map-delete-session-deleteSession.json
    Given path '/sessions/valid_session_id/domains/trading'
    And header Authorization = sessionAuthToken
    When method delete
    Then status 200
    And match response == ''

  Scenario: map-put-session-getCustomerInteractionWithAccountNumber
    * def getCustomerInteraction = read(sessionServiceStubLocation + 'get-session-getCustomerInteraction.json')
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "uuid": "valid_session_id",
        "domain" : "trading",
        "accountNumber": "621734336475",
        "authToken":"valid_sso_token",
        "userRoles": ["primary"]
      }
    """
    When method PUT
    Then status 201
    And match response.sessionId == '#uuid'
    And path '/sessions/valid_session_id/domains/trading'
    And header Authorization = sessionAuthToken
    When method get
    Then status 200
    And match response == $getCustomerInteraction
    Given path '/sessions/valid_session_id/domains/trading'
    And header Authorization = sessionAuthToken
    And method DELETE
    Then status 200
    And match response == ''

  Scenario: map-put-session-getCustomerInteractionWithPartyId
    * def getCustomerInteraction = read(sessionServiceStubLocation + 'get-session-getCustomerInteraction.json')
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "uuid": "valid_session_id",
         "domain" : "trading",
        "partyId": "14901887743934236319374",
         "accountNumber": "621734336475",
        "authToken":"valid_sso_token",
        "userRoles": ["primary"]
      }
    """
    When method PUT
    Then status 201
    And match response.sessionId == '#uuid'
    And path '/sessions/valid_session_id/domains/trading'
    And header Authorization = sessionAuthToken
    When method get
    Then status 200
    And match response == $getCustomerInteraction
    Given path '/sessions/valid_session_id/domains/trading'
    And header Authorization = sessionAuthToken
    And method DELETE
    Then status 200
    And match response == ''

  Scenario: map-put-session-getProspectInteraction
    * def getProspectInteraction = read(sessionServiceStubLocation + 'get-session-getProspectInteraction.json')
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "uuid": "prospect_valid_session_id",
        "domain" : "trading",
        "country": "GBR"
      }
    """
    When method PUT
    Then status 201
    And match response.sessionId == '#uuid'
    When path '/sessions/prospect_valid_session_id/domains/trading'
    And header Authorization = sessionAuthToken
    When method get
    Then status 200
    And match response == $getProspectInteraction

  Scenario: map-put-session-getCustomerInteractionForSkyqSession.json
    * def getCustomerInteractionForSkyQ = read(sessionServiceStubLocation + 'get-session-getCustomerInteractionForSkyQ.json')
    Given path '/sessions'
    And request
    """
      {
        "uuid": "skyq_session_id",
        "domain" : "trading",
        "partyId": "14842121867344213362659",
        "authToken":"valid_sso_token",
        "interestSource":"123456",
        "userRoles": ["primary"],

      }
    """
    And header Authorization = sessionAuthToken
    When method PUT
    Then status 201
    And match response.sessionId == '#uuid'
    When path '/sessions/skyq_session_id/domains/trading'
    And header Authorization = sessionAuthToken
    When method get
    Then status 200
    And match response.uuid == $getCustomerInteractionForSkyQ.uuid
    And match response.domain == $getCustomerInteractionForSkyQ.domain
    And match response.backend == $getCustomerInteractionForSkyQ.backend
    And match response.userRoles == $getCustomerInteractionForSkyQ.userRoles
    And match response.catalogue == $getCustomerInteractionForSkyQ.catalogue
    And match response.channel == $getCustomerInteractionForSkyQ.channel
    And match response.journeyContext == $getCustomerInteractionForSkyQ.journeyContext
    And match response.user == $getCustomerInteractionForSkyQ.user
    And match response.transaction.customerType == $getCustomerInteractionForSkyQ.transaction.customerType
    And match response.transaction.provider == $getCustomerInteractionForSkyQ.transaction.provider
    And match response.transaction.catalogue == $getCustomerInteractionForSkyQ.transaction.catalogue
    And match response.transaction.channel == $getCustomerInteractionForSkyQ.transaction.channel
    And match response.transaction.journeyContext == $getCustomerInteractionForSkyQ.transaction.journeyContext

  Scenario: map-get-session-sessionNotFound
    * def getSessionErrorSessionNotFound = read(sessionServiceStubLocation + 'get-session-errorSessionNotFound.json')
    Given path '/sessions/invalid_session_id/domains/trading'
    And header Authorization = sessionAuthToken
    When method get
    Then status 404
    And match response == $getSessionErrorSessionNotFound

  Scenario: map-get-session-existingProspectSession
    * def getSessionGetProspectInteraction = read(sessionServiceStubLocation + 'get-session-getProspectInteraction.json')
    Given path '/sessions'
    And request
    """
      {
        "uuid": "prospect_valid_session_id",
        "domain" : "trading",
        "country": "GBR"
      }
    """
    And header Authorization = sessionAuthToken
    And method PUT
    Then status 201
    And match response.sessionId == '#uuid'
    When path '/sessions/prospect_valid_session_id/domains/trading'
    And header Authorization = sessionAuthToken
    And method get
    Then status 200
    And match response.backend == 'helix'
    And match response.uuid == 'prospect_valid_session_id'
    And match response.country == 'GBR'
    Then path '/sessions/prospect_valid_session_id/domains/trading'
    And header Authorization = sessionAuthToken


  Scenario Outline: Test mocks
    * def stubbedResponse = read(sessionServiceStubLocation + '<stubbedResponse>.json')
    Given path '/sessions'
    And request <requestBody>
    And header Authorization = sessionAuthToken
    When method PUT
    Then status <statusCode>
    And match response == $stubbedResponse
    Examples:
      | testDescription                                            | stubbedResponse                    | requestBody                                                                                                          | statusCode |
      | map-put-session-errorNoSSOTokenGetCustInteractionPartyId   | get-session-errorMissingSSOToken   | {"uuid":"valid_session_id","domain":"trading","partyId":"valid_party_id"}                                            | 400        |
      | map-put-session-errorNoSSOTokenGetCustInteractionAccountNo | get-session-errorMissingSSOToken   | {"uuid":"valid_session_id","domain":"trading","accountNumber":"621734336475"}                                        | 400        |
      | Test map-get-session-errorInvalidPartyId                   | get-session-errorCustomerNotFound  | {"uuid":"invalid_party_id_session_id","domain":"trading","partyId":"invalid_party_id","authToken":"valid_sso_token"} | 500        |
      | Test map-put-session-errorMissingIdentifier                | get-session-errorMissingIdentifier | {"uuid":"valid_session_id","domain":"trading","authToken":"valid_sso_token"}                                         | 400        |
      | map-put-session-errorMissingUUID                           | get-session-errorMissingUUID       | {"accountNumber":"valid_account_number","authToken":"valid_sso_token","domain":"trading"}                            | 400        |
      | map-put-session-errorMissingUUID                           | get-session-errorMissingUUID       | {"country":"GBR","domain":"trading"}                                                                                 | 400        |
      | map-put-session-errorMissingUUID                           | get-session-errorMissingUUID       | {"accountNumber":"valid_account_number","authToken":"valid_sso_token","domain":"trading"}                            | 400        |
