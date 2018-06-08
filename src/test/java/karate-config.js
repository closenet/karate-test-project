function karateConfig() {

  // set command line args -Dkarate.<var>
  var env = karate.env; // get system property 'karate.env'

  karate.log('karate.env system property was:', env);


  var config = {
    env: env,

    // Default URL's are passed in by command line
    // Over-ridden by env var if passed unless explicity set on command line
    productServiceUrlBase: karate.properties['productServiceUrlBase'],
    sessionServiceUrlBase: karate.properties['sessionServiceUrlBase'],
    pricingServiceUrlBase: karate.properties['pricingServiceUrlBase'],
    basketServiceUrlBase: karate.properties['basketServiceUrlBase'],
    customerServiceUrlBase: karate.properties['customerServiceUrlBase'],
    salServiceUrlBase: karate.properties['salServiceUrlBase'],
    propositionServiceUrlBase: karate.properties['propositionServiceUrlBase'],
    appointmentServiceUrlBase: karate.properties['appointmentServiceUrlBase'],
    productEligibilityServiceUrlBase: karate.properties['productEligibilityServiceUrlBase'],
    orderServiceUrlBase: karate.properties['orderServiceUrlBase'],
    journeyEligibilityServiceUrlBase: karate.properties['journeyEligibilityServiceUrlBase'],
    journeyPrimerServiceUrlBase: karate.properties['journeyPrimerServiceUrlBase'],
    journeyLinkServiceUrlBase: karate.properties['journeyLinkServiceUrlBase'],
    featureToggleServiceUrlBase: karate.properties['journeyLinkServiceUrlBase'],
    odpServiceUrlBase: karate.properties['odpServiceUrlBase'],
    graphQLServiceUrlBase: karate.properties['graphQLServiceUrlBase'],

    skyIdServiceUrlBase: 'https://skyid-creator.cf.stage-paas.bskyb.com/',

    // Location of dt-service-stubs response mappings
    productServiceStubLocation: 'classpath:product-service/stubs/__files/',
    productEligibilityServiceStubLocation: 'classpath:product-eligibility-service/stubs/__files/',
    journeyEligibilityServiceStubLocation: 'classpath:journey-eligibility-service/stubs/__files/',
    journeyLinkServiceStubLocation: 'classpath:journey-link-service/stubs/__files/',
    sessionServiceStubLocation: 'classpath:session-service/stubs/__files/',
    pricingServiceStubLocation: 'classpath:pricing-service/stubs/__files/',
    basketServiceStubLocation: 'classpath:basket-service/stubs/__files/',
    customerServiceStubLocation: 'classpath:customer-service/stubs/__files/',
    appointmentServiceStubLocation: 'classpath:appointment-service/stubs/__files/',
    salServiceStubLocation: 'classpath:sal-service/stubs/__files/',
    propositionServiceStubLocation: 'classpath:proposition-service/stubs/__files/',
    orderServiceStubLocation: 'classpath:order-service/stubs/__files/',
    journeyPrimerServiceStubLocation: 'classpath:journey-primer-service/stubs/__files/',
    odpServiceStubLocation: 'classpath:odp-service/stubs/__files/',

    sessionAuthToken: 'Basic dHJhZGluZzpwYXNzd29yZA==',
    appointmentAuthToken: 'Basic dHJhZGluZzpwYXNzd29yZA==',
    customerAuthToken: 'Basic dHJhZGluZzpwYXNzd29yZA==',
    lwsCustAuthToken: 'Basic bHdzLW9yczpwYXNzd29yZA==',
    graphQLAuthToken: '7c74f2b0-3330-0135-0e81-12ee89cbe14b',
    oogwayAuthToken: 'Basic dGVzdG5vdHByb2Q6dGVzdG5vdHByb2Q=',
    oogwayHeader: 'application/vnd.oogway.v4+json'


  }
  if (env == 'dev_local') {

    config.appointmentServiceUrlBase = ( config.appointmentServiceUrlBase == null ) ? 'http://localhost:8080' : config.appointmentServiceUrlBase;
    config.productServiceUrlBase = ( config.productServiceUrlBase == null ) ? 'http://localhost:1700' : config.productServiceUrlBase;
    config.sessionServiceUrlBase = ( config.sessionServiceUrlBase == null ) ? 'http://localhost:8080' : config.sessionServiceUrlBase;
    config.pricingServiceUrlBase = ( config.pricingServiceUrlBase == null ) ? 'http://localhost:1702' : config.pricingServiceUrlBase;
    config.basketServiceUrlBase = ( config.basketServiceUrlBase == null ) ? 'http://localhost:4000' : config.basketServiceUrlBase;
    config.customerServiceUrlBase = ( config.customerServiceUrlBase == null ) ? 'http://localhost:1704' : config.customerServiceUrlBase;
    config.salServiceUrlBase = ( config.salServiceUrlBase == null ) ? 'http://localhost:1705' : config.salServiceUrlBase;
    config.propositionServiceUrlBase = ( config.propositionServiceUrlBase == null ) ? 'http://localhost:1708' : config.propositionServiceUrlBase;
    config.productEligibilityServiceUrlBase = ( config.productEligibilityServiceUrlBase == null ) ? 'http://localhost:1709' : config.productEligibilityServiceUrlBase;
    config.orderServiceUrlBase = ( config.orderServiceUrlBase == null ) ? 'http://localhost:1707' : config.orderServiceUrlBase;
    config.journeyEligibilityServiceUrlBase = ( config.journeyEligibilityServiceUrlBase == null ) ? 'http://localhost:1710' : config.journeyEligibilityServiceUrlBase;
    config.journeyPrimerServiceUrlBase = ( config.journeyPrimerServiceUrlBase == null ) ? 'http://localhost:1713' : config.journeyPrimerServiceUrlBase;
    config.journeyLinkServiceUrlBase = ( config.journeyLinkServiceUrlBase == null ) ? 'http://localhost:1712' : config.journeyLinkServiceUrlBase;
    config.odpServiceUrlBase = (config.odpServiceUrlBase == null) ? 'http://localhost:1714': config.odpServiceUrlBase;
    

    karate.call('classpath:customersE02.js', config);

  }
  else if (env == 'mock_local') {

    config.appointmentServiceUrlBase = ( config.appointmentServiceUrlBase == null ) ? 'http://localhost:9011' : config.appointmentServiceUrlBase;
    config.productServiceUrlBase = ( config.productServiceUrlBase == null ) ? 'http://localhost:9006' : config.productServiceUrlBase;
    config.sessionServiceUrlBase = ( config.sessionServiceUrlBase == null ) ? 'http://localhost:9001' : config.sessionServiceUrlBase;
    config.pricingServiceUrlBase = ( config.pricingServiceUrlBase == null ) ? 'http://localhost:9003' : config.pricingServiceUrlBase;
    config.basketServiceUrlBase = ( config.basketServiceUrlBase == null ) ? 'http://localhost:9004' : config.basketServiceUrlBase;
    config.customerServiceUrlBase = ( config.customerServiceUrlBase == null ) ? 'http://localhost:9020' : config.customerServiceUrlBase;
    config.salServiceUrlBase = ( config.salServiceUrlBase == null ) ? 'http://localhost:9002' : config.salServiceUrlBase;
    config.propositionServiceUrlBase = ( config.propositionServiceUrlBase == null ) ? 'http://localhost:9008' : config.propositionServiceUrlBase;
    config.productEligibilityServiceUrlBase = ( config.productEligibilityServiceUrlBase == null ) ? 'http://localhost:9009' : config.productEligibilityServiceUrlBase;
    config.orderServiceUrlBase = ( config.orderServiceUrlBase == null ) ? 'http://localhost:9007' : config.orderServiceUrlBase;
    config.journeyEligibilityServiceUrlBase = ( config.journeyEligibilityServiceUrlBase == null ) ? 'http://localhost:9010' : config.journeyEligibilityServiceUrlBase;
    config.journeyPrimerServiceUrlBase = ( config.journeyPrimerServiceUrlBase == null ) ? 'http://localhost:9013' : config.journeyPrimerServiceUrlBase;
    config.journeyLinkServiceUrlBase = ( config.journeyLinkServiceUrlBase == null ) ? 'http://localhost:9012' : config.journeyLinkServiceUrlBase;
    config.odpServiceUrlBase = ( config.odpServiceUrlBase == null ) ? 'http://localhost:9014' : config.odpServiceUrlBase;

  }
  else if (env == 'mock_n2') {

    config.appointmentServiceUrlBase = ( config.appointmentServiceUrlBase == null ) ? 'https://dt-appointment-service-mock.cf.dev-paas.bskyb.com' : config.appointmentServiceUrlBase;
    config.productServiceUrlBase = ( config.productServiceUrlBase == null ) ? 'https://dt-product-service-mock.cf.dev-paas.bskyb.com' : config.productServiceUrlBase;
    config.sessionServiceUrlBase = ( config.sessionServiceUrlBase == null ) ? 'https://dt-session-service-mock.cf.dev-paas.bskyb.com' : config.sessionServiceUrlBase;
    config.pricingServiceUrlBase = ( config.pricingServiceUrlBase == null ) ? 'https://dt-pricing-service-mock.cf.dev-paas.bskyb.com' : config.pricingServiceUrlBase;
    config.basketServiceUrlBase = ( config.basketServiceUrlBase == null ) ? 'https://dt-basket-service-mock.cf.dev-paas.bskyb.com' : config.basketServiceUrlBase;
    config.customerServiceUrlBase = ( config.customerServiceUrlBase == null ) ? 'https://dt-customer-service-mock.cf.dev-paas.bskyb.com' : config.customerServiceUrlBase;
    config.salServiceUrlBase = ( config.salServiceUrlBase == null ) ? 'https://dt-sal-service-mock.cf.dev-paas.bskyb.com' : config.salServiceUrlBase;
    config.propositionServiceUrlBase = ( config.propositionServiceUrlBase == null ) ? 'https://dt-proposition-service-mock.cf.dev-paas.bskyb.com' : config.propositionServiceUrlBase;
    config.productEligibilityServiceUrlBase = ( config.productEligibilityServiceUrlBase == null ) ? 'https://dt-product-eligibility-service-mock.cf.dev-paas.bskyb.com' : config.productEligibilityServiceUrlBase;
    config.journeyEligibilityServiceUrlBase = ( config.journeyEligibilityServiceUrlBase == null ) ? 'https://dt-journey-eligibility-service-mock.cf.dev-paas.bskyb.com' : config.journeyEligibilityServiceUrlBase;
    config.journeyLinkServiceUrlBase = ( config.journeyLinkServiceUrlBase == null ) ? 'https://dt-journey-link-service-mock.cf.dev-paas.bskyb.com' : config.journeyLinkServiceUrlBase;
    config.orderServiceUrlBase = ( config.orderServiceUrlBase == null ) ? 'https://dt-order-service-mock.cf.dev-paas.bskyb.com' : config.orderServiceUrlBase;
    config.journeyPrimerServiceUrlBase = ( config.journeyPrimerServiceUrlBase == null ) ? 'https://dt-journey-primer-service-mock.cf.dev-paas.bskyb.com' : config.journeyPrimerServiceUrlBase;
    config.odpServiceUrlBase = (config.odpServiceUrlBase == null) ? 'https://dt-odp-service-mock.cf.dev-paas.bskyb.com': config.odpServiceUrlBase;

  }
  else if (env == 'dev_mock_n2') {
    config.appointmentServiceUrlBase = ( config.appointmentServiceUrlBase == null ) ? 'https://appointment-service-mocked.cf.dev-paas.bskyb.com' : config.appointmentServiceUrlBase;
    config.customerServiceUrlBase = ( config.customerServiceUrlBase == null ) ? 'https://customer-service-mocked.cf.dev-paas.bskyb.com' : config.customerServiceUrlBase;
    config.productServiceUrlBase = ( config.productServiceUrlBase == null ) ? 'https://product-service-d03.cf.dev-paas.bskyb.com' : config.productServiceUrlBase;
    config.pricingServiceUrlBase = ( config.pricingServiceUrlBase == null ) ? 'https://pricing-service-mocked.cf.dev-paas.bskyb.com' : config.pricingServiceUrlBase;
    config.propositionServiceUrlBase = ( config.propositionServiceUrlBase == null ) ? 'https://proposition-service-mock.cf.dev-paas.bskyb.com' : config.propositionServiceUrlBase;
    config.sessionServiceUrlBase = ( config.sessionServiceUrlBase == null ) ? 'https://session-service-mocked.cf.dev-paas.bskyb.com' : config.sessionServiceUrlBase;
    config.odpServiceUrlBase = (config.odpServiceUrlBase == null) ? 'http://': config.odpServiceUrlBase;

  }
  else if (env == 'd03') {
    config.productServiceUrlBase = ( config.productServiceUrlBase == null ) ? 'https://product-service-d03.cf.dev-paas.bskyb.com' : config.productServiceUrlBase;
    config.sessionServiceUrlBase = ( config.sessionServiceUrlBase == null ) ? 'https://session-service-d03.cf.dev-paas.bskyb.com' : config.sessionServiceUrlBase;
    config.pricingServiceUrlBase = ( config.pricingServiceUrlBase == null ) ? 'https://pricing-service-d03.cf.dev-paas.bskyb.com' : config.pricingServiceUrlBase;
    config.customerServiceUrlBase = ( config.customerServiceUrlBase == null ) ? 'https://customer-service-d03.cf.dev-paas.bskyb.com' : config.customerServiceUrlBase;
    config.productEligibilityServiceUrlBase = ( config.productEligibilityServiceUrlBase == null ) ? 'https://product-eligibility-service-d03.cf.dev-paas.bskyb.com' : config.productEligibilityServiceUrlBase;
    config.propositionServiceUrlBase = ( config.propositionServiceUrlBase == null ) ? 'https://proposition-service-d03.cf.dev-paas.bskyb.com' : config.propositionServiceUrlBase;
    config.salServiceUrlBase = ( config.salServiceUrlBase == null ) ? 'https://sisd03.lwsdat.glb.bskyb.com' : config.salServiceUrlBase;
    config.basketServiceUrlBase = ( config.basketServiceUrlBase == null ) ? 'https://basket-service-d03.cf.dev-paas.bskyb.com' : config.basketServiceUrlBase;
    config.journeyEligibilityServiceUrlBase = ( config.journeyEligibilityServiceUrlBase == null ) ? 'https://journey-eligibility-service-d03.cf.dev-paas.bskyb.com/api' : config.journeyEligibilityServiceUrlBase;
    config.journeyLinkServiceUrlBase = ( config.journeyLinkServiceUrlBase == null ) ? 'https://journey-link-service-d03.cf.dev-paas.bskyb.com' : config.journeyLinkServiceUrlBase;
    config.featureToggleServiceUrlBase = ( config.featureToggleServiceUrlBase == null ) ? 'https://securep-feature-toggle-d03.stage-cf.sky.com/' : config.featureToggleServiceUrlBase;
    config.journeyPrimerServiceUrlBase = ( config.journeyPrimerServiceUrlBase == null ) ? 'https://journey-primer-service-d03.cf.dev-paas.bskyb.com' : config.journeyPrimerServiceUrlBase;
    config.odpServiceUrlBase = (config.odpServiceUrlBase == null) ? 'http://': config.odpServiceUrlBase;
    config.dataProvServiceUrlBase = ( config.dataProvServiceUrlBase == null ) ? 'http://s52xdlr003.bskyb.com:8080/dataprov-rest-service/dataprov/' : config.dataProvServiceUrlBase;
    config.lwsServiceUrlBase = ( config.lwsServiceUrlBase == null ) ? 'https://cusd03.lwsdat.glb.bskyb.com/' : config.lwsServiceUrlBase;

    config.salAuthToken = 'Basic ZGVtbzpwYXNzd29yZA==';
    config.skyIdEnv = 'D03';

    karate.call('classpath:customersD03.js', config);
  }
  else if (env == 'TDM') {
    config.productServiceUrlBase = ( config.productServiceUrlBase == null ) ? 'https://product-service-tdm.cf.dev-paas.bskyb.com' : config.productServiceUrlBase;
    config.sessionServiceUrlBase = ( config.sessionServiceUrlBase == null ) ? 'https://session-service-tdm.cf.dev-paas.bskyb.com' : config.sessionServiceUrlBase;
    config.pricingServiceUrlBase = ( config.pricingServiceUrlBase == null ) ? 'https://pricing-service-tdm.cf.dev-paas.bskyb.com' : config.pricingServiceUrlBase;
    config.customerServiceUrlBase = ( config.customerServiceUrlBase == null ) ? 'https://customer-service-tdm.cf.dev-paas.bskyb.com' : config.customerServiceUrlBase;
    config.productEligibilityServiceUrlBase = ( config.productEligibilityServiceUrlBase == null ) ? 'https://product-eligibility-service-tdm.cf.dev-paas.bskyb.com' : config.productEligibilityServiceUrlBase;
    config.propositionServiceUrlBase = ( config.propositionServiceUrlBase == null ) ? 'https://proposition-service-tdm.cf.dev-paas.bskyb.com' : config.propositionServiceUrlBase;
    config.salServiceUrlBase = ( config.salServiceUrlBase == null ) ? 'https://sisf04.lwsdat.glb.bskyb.com' : config.salServiceUrlBase;
    config.basketServiceUrlBase = ( config.basketServiceUrlBase == null ) ? 'https://basket-service-tdm.cf.dev-paas.bskyb.com' : config.basketServiceUrlBase;
    config.journeyEligibilityServiceUrlBase = ( config.journeyEligibilityServiceUrlBase == null ) ? 'https://journey-eligibility-service-tdm.cf.dev-paas.bskyb.com/api' : config.journeyEligibilityServiceUrlBase;
    config.journeyLinkServiceUrlBase = ( config.journeyLinkServiceUrlBase == null ) ? 'https://journey-link-service-tdm.cf.dev-paas.bskyb.com' : config.journeyLinkServiceUrlBase;
    config.featureToggleServiceUrlBase = ( config.featureToggleServiceUrlBase == null ) ? 'https://securep-feature-toggle-tdm.stage-cf.sky.com/' : config.featureToggleServiceUrlBase;
    config.journeyPrimerServiceUrlBase = ( config.journeyPrimerServiceUrlBase == null ) ? 'https://journey-primer-service-tdm.cf.dev-paas.bskyb.com' : config.journeyPrimerServiceUrlBase;
    config.odpServiceUrlBase = (config.odpServiceUrlBase == null) ? 'https://odp-tdm.cf.dev-paas.bskyb.com': config.odpServiceUrlBase;
    config.oogwayServiceUrlBase = ( config.oogwayServiceUrlBase == null ) ? 'http://tdmwap.oogway.bskyb.com' : config.oogwayServiceUrlBase;
    config.dataProvServiceUrlBase = ( config.dataProvServiceUrlBase == null ) ? 'http://s52xdlr004.bskyb.com:8082/dataprov-rest-service/dataprov/' : config.dataProvServiceUrlBase;
    config.lwsServiceUrlBase = ( config.lwsServiceUrlBase == null ) ? 'https://cusf04.lwsdat.glb.bskyb.com/' : config.lwsServiceUrlBase;

    config.skyIdEnv = 'F04';

    config.salAuthToken = 'Basic ZGlnaXRhbHRyYWRpbmdfc2hvcDpQOVVRTWRCSDZzUk5qWFdD';


    karate.call('classpath:customersTDM.js', config);
  }
  else if (env == 'e02') {
    config.productServiceUrlBase = ( config.productServiceUrlBase == null ) ? 'https://product-service-e02.cf.dev-paas.bskyb.com' : config.productServiceUrlBase;
    config.sessionServiceUrlBase = ( config.sessionServiceUrlBase == null ) ? 'https://session-service-e02.cf.dev-paas.bskyb.com' : config.sessionServiceUrlBase;
    config.pricingServiceUrlBase = ( config.pricingServiceUrlBase == null ) ? 'https://pricing-service-e02.cf.dev-paas.bskyb.com' : config.pricingServiceUrlBase;
    config.salServiceUrlBase = ( config.salServiceUrlBase == null ) ? 'https://sise02.lwsdat.glb.bskyb.com' : config.salServiceUrlBase;
    config.customerServiceUrlBase = ( config.customerServiceUrlBase == null ) ? 'https://customer-service-e02.cf.dev-paas.bskyb.com' : config.customerServiceUrlBase;
    config.appointmentServiceUrlBase = ( config.appointmentServiceUrlBase == null ) ? 'https://appointment-service-e02.cf.dev-paas.bskyb.com' : config.appointmentServiceUrlBase;
    config.propositionServiceUrlBase = ( config.propositionServiceUrlBase == null ) ? 'https://proposition-service-e02.cf.dev-paas.bskyb.com' : config.propositionServiceUrlBase;
    config.basketServiceUrlBase = ( config.basketServiceUrlBase == null ) ? 'https://basket-service-e02.cf.dev-paas.bskyb.com' : config.basketServiceUrlBase;
    config.productEligibilityServiceUrlBase = ( config.productEligibilityServiceUrlBase == null ) ? 'https://product-eligibility-service-e02.cf.dev-paas.bskyb.com' : config.productEligibilityServiceUrlBase;
    config.featureToggleServiceUrlBase = ( config.featureToggleServiceUrlBase == null ) ? 'https://securep-feature-toggle-e02.stage-cf.sky.com/' : config.featureToggleServiceUrlBase;
    config.journeyEligibilityServiceUrlBase = ( config.journeyEligibilityServiceUrlBase == null ) ? 'https://journey-eligibility-service-e02.cf.dev-paas.bskyb.com/api' : config.journeyEligibilityServiceUrlBase;
    config.journeyLinkServiceUrlBase = ( config.journeyLinkServiceUrlBase == null ) ? 'https://journey-link-service-e02.cf.dev-paas.bskyb.com' : config.journeyLinkServiceUrlBase;
    config.journeyPrimerServiceUrlBase = ( config.journeyPrimerServiceUrlBase == null ) ? 'https://journey-primer-service-e02.cf.dev-paas.bskyb.com' : config.journeyPrimerServiceUrlBase;
    config.odpServiceUrlBase = (config.odpServiceUrlBase == null) ? 'https://odp-e02.cf.dev-paas.bskyb.com': config.odpServiceUrlBase;
    config.oogwayServiceUrlBase = ( config.oogwayServiceUrlBase == null ) ? 'http://e02wap.oogway.bskyb.com' : config.oogwayServiceUrlBase;
    config.dataProvServiceUrlBase = ( config.dataProvServiceUrlBase == null ) ? 'http://s52xdlr002.bskyb.com:8080/dataprov-rest-service/dataprov/' : config.dataProvServiceUrlBase;
    config.mcsServiceUrlBase = ( config.mcsServiceUrlBase == null ) ? 'http://e02-identity.mcs.bskyb.com/' : config.mcsServiceUrlBase;
    config.lwsServiceUrlBase = ( config.lwsServiceUrlBase == null ) ? 'https://cuse02.lwsdat.glb.bskyb.com/' : config.lwsServiceUrlBase;
    config.graphQLServiceUrlBase = ( config.graphQLServiceUrlBase == null ) ? 'https://skyport-graphql-e02-graphql-lima.cf.stage-paas.bskyb.com' : config.graphQLServiceUrlBase;

    config.salAuthToken = 'Basic ZGlnaXRhbHRyYWRpbmdfc2hvcDpTVmtnclBSdmUwUTEzTUp2';
    config.skyIdEnv = 'E02';

    karate.call('classpath:customersE02.js', config);
  }
  else if (env == 'e05') {
    config.productServiceUrlBase = ( config.productServiceUrlBase == null ) ? 'https://product-service-e05.cf.dev-paas.bskyb.com' : config.productServiceUrlBase;
    config.sessionServiceUrlBase = ( config.sessionServiceUrlBase == null ) ? 'https://session-service-e05.cf.dev-paas.bskyb.com' : config.sessionServiceUrlBase;
    config.pricingServiceUrlBase = ( config.pricingServiceUrlBase == null ) ? 'https://pricing-service-e05.cf.dev-paas.bskyb.com' : config.pricingServiceUrlBase;
    config.salServiceUrlBase = ( config.salServiceUrlBase == null ) ? 'https://sise05.lwsdat.glb.bskyb.com' : config.salServiceUrlBase;
    config.customerServiceUrlBase = ( config.customerServiceUrlBase == null ) ? 'https://customer-service-e05.cf.dev-paas.bskyb.com' : config.customerServiceUrlBase;
    config.appointmentServiceUrlBase = ( config.appointmentServiceUrlBase == null ) ? 'https://appointment-service-e05.cf.dev-paas.bskyb.com' : config.appointmentServiceUrlBase;
    config.propositionServiceUrlBase = ( config.propositionServiceUrlBase == null ) ? 'https://proposition-service-e05.cf.dev-paas.bskyb.com' : config.propositionServiceUrlBase;
    config.basketServiceUrlBase = ( config.basketServiceUrlBase == null ) ? 'https://basket-service-e05.cf.dev-paas.bskyb.com' : config.basketServiceUrlBase;
    config.productEligibilityServiceUrlBase = ( config.productEligibilityServiceUrlBase == null ) ? 'https://product-eligibility-service-e05.cf.dev-paas.bskyb.com' : config.productEligibilityServiceUrlBase;
    config.featureToggleServiceUrlBase = ( config.featureToggleServiceUrlBase == null ) ? 'https://securep-feature-toggle-e05.stage-cf.sky.com/' : config.featureToggleServiceUrlBase;
    config.journeyEligibilityServiceUrlBase = ( config.journeyEligibilityServiceUrlBase == null ) ? 'https://journey-eligibility-service-e05.cf.dev-paas.bskyb.com/api' : config.journeyEligibilityServiceUrlBase;
    config.journeyLinkServiceUrlBase = ( config.journeyLinkServiceUrlBase == null ) ? 'https://journey-link-service-e05.cf.dev-paas.bskyb.com' : config.journeyLinkServiceUrlBase;
    config.odpServiceUrlBase = (config.odpServiceUrlBase == null) ? 'https://odp-e05.cf.dev-paas.bskyb.com': config.odpServiceUrlBase;
    config.oogwayServiceUrlBase = ( config.oogwayServiceUrlBase == null ) ? 'http://e05wap.oogway.bskyb.com' : config.oogwayServiceUrlBase;
    config.dataProvServiceUrlBase = ( config.dataProvServiceUrlBase == null ) ? 'http://s52xdlr005.bskyb.com:8080/dataprov-rest-service/dataprov/' : config.dataProvServiceUrlBase;
    config.mcsServiceUrlBase = ( config.mcsServiceUrlBase == null ) ? 'http://e05-identity.mcs.bskyb.com/' : config.mcsServiceUrlBase;
    config.lwsServiceUrlBase = ( config.lwsServiceUrlBase == null ) ? 'https://cuse05.lwsdat.glb.bskyb.com/' : config.lwsServiceUrlBase;
    config.graphQLServiceUrlBase = ( config.graphQLServiceUrlBase == null ) ? 'https://skyport-graphql-e05-graphql-lima.cf.stage-paas.bskyb.com' : config.graphQLServiceUrlBase;

    config.salAuthToken = 'Basic ZGlnaXRhbHRyYWRpbmdfc2hvcDp4TzJNSDF6ZWd6VW5kRkhx';
    config.skyIdEnv = 'E05';

    karate.call('classpath:customersE05.js', config);
  }
  else if (env == 'n01') {
    config.productServiceUrlBase = ( config.productServiceUrlBase == null ) ? 'https://product-service-n01.cf.dev-paas.bskyb.com' : config.productServiceUrlBase;
    config.sessionServiceUrlBase = ( config.sessionServiceUrlBase == null ) ? 'https://session-service-nft.cf.stage-paas.bskyb.com' : config.sessionServiceUrlBase;
    config.pricingServiceUrlBase = ( config.pricingServiceUrlBase == null ) ? 'https://pricing-service-n01.cf.dev-paas.bskyb.com' : config.pricingServiceUrlBase;
    config.featureToggleServiceUrlBase = ( config.featureToggleServiceUrlBase == null ) ? 'http://securep-feature-toggle-nft.stage-cf.sky.com' : config.featureToggleServiceUrlBase;

  }
  else if (env == 'prodOffline') {

    config.sessionServiceUrlBase = ( config.sessionServiceUrlBase == null ) ? 'https://session-service-offline.cf.paas.bskyb.com' : config.sessionServiceUrlBase;
    config.featureToggleServiceUrlBase = ( config.featureToggleServiceUrlBase == null ) ? 'https://feature-toggle-service-offline.cf.paas.bskyb.com' : config.featureToggleServiceUrlBase;
    config.propositionServiceUrlBase = ( config.propositionServiceUrlBase == null ) ? 'https://proposition-service-offline.cf.paas.bskyb.com' : config.propositionServiceUrlBase;
    config.basketServiceUrlBase = ( config.basketServiceUrlBase == null ) ? 'https://basket-service-offline.cf.paas.bskyb.com' : config.basketServiceUrlBase;

    config.sessionAuthToken = 'Basic dHJhZGluZzpkcmNDQTIxdmpDUDBPNHlZ==';
  }
  else if (env == 'prod') {
    config.sessionServiceUrlBase = ( config.sessionServiceUrlBase == null ) ? 'https://session-service.cf.paas.bskyb.com' : config.sessionServiceUrlBase;
    config.featureToggleServiceUrlBase = ( config.featureToggleServiceUrlBase == null ) ? 'https://feature-toggle-service.cf.sky.com' : config.featureToggleServiceUrlBase;
    config.propositionServiceUrlBase = ( config.propositionServiceUrlBase == null ) ? 'https://proposition-service.cf.paas.bskyb.com' : config.propositionServiceUrlBase;
    config.basketServiceUrlBase = ( config.basketServiceUrlBase == null ) ? 'https://basket-service.cf.paas.bskyb.com' : config.basketServiceUrlBase;

    config.sessionAuthToken = 'Basic dHJhZGluZzpkcmNDQTIxdmpDUDBPNHlZ==';
  }
  return config;
}

