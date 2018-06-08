function customersE02(config) {
// E02 Specific Customers
    config.valid_account_number = '621189597019'
    config.valid_party_id = '14951040690549386283962'
    config.invalid_account_number = '0621189586368'
    config.invalid_party_id = '014950119791469386283987'
    config.limaNoSports = '14951040690549386283962'
    config.legacySports = '14951041467339386283945'
    config.limaQNoSports = '15027156072119435961045'
    config.limaQLegacySports = '14951043258639386283942'
    // 621193681288    15021139721649435961015 -- been modifed to have single sports
    config.limaNoCinema = '15021139721649435961015'
    config.limaCinema = '14963093544059392909389'
    config.limaCinema2= '621191370256'
    config.legacyCinema ='12501657348760290204471'
    // PRE CONDITION FAILED for 13305376341098271559172
    // config.restrictedInventoryStateCinema = '13305376341098271559172'
    config.restrictedInventoryStateCinema = '12796229446190464400414'
    config.restrictedInventoryStateF1 = ''
    config.limaAllSports = '621193270959'
    config.cinemaContract = '621192669516'
    config.legacyDualSports = '621189505905'
    config.legacyF1Customer_acc_no = ''
    config.limaAllSportsContract = '621191370413'
    config.multi_billing_acc = '621192070327'
    // 14988178457419428858345
    config.limaSportsAndCinema = '621191880353'

    // 14956323481559386283906
    config.limaSportAndCinemaPreactive = '621189698551'

    //customer with tv hardware
    //621204816253
    config.skyQWithQms = '15199976467159763446860'

    //621204815958
    config.skyQwithoutQms = '15199968669559763446865'

    //621189683884
    config.skyDtvWithoutQorQms = '14956129502149386283945'

    //621204815966
    config.skyQ2TwithoutQms = '15199969324709763446847'

    //621204815982
    config.skyQT1Qms1Minibox='15199970141769763446828'
    
    //621204815990
    config.skyQT2Qms1Minibox= '15199970726619763446844'
    
    //621204816220    
    config.skyQT1Qms2Minibox= '15199974338569763446828'
    
    config.cinemaContract_pc = '621192868449'

    config.optedInClaimedReward = ''

    // 14972809806679408436195
    config.optedInNotClaimedReward = '621190676240'

    //
    config.eligibileNotOptedIn=''
    //
    config.eligibileForFibreOnlyNotClaimedReward = ''


    //14951040690549386283962
    config.hasOneSoundbox = '621189597019'


    // 621143465741	13262092461471043968601
    config.chelseaTvUk = '621204816279'

    //430000768035	14259174215839079639801
    config.chelseaTvRoi = '430000768035'



    // 621191071870	14976177003169408436146
    config.liverpoolTvUk = '621191071870'

    // 430000812809	14951979807719387521683
    config.liverpoolTvRoi = '430000812809' // MIGRATION ERROR


    // 621135719782	12276260294700177888816
    config.muTvUk = '621135719782'

    // 430000756303	14157059154298952675606
    config.muTvRoi = '430000756303'  // MIGRATION ERROR

    // 621163876264 15072215331299547968125
    config.limaPremiership = '13958245117608754590801'
    config.limaPremiershipAccNo = '621163876264'

    // 621194476019    15035040103969435961051
    config.limaPremiership2 = '15035040103969435961051'

    // 621194476035    15035040430369435961044
    config.limaPremiership3 = '15035040430369435961044'

    // 621191795478	14986635054709408436140
    config.tripleSportsOriginal = '621191795478'
    // 621191471187	14981246195799408436114
    config.singleSportsOriginal = '621191289209' //this customer doesn't have sports
    config.doubleSportsOriginal = '621195672327'

    //15006552947169435961007
    config.doubleSportsOriginalPendingCancel = '621193088559'

    //14956129502149386283945
    config.skyCinemaPendingCancel= '621189683884'
    
    //    621143061391	131963
  // 42412640941645618
    config.skyLegacyHdSports = '621143061391'
    //621141465164	13062470287220720637499
    config.skyNonHdBox = '621141465164'


    // 621192371147	14994383397189435961089
    config.skyOriginalSingleSport = '621192371147'

    //621193073536	15006257692699435961049
    config.skyOriginalAllSports = '621193073536'

    // 621195221083	15052946948479492542732
    config.skyOriginalCinema = '621195221083'

    // 621190372105	14967482569919386283964
    config.skyOriginalTripleSportsCinmea = '621190372105'

    // 621192186321	14992645201539435961056
    config.skyOriginalAllSportsCinema = '621192186321'


    //legacy customers with original/variety + an SD or HD box
    config.legacyOriginalNoSportsNoCinemaSDBox = ''
    config.legacyOriginalNoSportsNoCinemaHDBox = '621193606467'
    config.legacyVarietyNoSportsNoCinemaSDBox = '621137549286' //621137209840
    config.legacyVarietyNoSportsNoCinemaHDBox = ''

    //legacy customers with original/variety + an SD or HD box & SPORTS
    config.legacyOriginalSportsSDBox = ''
    config.legacyOriginalSportsHDBox = '621193969444' //621193605907 //621193605865
    config.legacyVarietySportsSDBox = '621135719527'
    config.legacyVarietySportsHDBox = '621193171033'

    //legacy customers with original/variety + an SD or HD box & CINEMA
    config.legacyOriginalCinemaSDBox = '621136885079'
    config.legacyOriginalCinemaHDBox = ''
    config.legacyVarietyCinemaSDBox = '621138615052'
    config.legacyVarietyCinemaHDBox = ''

    //legacy customers with original/variety + an SD or HD box & SPORTS + CINEMA
    config.legacyOriginalSportsCinemaSDBox = '621136885079' //621136096594
    config.legacyOriginalSportsCinemaHDBox = '621193605923' //621193605840 //621193605824
    config.legacyVarietySportsCinemaSDBox = '621135781378' //621136116210
    config.legacyVarietySportsCinemaHDBox = '621195970317'


    //621189696217	14956309728239386283986
    config.signleSportsPlusLegacyF1 = ''
    config.doubleSportsPlusLegacyF1 = ''
    config.tripleSportsPlusLegacyF1 = ''

    //430000076173	13304472334178271322118
    config.skyPlusVarietyROI = '430000076173'

    // Customers with the following portfolio
    // Sky+ Subscription	10113	RQ
    // Original	14395	RQ
    // Sky HD Remote Control (Installed)	11645	AI
    // Viewing Card	10137	RQ
    // Sky Go Pre Installation	14397	PA
    // Sky+HDw	13787	AI

    config.skyPlusOriginal1 = '621192704594'
    config.skyPlusOriginal2 = '621192701780'
    // 621193681148   15021137513799435961034
    config.skyPlusOriginal3 = '621193681148'
    config.skyPlusOriginal4 = '621195470318'
    config.skyPlusOriginal5 = '621192701624'
    config.skyPlusOriginal6 = '621191370223'
    config.skyPlusOriginal7 = '621192681834'
    config.skyPlusOriginal8 = '621191471187'
    config.skyPlusOriginal9 = '621191370231'
    config.skyPlusOriginal9_partyId = '14980529208049408436115'
    // 621191471252	14981247131209408436163
    config.skyPlusOriginal13 = '621174276280'
    // 621191473894	14981301607569408436122
    config.skyPlusOriginal14 = '621191473894'
    config.skyPlusOriginal14_partyId = '14981301607569408436122'
    config.skyPlusOriginal15 = '621189706404'
    config.skyPlusOriginal15_partyId = '14957131730949386283984'


    config.skyVarietyLegacyHd2= '621195279982'

    config.skyNoCinemNoSports1 = '621143028010'
    config.skyNoCinemNoSports2 = '621193681320'
    config.skyNoCinemNoSports3 = '621193681346'
    config.skyNoCinemNoSports4 = '621193681486'
    config.skyNoCinemNoSports5 = '621193681502'
    config.skyNoCinemNoSports6 = '621196969557'
    config.skyNoCinemNoSports7 = '621196969573'
    config.skyNoCinemNoSports8 = '621196969599'
    config.skyNoCinemNoSports9 = '621196969615'
    config.skyNoCinemNoSports10 = '621196969631'

    // Customers with the following portfolio
    // 10113	Sky+ Subscription		EN
    // 10108	Bonus Sky Sports 3		EN
    // 13729	Sports		EN
    // 10110	Bonus Sky Sports Xtra		EN
    // 14395	Original	EN
    // 14397	Sky Go Pre Installation		CN
    // 10137	Viewing Card	A
    // 11645	Sky HD Remote Control (Installed)	IN
    // 13787	Sky+HDw	Sky+HDw	Sky+HD	IN

    //      621191474165	14981308393069408436183
    config.skyPlusOriginalDualsports1 = '621191474165'
    //      621191474181	14981308707229408436180
    config.skyPlusOriginalDualsports2 = '621191474181'
    //      621191474207	14981309018549408436177
    config.skyPlusOriginalDualsports3 = '621191474207'
    //      621191474223	14981309329729408436174
    config.skyPlusOriginalDualsports4 = '621191474223'
    //      621191474249	14981309639979408436171
    config.skyPlusOriginalDualsports5 = '621191474249'
    //      621191474264	14981309950879408436168
    config.skyPlusOriginalDualsports6 = '621191474264'
    //      621191474280	14981310262659408436165
    config.skyPlusOriginalDualsports7 = '621191474280'
    //      621191474306	14981310574229408436162
    config.skyPlusOriginalDualsports8 = '621191474306'
    //      621191474322	14981310885149408436159
    config.skyPlusOriginalDualsports9 = '621191474322'
    //      621191474348	14981311196529408436156
    config.skyPlusOriginalDualsports10 = '621191474348'
    //      621191474363	14981311515089408436153
    config.skyPlusOriginalDualsports11 = '621191474363'
    //      621191474389	14981311826379408436150
    config.skyPlusOriginalDualsports12 = '621191474389'
    //      621191474405	14981312136569408436147
    config.skyPlusOriginalDualsports13 = '621191474405'
    //      621191474421	14981312447139408436144
    config.skyPlusOriginalDualsports14 = '621191474421'
    //      621191474447	14981312760599408436141
    config.skyPlusOriginalDualsports15 = '621191474447'

    // Customers with the following portfolio
    // 10113	Sky+ Subscription	EN
    // 10109	Bonus Sky Cinema Premiere	EN
    // 14395	Original	EN
    // 10111	Sky Cinema Disney	EN
    // 13730	Cinema		EN
    // 14397	Sky Go Pre Installation	CN
    // 11645	Sky HD Remote Control (Installed)	IN
    // 13787	Sky+HDw	IN
    // 10137	Viewing Card	A

    //       621191473837	14981300984399408436194
    config.skyPlusOriginalCinema1 = '621191473837'
    //       621191473878	14981301297149408436125
    config.skyPlusOriginalCinema2 = '621191473951'
    //      621191473894	14981301607569408436122
    config.skyPlusOriginalCinema3 = '621191473894'
    //      621191473910	14981301917519408436119
    config.skyPlusOriginalCinema4 = '621191473910'
    //      621191473936	14981302227619408436116
    config.skyPlusOriginalCinema5 = '621191473936'
    //      621191473951	14981302539759408436113
    config.skyPlusOriginalCinema6 = '621191473977'
    //      621191473977	14981302849579408436110
    config.skyPlusOriginalCinema7 = '621191473878'
    //      621191473993	14981303164879408436107
    config.skyPlusOriginalCinema8 = '621191473993'
    //      621191474017	14981303475989408436104
    config.skyPlusOriginalCinema9 = '621191474017'
    //      621191474033	14981303787909408436101
    config.skyPlusOriginalCinema10 = '621191474033'
    //      621191474058	14981304099849408436198
    config.skyPlusOriginalCinema11 = '621191474058'
    //      621191474074	14981304411209408436195
    config.skyPlusOriginalCinema12 = '621191474074'
    //      621191474090	14981304722689408436192
    config.skyPlusOriginalCinema13 = '621191474090'
    //      621191474116	14981305032899408436189
    config.skyPlusOriginalCinema14 = '621191474116'
    //      621191474140	14981305346839408436186
    config.skyPlusOriginalCinema15 = '621191474140'


    // Big Basics Contract Customers
//     621199919799 15124756985629572402355
    config.skyBigBasicsContract1 = '621199919799'
//     621199919815	15124757330479572402343
    config.skyBigBasicsContract2 = '621199919815'
//     621199919831	15124757669839572402331
    config.skyBigBasicsContract3 = '621196672961'
//     621199919856	15124758009949572402319
    config.skyBigBasicsContract4 = '621199919856'
//     621199919872	15124758350669572402307
    config.skyBigBasicsContract5 = '621199919872'
//     621196672466 15078985340069547968101
    config.skyBigBasicsContract6 = '621196672466'
//     621196672482 15078985675809547968189
    config.skyBigBasicsContract7 = '621196672482'
// "621199920425" "15124876972179572402359",
    config.skyBigBasicsContract8 = '621199920425'
//     621196672524 15078986327099547968165
    config.skyBigBasicsContract9 = '621196672524'
//     621196672540 15078986643709547968153
    config.skyBigBasicsContract10 = '621196672540'
//     621196672565 15079005697469547968141
    config.skyBigBasicsContract11 = '621196672565'
//     621196672581 15079006036519547968129
    config.skyBigBasicsContract12 = '621196672581'
//     621196672607 15079006354369547968117
    config.skyBigBasicsContract13 = '621196672607'
//     621196672623 15079006670219547968105
    config.skyBigBasicsContract14 = '621196672623'
//     621196672649 15079006992589547968193
    config.skyBigBasicsContract15 = '621196672649'
//     621196672664 15079008132079547968181
    config.skyBigBasicsContract16 = '621196672664'
//     621196672680 15079008451939547968169
    config.skyBigBasicsContract17 = '621196672680'
//     621196672706 15079008770599547968157
    config.skyBigBasicsContract18 = '621196672706'
//     621196672722 15079009090399547968145
    config.skyBigBasicsContract19 = '621196672722'
//     621199919914	15124762868809572402383
    config.skyBigBasicsContract20 = '621199919914'
    config.skyBigBasicsContractKids1 = '621198708409'


    //Rose Customer for MM
    config.skyBigBasicsNoAddOns   = '621206217658'

    //621197169736	15088509992009572402334
    config.skyBigBasics1Sports = '621197169736'

    //621197169793	15088510966839572402332
    config.skyBigBasicsAllSports = '621197169793'


    //621197790358  15096394222569572402335
    config.skyBigBasicsSportsContract = '621197790358'

    // 621197169827	15088516718299572402332
    config.skyBigBasicsCinema = '621197169827'

    //621197169843	15088520618569572402333
    config.skyBigBasicsDoubleeSportsCinema = '621197169843'



    // 621197169868	15088525175099572402349
    config.skyBigBasicsAllSportsCinema = '621197169868'


    //621189985602	14961581676259386283998
    config.skyVariety2 = '621189986428'


     // 621347609367     15054010285864124184374
     config.skyOriginalCinemaContract = '621347609367'


    // 621198503131 15104127826469572402369
    config.skyBigBasicsKids = '621198503131'


    // 621197275699	15089250273029572402314
    config.skyBigBasicsSingleSportsKids = '621197275699'

    //  621197275715	15089254666359572402325
    config.skyBigBasicsAllSportsKids = '621197275715'

    // 621197275780	15089257574689572402359
    config.skyBigBasicsCinemaKids = '621197275780'

    //621197282406	15089368571639572402328
    config.skyBigBasicsSingleSportsCinemaKids = '621197282406'

    // 621197282588	15089370663909572402316
    config.skyBigBasicsAllSportsCinemaKids = '621197282588'

    // 621194673359	15041006672089492542734
    config.skyVariety = '621194673359'



    config.skyBigBasicsBoxSets = '621206217070'

    // 621198502455 15104117912519572402301
    config.skyBigBasicsDoubleSportsBoxSets = '621198502455'

    // 621197285524	1508941855105957240230
    config.skyBigBasicsAllSportsBoxSets = '621197285524'


    // 621197285664	15089426885829572402344
    config.skyBigBasicsCinemaBoxSets = '621197285664'

    //621197285821	15089436358659572402318
    config.skybigBasicsSingleSportsCinemaBoxSets = '621197285821'

    // 621197285946	15089437951529572402333
    config.skybigBasicsAllSportsCinemaBoxSets = '621197285946'

    // "621199255103", "15111963624899572402360",
    config.skybigBasicsHdBasic = '621199255103'


    // "621199247555", "15111802363629572402330",
    config.skybigBasicsTripleSportsHdBasic = '621199247555'

    // 621197069860	15087665034949572402307
    config.skybigBasicsAllSportsHdBasic ='621197069860'

    //621199918528   15123891426449572402377
    config.skybigBasicsCinemaHdBasic = '621199918528'

    //621197069951	15087680405619572402353
    config.skybigBasicsSingleSportsCinemaHdBasic ='621197069951'

    // 621197069985	15087682571899572402377
    config.skybigBasicsAllSportsCinemaHdBasic = '621197069985'


    // 621196969367	15083298844089569587822
    config.skyBigBasicsKidsBoxSets = '621196969367'


    // 621197070124	15087692830469572402329
    config.skyBigBasicsSingleSportsKidsBoxSets = '621197070124'


    //621197070140	15087694320629572402352
    config.skyBigBasicsAllSportsKidsBoxSets = '621197070140'

    //  "621199253637", "15111940854819572402356"
    config.skyBigBasicsCinemaKidsBoxSets = '621199253637'

    // 621197070249	15087698112249572402390
    config.skyBigBasicsSingleSportsCinemaKidsBoxSets ='621197070249'


    // 621197070264	15087699741149572402326
    config.skyBigBasicsAllSportsCinemaKidsBoxSets = '621197070264'

    // 621196969383	15083300050509569587835
    config.skyBigBasicsKidsHdBasics = '621196969383'

    // 621197169371	15088483226199572402300
    config.skyBigBasicsSingleSportsKidsHdBasics = '621197169371'

    // 621197169413	15088484767979572402324
    config.skyBigBasicsAllSportsKidsHdBasics = '621197169413'

    // 621197169454	15088486617179572402350
    config.skyBigBasicsCinemaKidsHdBasics = '621197169454'

    // 621197169496	15088488113809572402377
    config.skyBigBasicsSingleSportsCinemaKidsHdBasics = '621197169496'

    // 621197170346	15088549907809572402365
    config.skyBigBasicsAllSportsCinemaKidsHdBasics = '621197170346'


    // 621196969441	15083301347549569587849
    config.skyBigBasicsBoxSetsHdBasics = '621196969441'

    // 621197169660	15088502998059572402381
    config.skyBigBasicsDoubleSportsBoxSetsHdBasics = '621197169660'

    // 621197169694	15088504942239572402309
    config.skyBigBasicsAllSportsBoxSetsHdBasics = '621197169694'

    //   "621199247001", "15111786486099572402313"
    config.skyBigBasicsCinemaBoxSetsHdBasics = '621199247001'

    // 621197170148	15088537949989572402324
    config.skyBigBasicsSingleSportsCinemaBoxSetsHdBasics = '621197170148'

    // 621197170296	15088542042099572402327
    config.skyBigBasicsAllSportsCinemaBoxSetsHdBasics = '621197170296'


    // 621197170353	15088561719859572402304
    config.skyBigBasicsSingleSportsHdSports = '621197170353'

    //    621143061391	13196342412640941645618
    config.skyLegacyHdSports = '621143061391'  // burned need to be replaced, if possible
    //621141465164	13062470287220720637499
    config.skyNonHdBox = '621141465164'  // burned need to be replaced, if possible

    config.skyOriginalLegacyHd = '621191097693'
    
    //621143677477
    config.skyOriginalLegacyHdSports ='621143677477'
    
    //621136666644
    config.skyVarietyLegacyHd = '621136666644'

    //621195221083	15052946948479492542732
    config.skyOriginalCinema ='621195221083'
    // 621193076158   15006269105979435961029
    config.skyVarietyCinema ='621193171181'
    
 //SABB Customers
    config.uksabb = '621189985602'

    //Legacy customer for rose
    //621189985602	14961581676259386283998
    config.skyOriginal = '621189985602'
    // 621192371147	14994383397189435961089
    config.skyOriginalSingleSport = '621192371147'

    //621193073536	15006257692699435961049
     config.skyOriginalAllSports = '621193073536'

    // 621195221083	15052946948479492542732
    config.skyOriginalCinema = '621195221083'

    // 621190372105	14967482569919386283964
    config.skyOriginalTripleSportsCinmea = '621190372105'

    // 621192186321	14992645201539435961056
    config.skyOriginalAllSportsCinema = '621192186321'

    config.skyVariety = '621194673359'
    config.skyBoxsets = '621201321737'


    // 	621197170379	15088565448639572402312
    config.skyBigBasicsAllSportsHdSports = '621197170379'

    // 621197275574	15089236873279572402344
    config.skyBigBasicsDoubleSportsCinemaHdSports = '621197275574'

    // 621197275590	15089240038459572402370
    config.skyBigBasicsAllSportsCinemaHdSports = '621197275590'

    config.skyNonContractBigBasicsKids = '621191370272'


    ///Migrated customers ///
    //  no sport no cinema   >>> Sky Ent.
    // 621192172404	14992500779279435961029
    config.MigratedToSkyEnt = '621192172404'

    //  doubleSport
    //  621193071787    15005634238979435961023
    config.MigratedToSkyEntDoubleSports = '621193071787'


 //  cinema no sports
 //  621190069651       14963093544059392909389
    config.MigratedToSkyEntCinema = '621190069651'

 //  all sports cinema
 //  621193074310	15006261475679435961046
    config.MigratedToSkyEntAllSportsCinema ='621193074310'

    //  all sports no cinema
 //  621190673478  	14972578041759408436188
 //  621192572637  14998547263759435961031
    config.MigratedToSkyEntAllSportsBoxsets = '621190673478'
    config.MigratedToSkyEntAllSports = '621192572637'




 //   Sky Entertainment Contract + Contracts Sports + No Cinema
 //  "621199283147",  "15112607732519572402315",
    config.skyBigBasicsSportsContract2 = '621199283147'

    //       Sky Entertainment Contract + No Sports + Contract Cinema
 //     "621199283170",  "15112608079899572402312",
    config.skyBigBasicsCinemaContract = '621199283170'

    //   Sky Entertainment Contract + Sports 2 Pack + Contract Cinema
 //   "621199283204",  "15112608419419572402309",
    config.skyBigBasicsDoubleSportsCinemaContract = '621199283204'

    //       Sky Entertainment Contract + CONTRACT Sports + Cinema
 //    "621199283238", "15112608758009572402306",
    config.skyBigBasicsSportsContractCinema = '621199283238'
//
 //   SKY Entertainment Contract + Kids + Contracts Sports + No Cinema
 // "621199283261",  "15112609092919572402303",
    config.skyBigBasicsSportsContractKids = '621199283261'


 //   SKY Entertainment Contract + Kids + No Sports + Contract Cinema
 //   "621199283410",  "15112611351309572402363",
    config.skyBigBasicsCinemaContractKids = '621199283410'

 //       SKY Entertainment Contract + Kids + Sports 1 Pack + Contract Cinema
 //  "621199283451",  "15112611694999572402374",
        config.skyBigBasicsCinemaContractSingleSportsKids = '621199283451'

 //       SKY Entertainment Contract + Kids + Contract Sports + Cinema
 //    "621199283493", "15112612041499572402375",
    config.skyBigBasicsSportsContractCinemaKids = '621199283493'

    //       Sky Entertainment Contract + Box Sets + Contracts Sports + No Cinema
 //  "621199283535", "15112612381369572402376",
    config.skyBigBasicsSportsContractBoxSets = '621199283535'

    //       Sky Entertainment Contract + Box Sets + No Sports + Contract Cinema
 //   "621199283717",  "15112614394339572402377",
    config.skyBigBasicsCinemaContractBoxSets =  '621199283717'

    //       Sky Entertainment Contract + Box Sets + Sports 1 Pack + Contract Cinema
 //    "621199283733", "15112614738299572402365",
    config.skyBigBasicsSingleSportsCinemaContractBoxsets =  '621199283733'

 //       Sky Entertainment Contract + Box Sets + Contract Sports + Cinema
 //   "621199283790",  "15112615101639572402371",
     config.skyBigBasicsSportsContractCinemaBoxsets =  '621199283790'

    //       Sky Entertainment Contract + HD Basics + Contracts Sports + No Cinema
 //    "621199283832", "15112615440939572402396",
      config.skyBigBasicsSportsContractHdBasic = '621199283832'

    //       Sky Entertainment Contract + HD Basics + No Sports + Contract Cinema
 //   "621199283873",  "15112615781569572402321”,
        config.skyBigBasicsCinemaContractHdBasic = '621197270187'

    //   Sky Entertainment Contract + HD Basics + Contract Sports + Cinema
 //    "621199284814","15112625858949572402377",
         config.skyBigBasicsSportsContractCinemaHdBasic = '621199284814'

 //       Sky Entertainment Contract + HD Basics + Sports 1 Pack + Contract Cinema
 //   "621199284830",  "15112626199459572402365",
     config.skyBigBasicsSingleSportsCinemaContractHdBasic = '621199284830'

 //       Sky Entertainment Contract + Kids + Box Sets + No Sports + Contract Cinema
 //  "621199284855", "15112626540359572402353",
         config.skyBigBasicsCinemaContractBoxsetsKids = '621199284855'

 //       Sky Entertainment Contract + Kids + Box Sets + Sports 1 Pack + Contract Cinema
 //    "621199284871", "15112626880669572402341",
      config.skyBigBasicsSingleSportsCinemaContractBoxsetsKids = '621199284871'

 //       Sky Entertainment Contract + Kids + Box Sets + Contract Sports + Cinema
 //  "621199284897", "15112627215719572402329",
      config.skyBigBasicsSportsContractCinemaBoxsetsKids = '621199284897'

 //       Sky Entertainment Contract + Kids + HD Basics + Contracts Sports + No Cinema
 //   "621199284921", "15112628444649572402317",
      config.skyBigBasicsSportsContractHdBasicKids = '621199284921'

    //Sky Entertainment Contract + Kids + HD Basics + No Sports + Contract Cinema
 //    "621199284962",  "15112628779439572402305",
     config.skyBigBasicsCinemaContractHdBasicKids = '621199284962'

 //       Sky Entertainment Contract + Kids + HD Basics + Sports 1 Pack + Contract Cinema
 //    "621199284988", "15112629118509572402393",
     config.skyBigBasicsSingleSportsCinemaContractHdBasicKids = '621199284988'

 //       Sky Entertainment Contract + Kids + HD Basics + Contract Sports + Cinema
 //    "621199285001", "15112629457629572402381",
      config.skyBigBasicsSportsContractCinemaHdBasicKids = '621199285001'

 //       Sky Entertainment Contract + Box Sets + HD Basics + Contracts Sports + No Cinema
 //     "621199285027",  "15112629797859572402369",
     config.skyBigBasicsSportsContractBoxSetsHdBasic = '621199285027'

 //       Sky Entertainment Contract + Box Sets + HD Basics + No Sports + Contract Cinema
 //   "621199285035",  "15112630920499572402357",
     config.skyBigBasicsCinemaContractBoxSetsHdBasic = '621199285035'

 //       Sky Entertainment Contract + Box Sets + HD Basics + Sports 1 Pack + Contract Cinema
 //    "621199285068", "15112631303669572402345",
     config.skyBigBasicsSingleSportsCinemaContractBoxsetsHdBasic = '621199285068'

    //       Sky Entertainment Contract + Box Sets + HD Basics + Contract Sports + Cinema
 //  "621199285092",    "15112631641429572402333",
    config.skyBigBasicsSportsContractCinemaBoxsetsHdBasic = '621199285092'

 //       Sky Entertainment Contract + HD Sports + Contracts Sports + No Cinema
 //    "621199285241", "15112634135739572402361”,
      config.skyBigBasicsSportsContractHdSports = '621199285241'

 //   Sky Entertainment Contract + HD Sports + Sports 2 Pack + Contract Cinema
 //   "621199285175", "15112633117899572402397",
    config.skyBigBasicsDoubleeSportsCinemaContractHdSports = '621199285175'

    //   Sky Entertainment Contract + HD Sports + Contract Sports + Cinema
 //    "621199285191",  "15112633457269572402385",
      config.skyBigBasicsSportsContractCinemaHdSportsHdBasic = '621199285191'


//  Sky Entertainment Contract +Kids + + HD Basics + HD Sports + Contract Sports + Cinema  >> Nothing
//  "accountNumber": "621199285225",
//      "partyId": "15112633796189572402373",
 config.skyBigBasicsSportsContractCinemaHdBasicKidsHdSports='621199285225'

//      Sky Entertainment Contract +Box sets + + HD Basics + HD Sports + Contract Sports + Cinema     >> Nothing
//  "accountNumber": "621199285332",
//      "partyId": "15112634476059572402349”,
    config.skyBigBasicsSportsContractCinemaHdBasicBoxsetsHdSports='621199285332'

//  Sky Entertainment Contract +Kids + Boxsets + HD Sports + Contract Sports + Cinema >>      UPSELL Nothing
//  "accountNumber": "621199285712",
//      "partyId": "15112645821189572402337",
    config.skyBigBasicsSportsContractCinemaKidsBoxsetsHdSports='621199285712'

//      Sky Entertainment Contract +Kids + Boxsets + HD Sports + Contract Sports          UPSELL  >> CINEMA
//  "accountNumber": "621199285738",
//      "partyId": "15112646163259572402325",
    config.skyBigBasicsSportsContractKidsBoxsetsHdSports='621199285738'

//      Sky Entertainment Contract + Boxsets +  + HD SPORTS + Contract Sports    + CINEMA  UPSELL >> HD BASIC
//  "accountNumber": "621199285753",
//      "partyId": "15112646504269572402313",
    config.skyBigBasicsSportsContractCinemaBoxsetsHdSports='621199285738'

//      Sky Entertainment Contract + Boxsets +  + HD SPORTS + Contract Sports          UPSELL  >> CINEMA
//  "accountNumber": "621199285779",
//      "partyId": "15112646844619572402301",
    config.skyBigBasicsSportsContractBoxsetsHdSports='621199285779'

  config.graphQLTestUser =  '621192701780@dtE02PR.com'
  config.graphQLTestPassword =   'test1234'


  //621199920136 15124819512669585484961
  config.skyMobilePreactive='621199920136'
  config.skyMobilePreactivePartyId='15124819512669585484961'
  //621199920235	15124830083949585484997
  config.skyMobileActive1='621199920235'
  config.skyMobileActive1PartyId='15124830083949585484997'
  //621199920243	15124830109639585484903
  config.skyMobileActive2='621199920243'
  config.skyMobileActive2PartyId='15124830109639585484903'
  //621199920250	15124830140219585484909
  config.skyMobileActive3='621199920250'
  config.skyMobileActive3PartyId='15124830140219585484909'
  //621199920268	15124830167979585484915
  config.skyMobileActive4='621199920268'
  config.skyMobileActive4PartyId='15124830167979585484915'
  //621199920276	15124830191839585484921
  config.skyMobileActive5='621199920276'
  config.skyMobileActive5PartyId='15124830191839585484921'

  // customers unable to create valid sessions
  config.inflight1='621188778362'
  config.inflight2='621143304106'
  config.preactive='621200117516'
  config.preActiveCancelled='621193975474'
  config.postActiveCancelled1='621190776453'
  config.postActiveCancelled2='621190070030'
  config.debtManagement='621189195962'
  config.coreAccountDebt1='621190070352'
  // config.coreAccountDebt2='630001250418'
  config.coreAccountDebt3='621187700227'
  config.multi_billing_acc2='621193679027'
  config.multi_billing_acc3='621192893132'
  config.multi_billing_acc4='621192893132'

  config.SABB_BBUL_Hub20ONE='621205116497'
  config.SABB_BBUL_Hub20TWO='621205116570'
  config.SABB_BBUL_Hub30ONE='621205116729'
  config.SABB_BBUL_Hub30TWO='621205116752'
  config.SABB_BBUL_QHubONE='621205116794'
  config.SABB_BBUL_QHubTWO='621205116869'

  config.SABB_BB12_Hub20ONE='621205217956'
  config.SABB_BB12_Hub30ONE='621205218004'
  config.SABB_BB12_QHubONE='621205218079'
  config.SABB_FibreUL_Hub20ONE='621205218335'
  config.SABB_FibreUL_Hub30ONE='621205218301'
  config.SABB_FibreUL_QHubONE='621205218269'
  config.SABB_Fibre_Hub20ONE='621205218103'
  config.SABB_Fibre_Hub30ONE='621205218186'
  config.SABB_Fibre_QHubONE='621205218228'



  config.TriplePlayOne='621136096594'
  config.TriplePlayTwo='621141244858'
  config.TriplePlayThree='621139694114'


}


