@session

Feature: Functional Error tests to exercise SAL errors for the Session Service APIs/endpoints
  As the owners of the Session Service Stubs
  We want to ensure the endpoints we are exposing to other services return the expected data
  In order to ensure service contracts are met

  Background:
    * url sessionServiceUrlBase
    * def randomUuidGenerator = read('classpath:helpers/randomUuidGenerator.js')

  @e02
  Scenario Outline: Test accounts which are unable to create interactions and return a 412 precondition failed from SAL
    * def randomUuid = call randomUuidGenerator
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "accountNumber":"<accountNumber>",
        "authToken":"valid_sso_token"
      }
    """
    When method PUT
    Then status <statusCode>
    And match $.errors.[*]message == ["<errorMessage>"]
    And match $.errors.[*]code == ["<errorCode>"]
    Examples:
      | type                                                          | accountNumber           | statusCode | errorMessage                                                      | errorCode                       |
      | UNABLE_INFLIGHT                                               | #(inflight1)            | 500        | codes: sis.migration.error                                        | transaction.precondition.failed |
      | UNABLE_INFLIGHT                                               | #(inflight2)            | 500        | codes: sis.migration.error                                        | transaction.precondition.failed |
      | UNABLE_STATE PREACTIVE                                        | #(preactive)            | 500        | codes: sis.migration.state                                        | transaction.precondition.failed |
      | UNABLE_STATE PREACTIVE_CANCELLED                              | #(preActiveCancelled)   | 500        | codes: sis.migration.state                                        | transaction.precondition.failed |
      | UNABLE_STATE POSTACTIVE_CANCELLED                             | #(postActiveCancelled1) | 500        | codes: sis.migration.state                                        | transaction.precondition.failed |
      | UNABLE_STATE POSTACTIVE_CANCELLED                             | #(postActiveCancelled2) | 500        | codes: sis.migration.state                                        | transaction.precondition.failed |
      | UNABLE_DEBT                                                   | #(debtManagement)       | 500        | codes: sis.migration.debt                                         | transaction.precondition.failed |
      | ACCOUNT_NOT_FOUND - MOBILE CUSTOMER UNDER TP_CORE             | #(skyMobilePreactive)   | 500        | codes: sis.migration.not.found                                    | transaction.precondition.failed |
      | ACCOUNT_NOT_FOUND - MOBILE CUSTOMER UNDER TP_CORE             | #(skyMobileActive1)     | 500        | codes: sis.migration.not.found                                    | transaction.precondition.failed |
      | DEBT - INTERACTION CREATED BLOCKED STATE                      | #(coreAccountDebt1)     | 500        | Transaction revoked because the customer status is set to BLOCKED | third.party.failure             |
      | MULTIPLE BILLING ACCOUNTS - INTERACTION CREATED BLOCKED STATE | #(multi_billing_acc)    | 500        | Transaction revoked because the customer status is set to BLOCKED | third.party.failure             |
      | MULTIPLE BILLING ACCOUNTS - INTERACTION CREATED BLOCKED STATE | #(multi_billing_acc2)   | 500        | Transaction revoked because the customer status is set to BLOCKED | third.party.failure             |
      | MULTIPLE BILLING ACCOUNTS - INTERACTION CREATED BLOCKED STATE | #(multi_billing_acc3)   | 500        | Transaction revoked because the customer status is set to BLOCKED | third.party.failure             |
      | MULTIPLE BILLING ACCOUNTS - INTERACTION CREATED BLOCKED STATE | #(multi_billing_acc4)   | 500        | Transaction revoked because the customer status is set to BLOCKED | third.party.failure             |


  @e05
  Scenario: Error when attempting to create GBR prospect session under default TP_CORE catalogue
    * def randomUuid = call randomUuidGenerator
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country": "GBR"
      }
    """
    When method PUT
    Then status 500
    And match $.errors.[*]code == ["transaction.creation.failed"]
    And match $.errors.[*]message == ["Could not create transaction."]

  @e05
  Scenario: Error when attempting to create GBR prospect session under specified TP_CORE catalogue
    * def randomUuid = call randomUuidGenerator
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "domain":"trading",
        "uuid":"#(randomUuid)",
        "country": "GBR",
        "catalogue": "TP_CORE"
      }
    """
    When method PUT
    Then status 500
    And match $.errors.[*]code == ["transaction.creation.failed"]
    And match $.errors.[*]message == ["Could not create transaction."]

  @e02 @d03 @TDM @e05
  Scenario: Ensure if an invalid offerURN is passed, an error is returned to the client
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
        "userRoles": ["primary"],
        "offerUrn":"invalidOfferUrn"
      }
    """
    When method PUT
    Then status 500
    And match $.errors.[*]code == ["transaction.invalid.urn"]
    And match $.errors.[*]message == ["Invalid URN provided."]


  @e02
  Scenario: Ensure if valid offerURN already used, returns URN value has been used already
    * def randomUuid = call randomUuidGenerator
    Given path '/sessions'
    And header Authorization = sessionAuthToken
    And request
    """
      {
        "uuid":"#(randomUuid)",
        "domain":"trading",
        "accountNumber":"#(skyVarietyLegacyHd2)",
        "authToken":"valid_sso_token",
        "offerUrn":"TGUP00RKJ01S"
      }
    """
    When method PUT
    Then status 500
    And match $.errors.[*]code == ["transaction.used.urn"]
    And match $.errors.[*]message == ["URN value has been used already."]