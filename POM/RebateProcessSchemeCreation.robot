*** Settings ***
Library  Process
Library  SeleniumLibrary
Library  BuiltIn
Library    OperatingSystem
Library    ../Resources/Utility.py
Library    Collections
Library    String
Library    JSONLibrary
Library    RPA.Desktop
Library    RPA.Windows
Resource    SchemeIndex.robot

*** Variables ***
#Login Page
${UserName_loc}  xpath://*[@name="userName"]
${Password_loc}  xpath://input[@name='password']
${Login_loc}    xpath://button[@type='button']
${Browser}      chrome

#Rebate Scheme creation tab
${PageTitle}    Rebate Process-Scheme Creation
${Rownumber}    0
${AddNewScheme}     //button[@title='Add New scheme']
${CompanyCode}      //*[@name='comcodefrom']
${Schemecategory}   //select[@name='schemeCategory']
${Calschemetype}       //select[@name='schemeType']
${Schemetype}       //select[@name='custschemeType']
${Schemenarration}      //input[@name='schemeNaration']
${Fromdate}     //input[@name='scheme.fromDate']
${Fromdate_Parent_scheme}    //input[@formcontrolname='fromDate']
${Todate}     //input[@name='scheme.toDate']
${Todate_Parent_scheme}    //input[@formcontrolname='toDate']
#No.of Days
${Schemeduration}   30
${Schemeperiod}  //select[@name='schemePeriod']
${Zone}  //select[@name='scheme.regionId']
${Announcementdate}     //input[@name='scheme.announcementDate']

#Locators for Elements on Sales Organisation section
${ExpandSalesOrg}   //div[@id='accordion1']//i[@class='fa fa-chevron-down']
${SalesOrg}  //select[@name='sorgFrom']
${DistChannel}  //select[@name='dcFrom']
${Division}  //select[@name='div1']

#Locators for Elements on Sales Data Section
${ExpandSalesData}  //div[@id='accordion2']//i[@class='fa fa-chevron-down']
${CustomerRegion}  //select[@name='cr1']

#Locators for Elements on Other Characteristics Section
${ExpandOtherChar}  //div[@id='accordion4']//i[@class='fa fa-chevron-down']
${DiscountAccount}  //select[@name='scheme.glAccountItem']
${LiableAccount}  //select[@name='scheme.liaGlAccount']

#Upload document
${ChooseFile}    //input[@id='attachment']
${UploadDoc}    //button[@type='button' and contains(text(),' Upload Document ')]

#Select slab Type
${SlabGrid}  //input[@value='slab']
${SlabType}  //select[@name='schemeType1']

#Qty
${FirstQty}     //table[@class='table table-sm table-bordered']/tbody/tr[1]/td[1]
${SecQty}       //table[@class='table table-sm table-bordered']/tbody/tr[2]/td[1]
${ThirdQty}     //table[@class='table table-sm table-bordered']/tbody/tr[3]/td[1]
${FourthQty}    //table[@class='table table-sm table-bordered']/tbody/tr[4]/td[1]
${FifthQty}    //table[@class='table table-sm table-bordered']/tbody/tr[4]/td[1]
${SixthQty}    //table[@class='table table-sm table-bordered']/tbody/tr[4]/td[1]
${SeventhQty}    //table[@class='table table-sm table-bordered']/tbody/tr[4]/td[1]
#Rate per Bag
${FirstRate}    (//td[@class='ng-star-inserted']/input[@type='text'])[1]
${SecondRate}   (//td[@class='ng-star-inserted']/input[@type='text'])[2]
${ThirdRate}    (//td[@class='ng-star-inserted']/input[@type='text'])[3]
${FourthRate}   (//td[@class='ng-star-inserted']/input[@type='text'])[4]
${FifthRate}    (//td[@class='ng-star-inserted']/input[@type='text'])[5]
${SixthRate}    (//td[@class='ng-star-inserted']/input[@type='text'])[6]
${SeventhRate}  (//td[@class='ng-star-inserted']/input[@type='text'])[7]

#View Schem button
${ViewScheme}   //button[@type='button' and contains(text(),'View Scheme')]

#Submit Scheme button
${Submit}   //button[@type='button' and contains(text(),'Submit')]

#Filter scheme with scheme number for approval
#${Filters}  //button[@title='Discount Calculation' and contains(text(),'Filters')]
${Filters}  //button[@type='button' and contains(text(),' Filters ')]
${ResetFilter}  //span[contains(text(),'Reset')]
${Rateperbag}   //tbody/tr[1]/td[2]/input[1]
${GetData}  //span[contains(text(),'Get Data')]
${SchemeNumber_loc}   //input[@name='schemeNumber']

#Scheme3 Variables
${PreQualifierType}    //select[@name='scheme.customSchDefinition']
${PrevFromDateQualifier}    //input[@name='prevfromDate']
${PrevToDateQualifier}    //input[@name='prevtoDate']
${PrePeriodFromDate}    //input[@name='qualifierFromDate']
${PrePeriodToDate_loc}    //input[@name='qualifierToDate']
${PrePeriodMinQty}    //input[@name='prePreiodMinQty']
${PrePeriodMaxQty}    //input[@name='prePreiodMaxQty']
${FirstRPB}    //tbody/tr[1]/td[2]/input[1]
${SecondRPB}    //tbody/tr[2]/td[2]/input[1]
${ThirdRPB}    //tbody/tr[3]/td[2]/input[1]
${FourthRPB}    //tbody/tr[4]/td[2]/input[1]
${FifthRPB}    //tbody/tr[5]/td[2]/input[1]

#Scheme4 variables
${RakeQty}    //input[@name='rakequantity']
${OnlyRake}    //label[@class='radio-inline' and contains(text(), 'Only Rake')]/input[@name='rakeType' and @value='1']

#Scheme5 variables
${MinQtyInTons}    //input[@name='minqty' and @type='number']

#Scheme6 Variables
${SalesOrgSearch}    (//i[@class='fa fa-search-plus'])[2]
${SelectValues}    (//select[@name='c1'])[1]
${CloseSelectValues}    (//button[@type='button' and contains(text(),'Close')])[1]
${rateOne}    //tbody/tr[1]/td[2]/input[1]
${rateTwo}    //tbody/tr[2]/td[2]/input[1]
${rateThree}    //tbody/tr[3]/td[2]/input[1]
${rateFour}    //tbody/tr[4]/td[2]/input[1]

#Scheme7 Variables
${SubStates}    //select[@name='ss1']

#Scheme9 Variables
${CustomerRegionFilters}    (//i[@class='fa fa-search-plus'])[6]

#Scheme10 Variables
${CompanyCodeFilters}    (//i[@class='fa fa-search-plus'])[1]
${DistricutionChannelFilters}    (//i[@class='fa fa-search-plus'])[3]
# ${DivisionFilters}    (//i[@class='fa fa-search-plus'])[4]
${DivisionFilters}    (//i[@class='fa fa-search-plus'])[3]
${PlantFilters}    (//i[@class='fa fa-search-plus'])[5]
${Customerfrom}    //input[@name='cust1' and @placeholder='from']
${Customerto}    //input[@name='cust2' and @placeholder='to']

#scheme11 Variables
${SixthRPB}    //tbody/tr[6]/td[2]/input[1]
${SeventhRPB}    //tbody/tr[7]/td[2]/input[1]
${EighthRPB}    //tbody/tr[8]/td[2]/input[1]
${NinthRPB}    //tbody/tr[9]/td[2]/input[1]
${TenthRPB}    //tbody/tr[10]/td[2]/input[1]
${EleventhRPB}    //tbody/tr[11]/td[2]/input[1]
${TwelvethRPB}    //tbody/tr[12]/td[2]/input[1]
${ThirteenthRPB}    //tbody/tr[13]/td[2]/input[1]
${FourteenthRPB}    //tbody/tr[14]/td[2]/input[1]
${FifteenthRPB}    //tbody/tr[15]/td[2]/input[1]
${SixteenthRPB}    //tbody/tr[16]/td[2]/input[1]
${SeventeenthRPB}    //tbody/tr[17]/td[2]/input[1]
${EighteenthRPB}    //tbody/tr[18]/td[2]/input[1]
${NineteenthRPB}    //tbody/tr[19]/td[2]/input[1]
${TwentiethRPB}    //tbody/tr[20]/td[2]/input[1]
${TwentyFirstRPB}    //tbody/tr[21]/td[2]/input[1]
${TwentySecondRPB}    //tbody/tr[22]/td[2]/input[1]
${TwentyThirdRPB}    //tbody/tr[23]/td[2]/input[1]
${TwentyFourthRPB}    //tbody/tr[24]/td[2]/input[1]
${TwentyFifthRPB}    //tbody/tr[25]/td[2]/input[1]
${TwentySixthRPB}    //tbody/tr[26]/td[2]/input[1]
${TwentySeventhRPB}    //tbody/tr[27]/td[2]/input[1]
${TwentyEighthRPB}    //tbody/tr[28]/td[2]/input[1]
${TwentyNinthRPB}    //tbody/tr[29]/td[2]/input[1]
${ThirtiethRPB}    //tbody/tr[30]/td[2]/input[1]
${ThirtyFirstRPB}    //tbody/tr[31]/td[2]/input[1]
${ThirtySecondRPB}    //tbody/tr[32]/td[2]/input[1]
${ThirtyThirdRPB}    //tbody/tr[33]/td[2]/input[1]
${ThirtyFourthRPB}    //tbody/tr[34]/td[2]/input[1]
${ThirtyFifthRPB}    //tbody/tr[35]/td[2]/input[1]
${ThirtySixthRPB}    //tbody/tr[36]/td[2]/input[1]
${ThirtySeventhRPB}    //tbody/tr[37]/td[2]/input[1]
${ThirtyEighthRPB}    //tbody/tr[38]/td[2]/input[1]
${ThirtyNinthRPB}    //tbody/tr[39]/td[2]/input[1]
${FortiethRPB}    //tbody/tr[40]/td[2]/input[1]
${FortyFirstRPB}    //tbody/tr[41]/td[2]/input[1]
${FortySecondRPB}    //tbody/tr[42]/td[2]/input[1]
${FortyThirdRPB}    //tbody/tr[43]/td[2]/input[1]
${FortyFourthRPB}    //tbody/tr[44]/td[2]/input[1]
${FortyFifthRPB}    //tbody/tr[45]/td[2]/input[1]
${FortySixthRPB}    //tbody/tr[46]/td[2]/input[1]

#Scheme12 Variables
${CustomerDistricts}    (//i[@class='fa fa-search-plus'])[9]
${CustomerSearch}    (//i[@class='fa fa-search-plus'])[17]
${CustomerSelection}    (//mat-dialog-container//table//div[contains(@class,"ngx-select dropdown")])[1]
${InputCustomer}    //input[@class='ngx-select__search form-control ng-star-inserted' and @type='text']
${ExcludeMaterial}    //input[@name='excludec' and @type='radio']
${MaterialExcluded}    //input[@formcontrolname='material' and @type='text']

#Scheme13 Variables
${PayOutFromDate}    //input[@name='effFrom' and @type='date']
${PayOutToDate}    //input[@name='effTo' and @type='date']
${PartBSlab}     //input[@name='tpartb' and @type='radio']
${SelectPartBSlabType}    //select[@name='schemeType2']
${PartBRate}     //input[@type='text' and contains(@class, 'ng-pristine')]

#Scheme14 Variables
${SalesDistrictFilters}    (//i[@class='fa fa-search-plus'])[7]
${SalesDistInput}    (//input[@role='combobox' and @type='text'])[4]
${profitCenter}    //select[@name='scheme.profitcenterItem']
${Rebate_FileUpload}    //input[@name='slabCat' and @value='file']
${Rebate_ChooseFile}    (//input[@id='attachment'])[2]
${SendFile}    //button[contains(text(), 'Send File')]

#Scheme18 Variables
${IncQty}    //input[@name='incQty' and @type='number']
${DiscountOnActualQuantity}    //input[@name='targetCal' and @value='2']

#Scheme19 Variables
${SlabEntryandFileUpload}    //input[@name='slabCat' and @value='both']

#Scheme20 Variables
${TargetDays}    //input[@name='targetDays' and @type='number']

*** Keywords ***
Load data
    [Arguments]    ${schemename}
    ${data}    Load Json From File    ${CURDIR}/../TestData/TestData.json
    ${test_data}    Set Variable    ${data}[${schemename}]
    Set Global Variable    ${test_data}
    # Set Global Variable    ${test_data}

Enter a new parent scheme
    Sleep    2s
    Click Element    //a[contains(text(),"Parent Scheme Index")]
    Wait Until Element Is Visible    //button[contains(text(),"Add Parent Scheme")]
    Click Element    //button[contains(text(),"Add Parent Scheme")]
    Wait Until Element Is Visible    //label[contains(text(),"Scheme Name")]
    Click Element    //input[contains(@formcontrolname,"schemeName")]
    ${RXDM}    Generate Random String    5
    Input Text    //input[contains(@formcontrolname,"schemeName")]    Test_Automation_Scheme_${RXDM}
    Log To File    Scheme Name : Test_Automation_Scheme_${RXDM}
    Input Text    //input[contains(@formcontrolname,"schemeDescription")]    Test_Automation_Description_${RXDM}
    Log To File    Scheme Description : Test_Automation_Scheme_${RXDM}
    sleep    1s
    Select From List By Value    //select[contains(@formcontrolname,"schemeCategory")]    Standard Scheme
    Log To File    Scheme Category : Standard Scheme
    sleep    1s
    Select From List By Value    //select[contains(@formcontrolname,"schemeType")]    Quantity Discount Scheme
    Log To File    Scheme Type : Quantity Discount Scheme
    Enter FromDate_parent_scheme
    Enter ToDate_parent_scheme
    sleep    1s
    Select From List By Index   //select[contains(@formcontrolname,"schemePeriod")]    1
    Input Text    //textarea[contains(@formcontrolname,"schemeObjective")]    Sample_Test_objective_${RXDM}
    Log To File    Scheme Objective : Sample_Test_objective_${RXDM}
    Click Element    //button[contains(text(),"Add Definition")]
    sleep    2s
    Click Element    //button[contains(text(),"Add Definition")]
    Sleep    1s
    Select From List By Index    (//select[contains(@formcontrolname,"parameter")])[1]    0
    Log To File    KPI Definition parameter : Sales
    Sleep    1s
    Select From List By Index    (//select[contains(@formcontrolname,"unitOfMeasurement")])[1]    1
    Log To File    Unit Of measurement : %
    Sleep    1s
    Input Text    (//input[contains(@formcontrolname,"unitOfMeasurement")])[1]    20
    Log To File    Value : 20
    Sleep    1s
    Select From List By Index    (//select[contains(@formcontrolname,"parameter")])[2]    1
    Log To File    KPI Definition parameter : DSP
    Sleep    1s
    Select From List By Index    (//select[contains(@formcontrolname,"unitOfMeasurement")])[2]    1
    Log To File    Unit Of measurement : %
    Sleep    1s
    Input Text    (//input[contains(@formcontrolname,"unitOfMeasurement")])[2]    40
    Log To File    Value : 40
    sleep    1s
    Click Element    //button[contains(text(),"Save")]
    Sleep    4s
    Alert Should Be Present    action=ACCEPT    timeout=30s
    ${parent_scheme_name}    Set Variable    Test_Automation_Description_${RXDM}
    Set Global Variable    ${parent_scheme_name}

Enter FromDate_parent_scheme
    ${Dateval}  getfirstofcurrentmonth
    Log To File    From Date:${Dateval},
    Click ELement   ${Fromdate_Parent_scheme}
    sleep   2
    Input Text  ${Fromdate_Parent_scheme}  ${Dateval}
    Log To File    From Date Parent Scheme : ${Dateval}
#    sleep   5

Enter ToDate_parent_scheme
    ${NumberOfDays}=    Convert To Integer    ${Schemeduration}
    ${Dateval}   getlastofcurrentmonth
    Log To File    To Date:${Dateval},
    Click ELement   ${Todate_Parent_scheme}
    sleep   2
    Input Text  ${Todate_Parent_scheme}  ${Dateval}
    Log To File    To Date Parent Scheme : ${Dateval}
#    sleep   5
Enter CompanyCode
    #Converting row number to integer as readdata doesn't accept strings
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    companycode  ${rownum}
    # ${data}=    Convert To Integer  ${data}
    Log    ${data}
    Log To File    CompanyCode:${data},
    Wait Until Element Is Visible    ${CompanyCode}    timeout=30s
    Click Element   ${CompanyCode}
    sleep   2
    Select From List By Label  ${CompanyCode}   ${data}
    # For json only
    # Select From List By Label  ${CompanyCode}   ${test_data}[companycode]
#    sleep   5

Enter CompanyCode Filter For Scheme10
    Wait Until Element Is Visible    ${CompanyCodeFilters}    timeout=30s
    Click Element    ${CompanyCodeFilters}
    Sleep    1
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    1000 - Dalmia Cement(Bharat) Ltd
    Log To File    CompanyCode Filter1:1000 - Dalmia Cement(Bharat) Ltd,
    Sleep    1
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    3000 - Dalmia Cement NE Limited
    Log To File    CompanyCode Filter2:3000 - Dalmia Cement NE Limited,
    Sleep    1
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    6000 - Alsthom Industries Ltd
    Log To File    CompanyCode Filter3:6000 - Alsthom Industries Ltd,
    Wait Until Element Is Visible    ${CloseSelectValues}    timeout=30s
    Click Element    ${CloseSelectValues}
    Sleep    1

Enter CompanyCode Filters For Scheme12 
    Wait Until Element Is Visible    ${CompanyCodeFilters}    timeout=30s
    Click Element    ${CompanyCodeFilters}
    Sleep    1
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    1000 - Dalmia Cement(Bharat) Ltd
    Sleep    1
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    4010 - Dalmia B Green Vision Ltd
    Sleep    1
    Wait Until Element Is Visible    ${CloseSelectValues}
    Click Element    ${CloseSelectValues}
    Log To File    CompanyCode Filter1:1000 - Dalmia Cement(Bharat) Ltd, 4010 - Dalmia B Green Vision Ltd,
    Sleep    1

Enter SchemeCategory
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    Schemecategory  ${rownum}
    Log    ${data}
    Log To File    SchemeCategory:${data},
    Wait Until Element Is Visible    ${Schemecategory}    timeout=10s
    Click Element   ${Schemecategory}
    sleep   2
    # For json only
    Select From List By Value  ${Schemecategory}   ${data}
    # Select From List By Value  ${Schemecategory}   ${test_data}[Schemecategory]
#    sleep   5

Enter CalSchemeType
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    Calcschemetype  ${rownum}
    Log    ${data}
    Log To File    CalculationSchemeType:${data},
    Wait Until Element Is Visible    ${Calschemetype}    timeout=30s
    Click Element   ${Calschemetype}
    sleep   2
    Select From List By Value    ${Calschemetype}    ${data}
    #for json only
    # Select From List By Value  ${Calschemetype}   ${test_data}[Calcschemetype]
#    sleep   5

Enter SchemeType
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    Schemetype  ${rownum}
    Log    ${data}
    Log To File    SchemeType:${data},
    Wait Until Element Is Visible    ${Schemetype}    timeout=30s
    Click Element   ${Schemetype}
    sleep   2
    Select From List By Label  ${Schemetype}   ${data}
    # for json only
    # Select From List By Label  ${Schemetype}   ${test_data}[Schemetype]
#    sleep   5

Enter SchemeNarration
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    SchemeNarration  ${rownum}
    Log    ${data}
    Log To File    Scheme Narration:${data},
    Wait Until Element Is Visible    ${Schemenarration}    timeout=30s
    Click Element   ${Schemenarration}
    sleep   2
    Input Text  ${Schemenarration}   ${data}
    #For josn only
    # Input Text  ${Schemenarration}   ${test_data}[SchemeNarration]
#    sleep   5

Enter FromDate
    ${Dateval}  getfirstofcurrentmonth
    Log To File    From Date:${Dateval},
    Click ELement   ${Fromdate}
    sleep   2
    Input Text  ${Fromdate}  ${Dateval}
#    sleep   5

Enter ToDate
    ${NumberOfDays}=    Convert To Integer    ${Schemeduration}
    ${Dateval}   getlastofcurrentmonth
    Log To File    To Date:${Dateval},
    Click ELement   ${Todate}
    sleep   2
    Input Text  ${Todate}  ${Dateval}
#    sleep   5

Enter FromDate For Scheme3
    ${Dateval}    getfromdateforscheme3
    Log To File    From Date:${Dateval},
    Wait Until Element Is Visible    ${Fromdate}    timeout=30s
    Click ELement   ${Fromdate}
    sleep   2
    Input Text  ${Fromdate}  ${Dateval}
#    sleep   5

Enter ToDate For Scheme3
    ${Dateval}   gettodateforscheme3
    Log To File    To Date:${Dateval},
    Wait Until Element Is Visible    ${Todate}    timeout=30s
    Click ELement   ${Todate}
    sleep   2
    Input Text  ${Todate}  ${Dateval}
#    sleep   5

Enter FromDate For Scheme5
    # ${Dateval}    getfromdateforscheme5
    ${Dateval}    Getfromdateforscheme5A
    Log To File    From Date:${Dateval},
    Wait Until Element Is Visible    ${Fromdate}    timeout=30s
    Click ELement   ${Fromdate}
    sleep   2
    Input Text  ${Fromdate}  ${Dateval}

Enter ToDate For Scheme5
    # ${Dateval}   gettodateforscheme5    3
    ${Dateval}   Gettodateforscheme5A
    Log To File    To Date:${Dateval},
    Wait Until Element Is Visible    ${Todate}    timeout=30s
    Click ELement   ${Todate}
    sleep   2
    Input Text  ${Todate}  ${Dateval}

Enter FromDate For Scheme6
    ${Dateval}    Getfromdateforscheme6
    Log To File    From Date:${Dateval},
    Wait Until Element Is Visible    ${Fromdate}    timeout=30s
    Click ELement   ${Fromdate}
    sleep   2
    Input Text  ${Fromdate}  ${Dateval}

Enter ToDate For Scheme6
    ${Dateval}   Gettodateforscheme6
    Log To File    To Date:${Dateval},
    Wait Until Element Is Visible    ${Todate}    timeout=30s
    Click ELement   ${Todate}
    sleep   2
    Input Text  ${Todate}  ${Dateval}

Enter FromDate For Scheme7 
    ${Dateval}    Getfromdateforscheme 7
    Log To File    From Date:${Dateval},
    Wait Until Element Is Visible    ${Fromdate}    timeout=30s
    Click ELement   ${Fromdate}
    sleep   2
    Input Text  ${Fromdate}  ${Dateval}

Enter ToDate For Scheme7
    ${Dateval}   Gettodateforscheme 7
    Log To File    To Date:${Dateval},
    Wait Until Element Is Visible    ${Todate}    timeout=30s
    Click ELement   ${Todate}
    sleep   2
    Input Text  ${Todate}  ${Dateval}

Enter FromDate For Scheme10
    ${Dateval}    Getfromdateforscheme10
    Log To File    From Date:${Dateval},
    Wait Until Element Is Visible    ${Fromdate}    timeout=30s
    Click ELement   ${Fromdate}
    sleep   2
    Input Text  ${Fromdate}  ${Dateval}

Enter ToDate For Scheme10
    ${Dateval}   Gettodateforscheme10
    Log To File    To Date:${Dateval},
    Wait Until Element Is Visible    ${Todate}    timeout=30s
    Click ELement   ${Todate}
    sleep   2
    Input Text  ${Todate}  ${Dateval}

Enter FromDate For Scheme13
    ${Dateval}    getfromdateforscheme13
    Click ELement   ${Fromdate}
    sleep   2
    Input Text  ${Fromdate}  ${Dateval}
#    sleep   5

Enter ToDate For Scheme13
    ${Dateval}   gettodateforscheme13
    Click ELement   ${Todate}
    sleep   2
    Input Text  ${Todate}  ${Dateval}
#    sleep   5
Enter FromDate For Scheme15
    ${Dateval}    getfromdateforscheme15
    Log To File    From Date:${Dateval},
    Wait Until Element Is Visible    ${Fromdate}    timeout=30s
    Click ELement   ${Fromdate}
    sleep   2
    Input Text  ${Fromdate}  ${Dateval}

Enter ToDate For Scheme15
    ${Dateval}   gettodateforscheme15
    Log To File    To Date:${Dateval},
    Wait Until Element Is Visible    ${Todate}    timeout=30s
    Click ELement   ${Todate}
    sleep   2
    Input Text  ${Todate}  ${Dateval}

Enter FromDate For Scheme20
    ${Dateval}    getfromdateforscheme20
    Log To File    From Date:${Dateval},
    Wait Until Element Is Visible    ${Fromdate}    timeout=30s
    Click ELement   ${Fromdate}
    sleep   2
    Input Text  ${Fromdate}  ${Dateval}

Enter ToDate For Scheme20
    ${Dateval}   gettodateforscheme20
    Log To File    To Date:${Dateval},
    Wait Until Element Is Visible    ${Todate}    timeout=30s
    Click ELement   ${Todate}
    sleep   2
    Input Text  ${Todate}  ${Dateval}

Enter SchemePeriod
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    SchemePeriod  ${rownum}
    Log To File    Scheme Period:${data},
    # ${data}=    Convert To Integer  ${data}
    # Log    ${data}
    Wait Until Element Is Visible    ${Schemeperiod}    timeout=30s
    Click Element   ${Schemeperiod}
    sleep   2
    Select From List By Label  ${Schemeperiod}   ${data}
    # for json only
    # Select From List By Label  ${Schemeperiod}   ${test_data}[SchemePeriod]
#    sleep   5

Enter Zone
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    Zone  ${rownum}
    Log To File    Zone:${data},
    # ${data}=    Convert To Integer  ${data}
    # Log    ${data}
    Wait Until Element Is Visible    ${Zone}    timeout=30s
    Click Element   ${Zone}
    sleep   2
    Select From List By Label  ${Zone}   ${data}
    # for json only
    # Select From List By Label  ${Zone}   ${test_data}[Zone]
#    sleep   5

Enter AnnouncementDate
    ${Dateval}  getpreviousdayoffirstofcurrentmonth
    Log To File    Announcement Date:${Dateval},
    Click ELement   ${Announcementdate}
    sleep   2
    Input Text  ${Announcementdate}  ${Dateval}

Enter Scheme Doc No
    Sleep    1s
    Click Element    //*[@name="schemeDocNo"]
    Input Text    //*[@name="schemeDocNo"]//div/input    ${parent_scheme_name}
    Click Element    //div[@role="option"]
    Log To File    Scheme Doc No : ${parent_scheme_name}
Enter AnnouncementDate For Scheme5
    # ${Dateval}  Getannouncementdateforscheme5
    ${Dateval}  Getannouncementdateforscheme5A
    Log To File    Announcement Date:${Dateval},
    Wait Until Element Is Visible    ${Announcementdate}    timeout=30s
    Click ELement   ${Announcementdate}
    sleep   2
    Input Text  ${Announcementdate}  ${Dateval}
    
Enter AnnouncementDate For Scheme6
    ${Dateval}    Getannouncementdateforscheme 6
    Log To File    Announcement Date:${Dateval},
    Wait Until Element Is Visible    ${Announcementdate}    timeout=30s
    Click ELement   ${Announcementdate}
    sleep   2
    Input Text  ${Announcementdate}  ${Dateval}

Enter AnnouncementDate For Scheme7
    ${Dateval}    Getannouncementdateforscheme 7
    Log To File    Announcement Date:${Dateval},
    Wait Until Element Is Visible    ${Announcementdate}    timeout=30s
    Click ELement   ${Announcementdate}
    sleep   2
    Input Text  ${Announcementdate}  ${Dateval}

Enter AnnouncementDate For Scheme8
    ${Dateval}    Getannouncementdateforscheme8
    Log To File    Announcement Date:${Dateval},
    Click ELement   ${Announcementdate}
    sleep   2
    Input Text  ${Announcementdate}  ${Dateval}

Enter AnnouncementDate For Scheme9
    ${Dateval}    getannouncementdateforscheme9
    Log To File    Announcement Date:${Dateval},
    Wait Until Element Is Visible    ${Announcementdate}    timeout=30s
    Click ELement   ${Announcementdate}
    sleep   2
    Input Text  ${Announcementdate}  ${Dateval}

Enter AnnouncementDate For Scheme10
    ${Dateval}    Getfromdateforscheme 10
    Log To File    Announcement Date:${Dateval},
    Wait Until Element Is Visible    ${Announcementdate}    timeout=30s
    Click ELement   ${Announcementdate}
    sleep   2
    Input Text  ${Announcementdate}  ${Dateval}

Enter AnnouncementDate For Scheme13
    ${Dateval}    getfromdateforscheme3
    Log To File    Announcement Date:${Dateval},
    Wait Until Element Is Visible    ${Announcementdate}    timeout=30s
    Click ELement   ${Announcementdate}
    sleep   2
    Input Text  ${Announcementdate}  ${Dateval}

Enter AnnouncementDate For Scheme15
    ${Dateval}    Getannouncementdateforscheme15
    Log To File    Announcement Date:${Dateval},
    Wait Until Element Is Visible    ${Announcementdate}    timeout=30s
    Click ELement   ${Announcementdate}
    sleep   2
    Input Text  ${Announcementdate}  ${Dateval}

Enter AnnouncementDate For Scheme18
    ${Dateval}    getAnnouncementDateForScheme18
    Log To File    Announcement Date:${Dateval},
    Wait Until Element Is Visible    ${Announcementdate}    timeout=30s
    Click ELement   ${Announcementdate}
    sleep   2
    Input Text  ${Announcementdate}  ${Dateval}

Enter AnnouncementDate For Scheme20
    ${Dateval}    getfromdateforscheme20
    Log To File    Announcement Date:${Dateval},
    Wait Until Element Is Visible    ${Announcementdate}    timeout=30s
    Click ELement   ${Announcementdate}
    sleep   2
    Input Text  ${Announcementdate}  ${Dateval}
Enter SalesOrganisation
    Execute JavaScript    window.scrollBy(0, 1000)
    Wait Until Element Is Visible   ${ExpandSalesOrg}    timeout=30s
    Click Element   ${ExpandSalesOrg}   
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    SalesOrganisation  ${rownum}
    Log To File    Sales Organisation:${data},
    Wait Until Element Is Visible    ${SalesOrg}    timeout=30s
    Click Element   ${SalesOrg}
    sleep   2
    Select From List By Value  ${SalesOrg}   ${data}
    # for json only
    # Select From List By Value  ${SalesOrg}   ${test_data}[SalesOrganisation]
#    sleep   5

Enter SalesOrganisation For Scheme6
    Execute JavaScript    window.scrollBy(0, 1000)
    Wait Until Element Is Visible   ${ExpandSalesOrg}    timeout=30s
    Click Element   ${ExpandSalesOrg}
    Wait Until Element Is Visible    ${SalesOrgSearch}    timeout=30s
    Click Element    ${SalesOrgSearch}
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    SalesOrganisation  ${rownum}
    Log    ${data}
    @{SalesOrg1}    Split String    ${data}    ;
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Sleep    1
    Select From List By Label    ${SelectValues}    ${SalesOrg1[0]}
    Sleep    2
    Log To File    Sales Organisation One:${SalesOrg1[0]},
    Click Element    ${SelectValues}
    Sleep    1
    Select From List By Label    ${SelectValues}    ${SalesOrg1[1]}
    Log To File    Sales Organisation Two:${SalesOrg1[1]},
    Wait Until Element Is Visible    ${CloseSelectValues}
    Click Element    ${CloseSelectValues}
    Sleep    1

Enter SalesOrganisation Filters For Scheme9
    Wait Until Element Is Visible    ${SalesOrgSearch}    timeout=30s
    Click Element    ${SalesOrgSearch}
    Sleep    2
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    1000
    Sleep    2
    Log To File    SalesOrganisation Filter1:1000,
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    1010
    Sleep    2
    Log To File    SalesOrganisation Filter2:1010,
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    1030
    Log To File    SalesOrganisation Filter3:1030,
    Wait Until Element Is Visible    ${CloseSelectValues}
    Click Element    ${CloseSelectValues}
    Sleep    1

Enter SalesOrganisation Filters For Scheme10
    Execute JavaScript    window.scrollBy(0, 500)
    Wait Until Element Is Visible   ${ExpandSalesOrg}    timeout=30s
    Click Element   ${ExpandSalesOrg}
    Wait Until Element Is Visible    ${SalesOrgSearch}    timeout=30s
    Click Element    ${SalesOrgSearch}
    Sleep    2
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    1020
    Log To File    SalesOrganisation Filter1:1020,
    Sleep    2
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    3000
    Log To File    SalesOrganisation Filter2:3000,
    Sleep    2
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    6000
    Log To File    SalesOrganisation Filter3:6000,
    Wait Until Element Is Visible    ${CloseSelectValues}    timeout=30s
    Click Element    ${CloseSelectValues}
    Sleep    1

Enter SalesOrganisation Filters For Scheme11 
    Wait Until Element Is Visible    ${SalesOrgSearch}    timeout=30s
    Click Element    ${SalesOrgSearch}
    Sleep    2
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    1010
    Sleep    2
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    1030
    Sleep    2
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    1000
    Wait Until Element Is Visible    ${CloseSelectValues}
    Click Element    ${CloseSelectValues}
    Sleep    1
    Log To File    SalesOrganisation Filters:1010,1030,1000,

Enter SalesOrganisation Filters For Scheme12
    Execute JavaScript    window.scrollBy(0, 500)
    Wait Until Element Is Visible   ${ExpandSalesOrg}    timeout=30s
    Click Element   ${ExpandSalesOrg}
    Wait Until Element Is Visible    ${SalesOrgSearch}    timeout=30s
    Click Element    ${SalesOrgSearch}
    Sleep    2
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    1000
    Sleep    2
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    4010
    Sleep    2
    Wait Until Element Is Visible    ${CloseSelectValues}
    Click Element    ${CloseSelectValues}
    Log To File    SalesOrganisation Filters:1000,4010,
    Sleep    1

Enter SalesOrganisation For Scheme13
    Execute JavaScript    window.scrollBy(0, 1000)
    Wait Until Element Is Visible   ${ExpandSalesOrg}    timeout=30s
    Click Element   ${ExpandSalesOrg}
    Wait Until Element Is Visible    ${SalesOrgSearch}    timeout=30s
    Click Element    ${SalesOrgSearch}
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    SalesOrganisation  ${rownum}
    Log    ${data}
    @{SalesOrg1}    Split String    ${data}    ;
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    ${SalesOrg1[0]}
    Wait Until Element Is Visible    ${SelectValues}    timeout=20s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    ${SalesOrg1[1]}
    Wait Until Element Is Visible    ${SelectValues}    timeout=20s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    ${SalesOrg1[2]}
    Wait Until Element Is Visible    ${CloseSelectValues}
    Click Element    ${CloseSelectValues}
    Log To File    Sales Organisation Filters:${SalesOrg1[0]},${SalesOrg1[1]},${SalesOrg1[2]},

Enter DistributionChannel
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    DistributionChannel  ${rownum}
    ${data}=    Convert To String  ${data}
    Log    ${data}
    Log To File    Distribution Channel:${data},
    Wait Until Element Is Visible    ${DistChannel}    timeout=30s
    Click Element   ${DistChannel}
    sleep   2
    Select From List By Label  ${DistChannel}   ${data}
    # for json only
    # Select From List By Label  ${DistChannel}   ${test_data}[DistributionChannel]
#    sleep   5

Enter DistributionChannel Filter For Scheme10
    Wait Until Element Is Visible    ${DistricutionChannelFilters}    timeout=30s
    Click Element    ${DistricutionChannelFilters}
    Sleep    2
    Select From List By Label    ${SelectValues}    01 - Trade
    Sleep    1
    Click Element    ${CloseSelectValues}

Enter Division
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    Divison  ${rownum}
    Log    ${data}
    Log To File    Division:${data},
    Wait Until Element Is Visible    ${Division}    timeout=30s
    Click Element   ${Division}
    sleep   2
    Select From List By Label  ${Division}   ${data}
    # for json only
    # Select From List By Label  ${Division}   ${test_data}[Divison]
#    sleep   5
Enter Division Filters For Scheme10
    Wait Until Element Is Visible    ${DivisionFilters}    timeout=30s
    Click Element    ${DivisionFilters}
    Sleep    1
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    01 - Cement
    Log To File    Division Filter1:01 - Cement,
    Wait Until Element Is Visible    ${CloseSelectValues}    timeout=30s
    Click Element    ${CloseSelectValues}

Enter Plant Filters
    Wait Until Element Is Visible    ${PlantFilters}    timeout=30s
    Click Element    ${PlantFilters}
    Wait Until Element Is Visible    ${SelectValues}    timeout=20s
    Click Element    ${SelectValues}
    Sleep    2
    Select From List By Value    ${SelectValues}    E028
    Log To File    Plant Filter1:E028,
    Wait Until Element Is Visible    ${CloseSelectValues}
    Click Element    ${CloseSelectValues}
    Sleep    1
    

Enter CustomerRegion
    Wait Until Element Is Visible    ${ExpandSalesData}    timeout=30s
    Click Element   ${ExpandSalesData}
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    CustomerRegion  ${rownum}
    Log    ${data}
    Log To File    Customer Region:${data},
    Wait Until Element Is Visible    ${CustomerRegion}    timeout=30s
    Click Element   ${CustomerRegion}
    sleep   2
    Select From List By Label  ${CustomerRegion}   ${data}
    # for json only
    # Select From List By Label  ${CustomerRegion}   ${test_data}[CustomerRegion]
#    sleep   5
Enter CustomerRegion Filters For Scheme9
    Wait Until Element Is Visible    ${CustomerRegionFilters}    timeout=30s
    Click Element    ${CustomerRegionFilters}
    Sleep    1
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Sleep    1
    Select From List By Label    ${SelectValues}    24 - Uttar Pradesh
    Sleep    2
    Log To File    Customer Region Filter1:24 - Uttar Pradesh,
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    35 - Uttarakhand
    Log To File    Customer Region Filter2:35 - Uttarakhand,
    Wait Until Element Is Visible    ${CloseSelectValues}
    Click Element    ${CloseSelectValues}
    Sleep    1

Enter CustomerRegionFilters For Scheme10
    Execute Javascript    window.scrollBy(0, 500)
    Click Element   ${ExpandSalesData}
    Wait Until Element Is Visible    ${CustomerRegionFilters}    timeout=30s
    Click Element    ${CustomerRegionFilters}
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Sleep    2
    Select From List By Label    ${SelectValues}    03 - Assam
    Log To File    Customer Region Filter1:03 - Assam,
    Sleep    1
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Sleep    2
    Select From List By Label    ${SelectValues}    02 - Arunachal Pradesh
    Log To File    Customer Region Filter2:02 - Arunachal Pradesh,
    Sleep    1
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    14 - Manipur
    Log To File    Customer Region Filter3:14 - Manipur,
    Sleep    1
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    15 - Meghalaya
    Log To File    Customer Region Filter4:15 - Meghalaya,
    Sleep    1
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    16 - Mizoram
    Log To File    Customer Region Filter5:16 - Mizoram,
    Sleep    1
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    17 - Nagaland
    Log To File    Customer Region Filter6:17 - Nagaland,
    Sleep    1
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    23 - Tripura
    Log To File    Customer Region Filter7:23 - Tripura,
    Sleep    2
    Wait Until Element Is Visible    ${CloseSelectValues}    timeout=30s
    Click Element    ${CloseSelectValues}
    Sleep    1

Enter CustomerRegionFilters For Scheme11
    Wait Until Element Is Visible    ${CustomerRegionFilters}    timeout=30s
    Click Element    ${CustomerRegionFilters}
    Sleep    1
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Sleep    1
    Select From List By Label    ${SelectValues}    24 - Uttar Pradesh
    Sleep    2
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    35 - Uttarakhand
    Wait Until Element Is Visible    ${CloseSelectValues}
    Click Element    ${CloseSelectValues}
    Sleep    1
    Log To File    Customer Region Filters:24 - Uttar Pradesh,35 - Uttarakhand,

Enter CustomerRegionFilters For Scheme12
    Execute Javascript    window.scrollBy(0, 500)
    Wait Until Element Is Visible    ${ExpandSalesData}    timeout=30s
    Click Element   ${ExpandSalesData}
    Wait Until Element Is Visible    ${CustomerRegionFilters}    timeout=30s
    Click Element    ${CustomerRegionFilters}
    Wait Until Element Is Visible    ${SelectValues}    timeout=20s
    Click Element    ${SelectValues}
    Sleep    2
    Select From List By Label    ${SelectValues}    22 - Tamil Nadu
    Sleep    1
    Click Element    ${SelectValues}
    Sleep    2
    Select From List By Label    ${SelectValues}    32 - Puducherry
    Sleep    1
    Click Element    ${CloseSelectValues}
    Log To File    Customer Region Filters:22 - Tamil Nadu,32 - Puducherry,
    Sleep    1

Enter CustomerRegionFilters For Scheme13
    Execute Javascript    window.scrollBy(0, 500)
    Wait Until Element Is Visible    ${ExpandSalesData}    timeout=30s
    Click Element   ${ExpandSalesData}
    # Uncomment below lines if required
    # Wait Until Element Is Visible    (//i[@class='fa fa-search-plus'])[6]
    # Click Element    (//i[@class='fa fa-search-plus'])[6]
    # comment belpw lines if not required
    Wait Until Element Is Visible    (//i[@class='fa fa-search-plus'])[5]
    Click Element    (//i[@class='fa fa-search-plus'])[5]
    Wait Until Element Is Visible     //a[text()='Exclude Values']
    Click Element     //a[text()='Exclude Values']
    Click Element    //a[text()='Select single Values']
    Sleep    5
    Wait Until Element Is Visible    ${SelectValues}    timeout=20s
    # Mouse Down    ${SelectValues}
    Click Element    ${SelectValues}
    Sleep    2
    Capture Page Screenshot
    Select From List By Label    ${SelectValues}    02 - Arunachal Pradesh
    Wait Until Element Is Visible    ${SelectValues}    timeout=20s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    03 - Assam
    Wait Until Element Is Visible    ${SelectValues}    timeout=20s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    14 - Manipur
    Wait Until Element Is Visible    ${SelectValues}    timeout=20s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    15 - Meghalaya
    Wait Until Element Is Visible    ${SelectValues}    timeout=20s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    16 - Mizoram
    Wait Until Element Is Visible    ${SelectValues}    timeout=20s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    17 - Nagaland
    Wait Until Element Is Visible    ${SelectValues}    timeout=20s
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    23 - Tripura
    Wait Until Element Is Visible    ${CloseSelectValues}
    Click Element    ${CloseSelectValues}
    Sleep    1
    Log To File    Customer Region Filters:02 - Arunachal Pradesh,03 - Assam,14 - Manipur,15 - Meghalaya,16 - Mizoram,17 - Nagaland,23 - Tripura,

Enter CustomerRegionFilters For Scheme17
    Wait Until Element Is Visible    ${CustomerRegionFilters}    timeout=30s
    Click Element    ${CustomerRegionFilters}
    Wait Until Element Is Visible    ${SelectValues}    timeout=20s
    Click Element    ${SelectValues}
    Sleep    2
    Select From List By Label    ${SelectValues}    10 - Karnataka
    Sleep    1
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Sleep    2
    Select From List By Label    ${SelectValues}    22 - Tamil Nadu
    Sleep    1
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${CloseSelectValues}
    Sleep    1
    Log To File    Customer Region Filters:10 - Karnataka,22 - Tamil Nadu,

Enter CustomerRegionFilters For Scheme18
    Execute Javascript    window.scrollBy(0, 500)
    Wait Until Element Is Visible    ${ExpandSalesData}    timeout=30s
    Click Element   ${ExpandSalesData}
    Wait Until Element Is Visible    ${CustomerRegionFilters}    timeout=30s
    Click Element    ${CustomerRegionFilters}
    Sleep    5
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Sleep    2
    Select From List By Label    ${SelectValues}    22 - Tamil Nadu
    Sleep    1
    Click Element    ${SelectValues}
    Sleep    2
    Select From List By Label    ${SelectValues}    11 - Kerala
    Sleep    1
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    10 - Karnataka
    Wait Until Element Is Visible    ${CloseSelectValues}
    Click Element    ${CloseSelectValues}
    Sleep    1
    Log To File    Customer Region Filters:22 - Tamil Nadu,11 - Kerala,10 - Karnataka,
Enter CustomerRegion For Scheme16
    Execute Javascript    window.scrollBy(0, 500)
    Wait Until Element Is Visible    ${ExpandSalesData}    timeout=30s
    Click Element   ${ExpandSalesData}
    Wait Until Element Is Visible    (//i[@class='fa fa-search-plus'])[5]
    Click Element    (//i[@class='fa fa-search-plus'])[5]
    Wait Until Element Is Visible     //a[text()='Exclude Values']
    Click Element     //a[text()='Exclude Values']
    Click Element    //a[text()='Select single Values']
    Sleep    5
    Wait Until Element Is Visible    ${SelectValues}    timeout=30s
    Click Element    ${SelectValues}
    Sleep    2
    Select From List By Label    ${SelectValues}    01 - Andhra Pradesh
    Sleep    1
    Click Element    ${SelectValues}
    Sleep    2
    Select From List By Label    ${SelectValues}    10 - Karnataka
    Sleep    1
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    22 - Tamil Nadu
    Wait Until Element Is Visible    ${CloseSelectValues}
    Click Element    ${CloseSelectValues}
    Sleep    1
    Log To File    Customer Region Filters:01 - Andhra Pradesh,10 - Karnataka,22 - Tamil Nadu,

Enter CustomerDistricts For Scheme12
    Wait Until Element Is Visible    ${CustomerDistricts}    timeout=30s
    Click Element    ${CustomerDistricts}
    Sleep    1
    Wait Until Element Is Visible    ${SelectValues}
    Click Element    ${SelectValues}
    Sleep    1
    Select From List By Label    ${SelectValues}    T18
    Sleep    1
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    T23
    Sleep    1
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    T32
    Sleep    1
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    T25
    Sleep    1
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    T09
    Sleep    1
    Click Element    ${SelectValues}
    Select From List By Label    ${SelectValues}    T36
    Click Element    ${CloseSelectValues}
    Log To File    Customer Districts:T18,T23,T32,T25,T09,T36,
    Sleep    1

Enter Exclusive Customers To Scheme
    Execute Javascript    window.scrollBy(0, 500)
    Wait Until Element Is Visible    ${CustomerSearch}    timeout=30s
    Click Element    ${CustomerSearch}
    Wait Until Element Is Visible    ${CustomerSelection}    timeout=20s
    Click Element    ${CustomerSelection}
    # Sleep    2
    # Wait Until Element Is Visible    //mat-dialog-container//table//div//div//div//span[@class='ngx-select__placeholder text-muted ng-star-inserted']    timeout=30s
    # Click Element    //mat-dialog-container//table//div//div//div//span[@class='ngx-select__placeholder text-muted ng-star-inserted']
    Wait Until Element Is Visible    ${InputCustomer}    timeout=30s
    Element Should Be Visible    ${InputCustomer}
    Sleep    1
    Input Text     ${InputCustomer}    0007042447
    SeleniumLibrary.Press Keys    ${InputCustomer}    ENTER
    Click Element    ${CustomerSelection}
    Sleep    1
    Input Text     ${InputCustomer}    0007039409
    SeleniumLibrary.Press Keys    ${InputCustomer}    ENTER
    Click Element    ${CustomerSelection}
    Sleep    1
    Input Text     ${InputCustomer}    0007016106
    SeleniumLibrary.Press Keys    ${InputCustomer}    ENTER
    Click Element    ${CustomerSelection}
    Sleep    1
    Input Text     ${InputCustomer}    0007035432
    SeleniumLibrary.Press Keys    ${InputCustomer}    ENTER
    Click Element    ${CustomerSelection}
    Sleep    1
    Input Text     ${InputCustomer}    0007036849
    SeleniumLibrary.Press Keys    ${InputCustomer}    ENTER
    Click Element    ${CustomerSelection}
    Sleep    1
    Input Text     ${InputCustomer}    0007042819
    SeleniumLibrary.Press Keys    ${InputCustomer}    ENTER
    Click Element    ${CustomerSelection}
    Sleep    1
    Input Text     ${InputCustomer}    0007041475
    SeleniumLibrary.Press Keys    ${InputCustomer}    ENTER
    Click Element    ${CustomerSelection}
    Sleep    1
    Input Text     ${InputCustomer}    0007027517
    SeleniumLibrary.Press Keys    ${InputCustomer}    ENTER
    Click Element    ${CustomerSelection}
    Sleep    1
    Input Text     ${InputCustomer}    0007036771
    SeleniumLibrary.Press Keys    ${InputCustomer}    ENTER
    Click Element    ${CustomerSelection}
    Sleep    1
    Input Text     ${InputCustomer}    0007043353
    SeleniumLibrary.Press Keys    ${InputCustomer}    ENTER
    Click Element    ${CustomerSelection}
    Sleep    1
    Input Text     ${InputCustomer}    0007034485
    SeleniumLibrary.Press Keys    ${InputCustomer}    ENTER
    Click Element    ${CustomerSelection}
    Sleep    1
    Input Text     ${InputCustomer}    0007033944
    SeleniumLibrary.Press Keys    ${InputCustomer}    ENTER
    Click Element    ${CloseSelectValues}
    Log To File    Exclusive Customers:0007042447,0007039409,0007016106,0007035432,0007036849,0007042819,0007041475,0007027517,0007036771,0007043353,0007034485,0007033944,
    Sleep    1

Enter CustomersFromTo
    Wait Until Element Is Visible    ${Customerfrom}    timeout=30s
    Click Element    ${Customerfrom}
    Input Text    ${Customerfrom}    0007000000
    Log To File    Customer From:0007000000,
    Sleep    1
    Wait Until Element Is Visible    ${Customerto}    timeout=30s
    Click Element    ${Customerto}
    Input Text    ${Customerto}    0007999999
    Log To File    Customer To:0007999999,
    Sleep    1
Enter Sub States For Scheme7
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    SubStates    ${rownum}
    Log    ${data}
    Log To File    Sub States:${data},
    Wait Until Element Is Visible    ${SubStates}    timeout=30s
    Click Element   ${SubStates}
    sleep   2
    Select From List By Label  ${SubStates}   ${data}

Enter SalesDistricts For Scheme14
    Wait Until Element Is Visible    ${SalesDistrictFilters}    timeout=30s
    Click Element    ${SalesDistrictFilters}
    Wait Until Element Is Visible    ${SalesDistInput}    timeout=30s
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2119
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2148
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2149
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2106
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2111
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2147
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2108
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2145
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2110
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2146
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2133
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2135
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2151
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2103
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2141
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2142
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2102
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2107
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2144
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2134
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2120
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2124
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2112
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Click Element    ${SalesDistInput}
    Sleep    1
    Input Text     ${SalesDistInput}    DT2116
    SeleniumLibrary.Press Keys    ${SalesDistInput}    ENTER
    Wait Until Element Is Visible    ${CloseSelectValues}
    Click Element    ${CloseSelectValues}
    Sleep    1
    Log To File    Sales Districts:DT2119,DT2148,DT2149,DT2106,DT2111,DT2147,DT2108,DT2145,DT2110,DT2146,DT2133,DT2135,DT2151,DT2103,DT2141,DT2142,DT2102,DT2107,DT2144,DT2134,DT2120,DT2124,DT2112,DT2116,

Enter ProfitCenter
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    ProfitCenter  ${rownum}
    Log    ${data}
    Click Element   ${profitCenter}
    sleep   2
    Select From List By Label  ${profitCenter}   ${data}
Enter DiscountG/LAccount
    Execute JavaScript    window.scrollBy(0, 1000)
    Wait Until Element Is Visible   ${ExpandOtherChar}    timeout=30s
    Click Element   ${ExpandOtherChar}
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    DiscountG/LAccount  ${rownum}
    Log    ${data}
    Log To File    Discount G/L Account:${data},
    Wait Until Element Is Enabled  ${DiscountAccount}    timeout=30s
    Click Element   ${DiscountAccount}
    sleep   3
    Select From List By Label  ${DiscountAccount}   ${data}
    # for json only
    # Select From List By Label  ${DiscountAccount}   ${test_data}[DiscountG/LAccount]
#    sleep   5

Enter LiableG/LAccount
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    LiableG/LAccount  ${rownum}
    Log    ${data}
    Log To File    Liable G/L Account:${data},
    Wait Until Element Is Visible    ${LiableAccount}    timeout=30s
    Click Element   ${LiableAccount}
    sleep   2
    Select From List By Label  ${LiableAccount}   ${data}
    # for json only
    # Select From List By Label  ${LiableAccount}   ${test_data}[LiableG/LAccount]
#    sleep   5

#Sheme18
Choose Discount On Actual Quantity
    Wait Until Element Is Visible    ${DiscountOnActualQuantity}    timeout=30s
    Click Element    ${DiscountOnActualQuantity}
    Sleep    1

# For Scheme type 4
Select Rake Quantity
    Wait Until Element Is Visible    ${RakeQty}    timeout=10s
    Click Element    ${RakeQty}
    Wait Until Element Is Visible    ${OnlyRake}    timeout=10s
    Click Element    ${OnlyRake}
    Sleep    2

Enter PreQualifierType
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    PreQualifierType  ${rownum}
    Log    ${data}
    Log To File    PreQualifierType:${data},
    Wait Until Element Is Visible    ${PreQualifierType}    timeout=30s
    Click Element    ${PreQualifierType}
    Sleep    2
    Select From List By Label    ${PreQualifierType}    ${data}

Enter PrevFromDateQualifier
    ${prevfromdate}    getprevfromdatequalifier
    Wait Until Element Is Visible    ${PrevFromDateQualifier}    timeout=30s
    Click Element    ${PrevFromDateQualifier}
    Sleep    2
    Input Text    ${PrevFromDateQualifier}    ${prevfromdate}
    Log To File    PreviousFromDate:${prevfromdate},

Enter PrevToDateQualifier
    ${prevtodate}    getprevtodatequalifier
    Wait Until Element Is Visible    ${PrevToDateQualifier}    timeout=30s
    Click Element    ${PrevToDateQualifier}
    Sleep    2
    Input Text    ${PrevToDateQualifier}    ${prevtodate}
    Log To File    PreviousToDate:${prevtodate},

Enter PrevFromDate For Scheme13
    ${prevfromdate}    getprevfromdateforscheme13
    Log To File    PreviousFromDate:${prevfromdate},
    Wait Until Element Is Visible    ${PrevFromDateQualifier}    timeout=30s
    Click Element    ${PrevFromDateQualifier}
    Sleep    2
    Input Text    ${PrevFromDateQualifier}    ${prevfromdate}

Enter PrevToDate For Scheme13
    ${prevtodate}    getprevtodateforscheme13
    Log To File    PreviousToDate:${prevtodate},
    Wait Until Element Is Visible    ${PrevToDateQualifier}    timeout=30s
    Click Element    ${PrevToDateQualifier}
    Sleep    2
    Input Text    ${PrevToDateQualifier}    ${prevtodate}

Enter PayOutFromDateForScheme13
    ${payfromdate}    getpayoutfromdateforscheme13
    Log To File    PayOutFromDate:${payfromdate},
    Wait Until Element Is Visible    ${PayOutFromDate}    timeout=30s
    Click Element    ${PayOutFromDate}
    Sleep    2
    Input Text    ${PayOutFromDate}    ${payfromdate}

Enter PayOutToDateForScheme13
    ${paytodate}    getpayouttodateforscheme13
    Log To File    PayOutToDate:${paytodate},
    Wait Until Element Is Visible    ${PayOutToDate}    timeout=30s
    Click Element    ${PayOutToDate}
    Sleep    2
    Input Text    ${PayOutToDate}    ${paytodate}

Enter PrePeriodFromDate For Scheme13
    ${preperiodfromdatex}    getpayoutfromdateforscheme13
    Log To File    PrePeriodFromDate:${preperiodfromdatex},
    Wait Until Element Is Visible    ${PrePeriodFromDate}    timeout=30s
    Click Element    ${PrePeriodFromDate}
    Sleep    2
    Input Text    ${PrePeriodFromDate}    ${preperiodfromdatex}

Enter PrePeriodToDate For Scheme13
    ${preperiodtodate}    getpayouttodateforscheme13
    Log To File    PrePeriodToDate:${preperiodtodate},
    Wait Until Element Is Visible    ${PrePeriodToDate_loc}    timeout=30s
    Click Element    ${PrePeriodToDate_loc}
    Sleep    2
    Input Text    ${PrePeriodToDate_loc}    ${preperiodtodate}

Enter PrePeriodFromDate For Scheme20
    ${preperiodfromdatex}    getpreperiodfromdateforscheme20
    Log To File    PrePeriodFromDate:${preperiodfromdatex},
    Wait Until Element Is Visible    ${PrePeriodFromDate}    timeout=30s
    Click Element    ${PrePeriodFromDate}
    Sleep    2
    Input Text    ${PrePeriodFromDate}    ${preperiodfromdatex}

Enter PrePeriodToDate For Scheme20
    ${preperiodtodatex}    getpreperiodtodateforscheme20
    Log To File    PrePeriodToDate:${preperiodtodatex},
    Wait Until Element Is Visible    ${PrePeriodToDate_loc}    timeout=30s
    Click Element    ${PrePeriodToDate_loc}
    Sleep    2
    Input Text    ${PrePeriodToDate_loc}    ${preperiodtodatex}
Enter PrePeriodFromDate
    ${preperiodfromdatex}    getpreperiodfromdate
    Wait Until Element Is Visible    ${PrePeriodFromDate}    timeout=30s
    Click Element    ${PrePeriodFromDate}
    Sleep    2
    Input Text    ${PrePeriodFromDate}    ${preperiodfromdatex}
    Log To File    PrePeriodFromDate:${preperiodfromdatex},

Enter PrePeriodToDate
    ${preperiodtodatex}    getpreperiodtodate
    Wait Until Element Is Visible    ${PrePeriodToDate_loc}    timeout=30s
    Click Element    ${PrePeriodToDate_loc}  
    Sleep    2
    Input Text    ${PrePeriodToDate_loc}    ${preperiodtodatex}
    Log To File    PrePeriodToDate:${preperiodtodatex},

Enter PrePeriodFromDate For Scheme5
    # ${preperiodfromdatex}    getfromdateforscheme5
    ${preperiodfromdatex}    Getfromdateforscheme5A
    Wait Until Element Is Visible    ${PrePeriodFromDate}    timeout=30s
    Click Element    ${PrePeriodFromDate}
    Sleep    2
    Input Text    ${PrePeriodFromDate}    ${preperiodfromdatex}
    Log To File    PrePeriodFromDate:${preperiodfromdatex},

Enter PrePeriodToDate For Scheme5
    # ${preperiodtodatex}    gettodateforscheme5    3
    ${preperiodtodatex}    Gettodateforscheme5A
    Wait Until Element Is Visible    ${PrePeriodToDate_loc}    timeout=30s
    Click Element    ${PrePeriodToDate_loc}  
    Sleep    2
    Input Text    ${PrePeriodToDate_loc}    ${preperiodtodatex}
    Log To File    PrePeriodToDate:${preperiodtodatex},

Enter PayOutToDateForScheme17
    ${paytodate}    getpayouttodateforscheme17
    Log To File    PayOutToDate:${paytodate},
    Wait Until Element Is Visible    ${PayOutToDate}    timeout=30s
    Click Element    ${PayOutToDate}
    Sleep    2
    Input Text    ${PayOutToDate}    ${paytodate}

Enter PrePeriodMinimumQuantity
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    PrePeriodMinQty  ${rownum}
    # ${data}=    Convert To Integer    ${data}
    Log    ${data}
    Log To File    PrePeriodMinimumQuantity:${data},
    Execute JavaScript    window.scrollBy(0, 2000)
    # Scroll Element Into View    ${PrePeriodMinQty}
    # Scroll Element Into View    //h5[text()="Slab Type"]
    sleep    2s
    Wait Until Element Is Visible    ${PrePeriodMinQty}    timeout=30s
    Click Element    ${PrePeriodMinQty}
    Sleep    2
    Input Text    ${PrePeriodMinQty}    ${data}
    Set Global Variable    ${MinQty}    ${data}
    
Enter PrePeriodMaximumQuantity
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    PrePeriodMaxQty  ${rownum}
    # ${data}=    Convert To Integer    ${data}
    Log    ${data}
    Log To File    PrePeriodMaximumQuantity:${data},
    Wait Until Element Is Visible    ${PrePeriodMaxQty}    timeout=30s
    Click Element    ${PrePeriodMaxQty}
    Sleep    2
    Input Text    ${PrePeriodMaxQty}    ${data}

Enter MinQtyInTons For Scheme5
    Execute JavaScript    window.scrollBy(0, 2000)
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    MinimumQuantityInTons  ${rownum}
    ${data}=    Convert To Integer    ${data}
    Log    ${data}
    Log To File    Minimum Quantity In Tons:${data},
    Wait Until Element Is Visible    ${MinQtyInTons}    timeout=30s
    Click Element    ${MinQtyInTons}
    Sleep    2
    Input Text    ${MinQtyInTons}    ${data}
    ${MinQty}    Set Global Variable    ${data}

#Scheme12
Enter Material To Be Excluded
    Execute Javascript    window.scrollBy(0, 1000)
    Wait Until Element Is Visible    ${ExcludeMaterial}    timeout=30s
    Click Element    ${ExcludeMaterial}
    Wait Until Element Is Visible    ${MaterialExcluded}    timeout=30s
    Click Element    ${MaterialExcluded}
    Input Text    ${MaterialExcluded}    F01SR000DLHWTN1
    Log To File    Material To Be Excluded:F01SR000DLHWTN1,
    Sleep    1

#scheme18
Enter Incremental Quantity in Tons
    Execute Javascript    window.scrollBy(0, 1000)
    Wait Until Element Is Visible    ${IncQty}    timeout=30s
    Click Element    ${IncQty}
    Input Text    ${IncQty}    10
    Sleep    1
    Log To File    Incremental Quantity in Tons:10,

#Scheme20
Enter Target Days
    Execute Javascript    window.scrollBy(0, 1000)
    Wait Until Element Is Visible    ${TargetDays}    timeout=30s
    Click Element    ${TargetDays}
    Input Text    ${TargetDays}    8
    Sleep    1
    Log To File    Target Days:8,

Upload SchemeDocument
    ${FielToUpload}=  getfiletoupload
    Execute JavaScript    window.scrollBy(0, 2000)
    Scroll Element Into View    ${ChooseFile}
    Wait Until Element Is Visible   ${ChooseFile}    timeout=30s
    Log    File Input Element: ${ChooseFile}
    Choose File  ${ChooseFile}  ${FielToUpload}
    Log    File selection dialog opened
#    sleep   10
    Wait Until Element is Enabled   ${UploadDoc}    timeout=30s
    Click Element   ${UploadDoc}
    Sleep   2
    ${alert_present} =    Run Keyword And Return Status    Alert Should Be Present
    # IF    ${alert_present}
    #     Handle Alert    accept    timeout=20s
    # ELSE
    #     Click Element    ${UploadDoc}
    #     Handle Alert    accept    timeout=20s
    # END
    # Handle Alert    accept    timeout=20s
#    Sleep   10

Enter FielToUpload For Scheme14
    Execute JavaScript    window.scrollBy(0, 4000)
    ${rebatefile}    getrebatefiletoupload
    Log To Console    ${rebatefile}
    Wait Until Element Is Visible    ${Rebate_FileUpload}    timeout=20s
    Click Element    ${Rebate_FileUpload}
    Wait Until Element Is Visible    //select[@name='ftype']    timeout=20s
    Click Element   //select[@name='ftype']
    sleep   2
    Select From List By Label  //select[@name='ftype']   Target Rate
    Wait Until Element Is Visible    ${Rebate_ChooseFile}    timeout=20s
    Choose File    ${Rebate_ChooseFile}    ${rebatefile}
    Wait Until Element Is Enabled    ${SendFile}    timeout=20s
    Click Element    ${SendFile}
    Sleep   2
    # Capture Page Screenshot
    ${alert_present} =    Run Keyword And Return Status    Alert Should Be Present

Choose SlabEntry And FielToUpload For Scheme19
    Execute JavaScript    window.scrollBy(0, 4000)
    ${slabentryfileupload}    getrebateslabentryandfileupload
    Log To Console    ${slabentryfileupload}
    Wait Until Element Is Visible    ${SlabEntryandFileUpload}    timeout=30s
    Click Element    ${SlabEntryandFileUpload}
    Sleep    1
    # remove lines 1319 to 1322 if not needed
    Wait Until Element Is Visible    //select[@name='ftype']    timeout=20s
    Click Element   //select[@name='ftype']
    sleep   2
    Select From List By Label  //select[@name='ftype']   Target Rate
    Wait Until Element Is Visible    ${Rebate_ChooseFile}    timeout=20s
    Choose File    ${Rebate_ChooseFile}    ${slabentryfileupload}
    Sleep    1
    Wait Until Element Is Enabled    ${SendFile}    timeout=20s
    Click Element    ${SendFile}
    # Sleep   2s
    ${alert_present} =    Run Keyword And Return Status    Alert Should Be Present

Enter RebateSlabGrid
    Sleep    1
    Execute JavaScript    window.scrollBy(0, 4000)
    Wait Until Element Is Visible   ${SlabGrid}    timeout=30s
    Click Element   //input[@type='radio' and @value='slab']
    Wait Until Element Is Visible   ${SlabType}    timeout=30s
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    SlabType  ${rownum}
    Log    ${data}
    Log To File    Slab Type:${data},
    Click Element   ${SlabType}
    sleep   2
    Select From List By Label  ${SlabType}   ${data}
    sleep   2

Enter SlabType For Scheme19
    Wait Until Element Is Visible   ${SlabType}    timeout=30s
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    SlabType    ${rownum}
    Log To File    Slab Type:${data},
    Log    ${data}
    Click Element   ${SlabType}
    sleep   2
    Select From List By Label  ${SlabType}   ${data}
    Sleep    1
Enter RatePerBag For Standard Scheme
    Sleep    1
    Execute JavaScript    window.scrollBy(0, 2000)
    sleep   2
    ${expected_QtyRange}=    Create List    ≥ 10 - <50    ≥ 50 - <100    ≥ 100 - <250    ≥ 250 - <500    ≥ 500 - <750    ≥ 750 - <1000    ≥ 1000
    Wait Until Element Is Visible    ${FirstQty}    timeout=30s
    Run Keyword If    "${FirstQty}" == "${expected_QtyRange}[0]"    Click Element    ${FirstRate}
    Input Text  ${FirstRate}    5
    Log To File    FirstRate:5,
    sleep   2

    Run Keyword If    "${SecQty}" == "${expected_QtyRange}[1]"    Click Element    ${SecondRate}
    Input Text  ${SecondRate}    10
    Log To File    SecondRate:10,
    sleep   2

    Run Keyword If    "${ThirdQty}" == "${expected_QtyRange}[2]"    Click Element    ${ThirdRate}
    Input Text  ${ThirdRate}    15
    Log To File    ThirdRate:15,
    sleep   2

    Run Keyword If    "${FourthQty}" == "${expected_QtyRange}[3]"    Click Element    ${FourthRate}
    Input Text  ${FourthRate}    20
    Log To File    FourthRate:20,
    sleep   2

    Run Keyword If    "${FifthQty}" == "${expected_QtyRange}[4]"    Click Element    ${FifthRate}
    Input Text  ${FifthRate}    25
    Log To File    FifthRate:25,
    sleep   2

    Run Keyword If    "${SixthQty}" == "${expected_QtyRange}[5]"    Click Element    ${SixthRate}
    Input Text  ${SixthRate}    30
    Log To File    SixthRate:30,
    sleep   2

    Run Keyword If    "${SeventhQty}" == "${expected_QtyRange}[6]"    Click Element    ${SeventhRate}
    Input Text  ${SeventhRate}    35
    Log To File    SeventhRate:35,
    sleep   2

Enter RatePerBag For Provision Scheme
    Execute JavaScript    window.scrollBy(0, 2000)
    sleep   2 
    ${load_temp_json}    Load Json From File    ${CURDIR}/../TestData/SchemesRate.json
    ${rate2}    Set Variable    ${load_temp_json}[Scheme2][RatePerBag]
    # Run Keyword If    "${Rownumber}" == "1"    Click Element    ${Rateperbag}
    # ${rate}     getrateperbag   RatePerBag
    Input Text  ${Rateperbag}    ${rate2}
    Set Global Variable    ${rate2}
    Log To File    rate:${rate2},
    
#    ${rate}    Evaluate  ${rate} + 1
    # Log To Console     ${rate}
    ${updated_rate}    Evaluate    ${rate2}+1
    # Log To Console    ${updated_rate}
    ${updatedjson}    Update Value To Json    ${load_temp_json}    $.Scheme2.RatePerBag    ${updated_rate}
    Dump Json To File    ${CURDIR}/../TestData/SchemesRate.json    ${updatedjson}
    sleep   2

Enter RatePerBag For Scheme type3
    Execute JavaScript    window.scrollBy(0, 2000)
    sleep   2
    Wait Until Element Is Visible    ${FirstRPB}    timeout=30s
    Click Element    ${FirstRPB}
    Input Text    ${FirstRPB}    10
    Log To File    FirstRate:10,
    Sleep    2

    Click Element    ${SecondRPB}
    Input Text    ${SecondRPB}    20
    Log To File    SecondRate:20,
    Sleep    2

    Click Element    ${ThirdRPB}
    Input Text    ${ThirdRPB}    30
    Log To File    ThirdRate:30,
    Sleep    2

    Click Element    ${FourthRPB}
    Input Text    ${FourthRPB}    40
    Log To File    FourthRate:40,
    Sleep    2

    Click Element    ${FifthRPB}
    Input Text    ${FifthRPB}    50
    Log To File    FifthRate:50,
    Sleep    2

Enter RatePerBag For Scheme6
    Execute JavaScript    window.scrollBy(0, 5000)
    sleep   2
    Wait Until Element Is Visible    ${rateOne}    timeout=30s
    Click Element    ${rateOne}
    Input Text    ${rateOne}    70
    Log To File    rateOne:70,
    Sleep    2
    Click Element    ${rateTwo}
    Input Text    ${rateTwo}    60
    Log To File    rateTwo:60,
    Sleep    2
    Click Element    ${rateThree}
    Input Text    ${rateThree}    40
    Log To File    rateThree:40,
    # Reduce browser size by 80%
    Execute JavaScript    window.resizeTo(window.innerWidth * 0.2, window.innerHeight * 0.2)
    FOR    ${i}    IN RANGE    6
        ${status}=    Run Keyword And Return Status    Element Should Be Visible    ${rateFour}
        Exit For Loop If    '${status}' == 'True'
        Sleep    10
        Log    Retrying... Attempt ${i+1}
        Continue For Loop
    END
    Input Text    ${rateFour}    20
    Log To File    rateFour:20,
    Sleep    1

Enter Rate Per Ton For Scheme7
    Execute JavaScript    window.scrollBy(0, 10000)
    sleep   2
    ${load_temp_json}    Load Json From File    ${CURDIR}/../TestData/SchemesRate.json
    ${rate}    Set Variable    ${load_temp_json}[Scheme7][RatePerTon]
    Sleep    2
    Force scroll to element    ${FirstRPB}
    Wait Until Element Is Visible    ${FirstRPB}    timeout=30s
    Click Element    ${FirstRPB}
    Input Text    ${FirstRPB}    5
    Log To File    FirstRate:5,
    Set Global Variable    ${rate}
    Sleep    2
    Click Element    ${SecondRPB}
    Input Text    ${SecondRPB}    10
    Log To File    SecondRate:10,
    Sleep    2
    Click Element    ${ThirdRPB}
    Input Text    ${ThirdRPB}    ${rate}
    Log To File    ThirdRate:${rate},
    Sleep    2
    ${updated_rate}    Evaluate    ${rate}+1
    ${updatedjson}    Update Value To Json    ${load_temp_json}    $.Scheme7.RatePerTon    ${updated_rate}
    Dump Json To File    ${CURDIR}/../TestData/SchemesRate.json    ${updatedjson}

Enter RatePerTon For Scheme8
    Execute Javascript    window.scrollBy(0, 4000)
    ${load_temp_json}    Load Json From File    ${CURDIR}/../TestData/SchemesRate.json
    ${rate8}    Set Variable    ${load_temp_json}[Scheme8][RatePerTon]
    Sleep    2
    Wait Until Element Is Visible    ${FirstRPB}    timeout=30s
    Click Element    ${FirstRPB}
    Input Text    ${FirstRPB}    40
    Log To File    FirstRate:40,
    Sleep    1
    Click Element    ${SecondRPB}
    Input Text    ${SecondRPB}    ${rate8}
    Log To File    SecondRate:${rate8},
    Set Global Variable    ${rate8}
    Sleep    1
    ${updated_rate}    Evaluate    ${rate8}+1
    ${updatedjson}    Update Value To Json    ${load_temp_json}    $.Scheme8.RatePerTon    ${updated_rate}
    Dump Json To File    ${CURDIR}/../TestData/SchemesRate.json    ${updatedjson}

Enter RatePerTon For Scheme9
    Execute Javascript    window.scrollBy(0, 4000)
    ${load_temp_json}    Load Json From File    ${CURDIR}/../TestData/SchemesRate.json
    ${rate9}    Set Variable    ${load_temp_json}[Scheme9][RatePerTon]
    Set Global Variable    ${rate9}
    Sleep    2
    Wait Until Element Is Visible    ${FirstRPB}    timeout=30s
    Click Element    ${FirstRPB}
    Input Text    ${FirstRPB}    10
    Log To File    FirstRate:10,
    Sleep    1
    Click Element    ${SecondRPB}
    Input Text    ${SecondRPB}    20
    Log To File    SecondRate:20,
    Sleep    1
    Click Element    ${ThirdRPB}
    Input Text    ${ThirdRPB}    ${rate9}
    Log To File    ThirdRate:${rate9},
    Sleep    1
    ${updated_rate}    Evaluate    ${rate9}+1
    ${updatedjson}    Update Value To Json    ${load_temp_json}    $.Scheme9.RatePerTon    ${updated_rate}
    Dump Json To File    ${CURDIR}/../TestData/SchemesRate.json    ${updatedjson}


Enter RatePErTon For Scheme10
    Execute Javascript    window.scrollBy(0, 4000)
    Sleep    2
    ${load_temp_json}    Load Json From File    ${CURDIR}/../TestData/SchemesRate.json
    ${rate10}    Set Variable    ${load_temp_json}[Scheme10][RatePerTon]
    Set Global Variable    ${rate10}
    Wait Until Element Is Visible    ${FirstRPB}    timeout=30s
    Click Element    ${FirstRPB}
    Input Text    ${FirstRPB}    ${rate10}
    Log To File    FirstRate:${rate10},
    ${updated_rate}    Evaluate    ${rate10}+1
    ${updatedjson}    Update Value To Json    ${load_temp_json}    $.Scheme10.RatePerTon    ${updated_rate}
    Dump Json To File    ${CURDIR}/../TestData/SchemesRate.json    ${updatedjson}
    Sleep    1

Enter RatePerTon For Scheme11
    Execute Javascript    window.scrollBy(0, 4000)
    Sleep    2
    Wait Until Element Is Visible    ${FirstRPB}    timeout=30s
    Click Element    ${FirstRPB}
    Input Text    ${FirstRPB}    200
    Sleep    1
    Click Element    ${SecondRPB}
    Input Text    ${SecondRPB}    500
    Sleep    1
    Click Element    ${ThirdRPB}
    Input Text    ${ThirdRPB}    700
    Sleep    1
    Click Element    ${FourthRPB}
    Input Text    ${FourthRPB}    1000
    Sleep    1
    Click Element    ${FifthRPB}
    Input Text    ${FifthRPB}    1200
    Sleep    1
    Execute Javascript    window.scrollBy(0,1000)
    Click Element    ${SixthRPB}
    Input Text    ${SixthRPB}    1500
    Sleep    1
    Click Element    ${SeventhRPB}
    Input Text    ${SeventhRPB}    1700
    Sleep    1
    Click Element    ${EighthRPB}
    Input Text    ${EighthRPB}    2000
    Sleep    1
    Click Element    ${NinthRPB}
    Input Text    ${NinthRPB}    2200
    Sleep    1
    Click Element    ${TenthRPB}
    Input Text    ${TenthRPB}    2500
    Sleep    1
    Click Element    ${EleventhRPB}
    Input Text    ${EleventhRPB}    2700
    Sleep    1
    Click Element    ${TwelvethRPB}
    Input Text    ${TwelvethRPB}    3000
    Sleep    1
    Click Element    ${ThirteenthRPB}
    Input Text    ${ThirteenthRPB}    3200
    Sleep    1
    Click Element    ${FourteenthRPB}
    Input Text    ${FourteenthRPB}    3500
    Sleep    1
    Click Element    ${FifteenthRPB}
    Input Text    ${FifteenthRPB}    3700
    Sleep    1
    Click Element    ${SixteenthRPB}
    Input Text    ${SixteenthRPB}    4000
    Sleep    1
    Click Element    ${SeventeenthRPB}
    Input Text    ${SeventeenthRPB}    4200
    Sleep    1
    Click Element    ${EighteenthRPB}
    Input Text    ${EighteenthRPB}    4500
    Sleep    1
    Click Element    ${NineteenthRPB}
    Input Text    ${NineteenthRPB}    4700
    Sleep    1
    Click Element    ${TwentiethRPB}
    Input Text    ${TwentiethRPB}    5000
    Sleep    1
    Click Element    ${TwentyFirstRPB}
    Input Text    ${TwentyFirstRPB}    5200
    Sleep    1
    Click Element    ${TwentySecondRPB}
    Input Text    ${TwentySecondRPB}    5500
    Sleep    1
    Execute Javascript    window.scrollBy(0,1000)
    Click Element    ${TwentyThirdRPB}
    Input Text    ${TwentyThirdRPB}    5700
    Sleep    1
    Click Element    ${TwentyFourthRPB}
    Input Text    ${TwentyFourthRPB}    6000
    Sleep    1
    Click Element    ${TwentyFifthRPB}
    Input Text    ${TwentyFifthRPB}    6200
    Sleep    1
    Click Element    ${TwentySixthRPB}
    Input Text    ${TwentySixthRPB}    6500
    Sleep    1
    Click Element    ${TwentySeventhRPB}
    Input Text    ${TwentySeventhRPB}    6700
    Sleep    1
    Click Element    ${TwentyEighthRPB}
    Input Text    ${TwentyEighthRPB}    7000
    Sleep    1
    Click Element    ${TwentyNinthRPB}
    Input Text    ${TwentyNinthRPB}    7200
    Sleep    1
    Click Element    ${ThirtiethRPB}
    Input Text    ${ThirtiethRPB}    7500
    Sleep    1
    Click Element    ${ThirtyFirstRPB}
    Input Text    ${ThirtyFirstRPB}    7700
    Sleep    1
    Click Element    ${ThirtySecondRPB}
    Input Text    ${ThirtySecondRPB}    8000
    Sleep    1
    Click Element    ${ThirtyThirdRPB}
    Input Text    ${ThirtyThirdRPB}    8200
    Sleep    1
    Click Element    ${ThirtyFourthRPB}
    Input Text    ${ThirtyFourthRPB}    8500
    Sleep    1
    Click Element    ${ThirtyFifthRPB}
    Input Text    ${ThirtyFifthRPB}    8700
    Sleep    1
    Click Element    ${ThirtySixthRPB}
    Input Text    ${ThirtySixthRPB}    9000
    Sleep    1
    Click Element    ${ThirtySeventhRPB}
    Input Text    ${ThirtySeventhRPB}    9200
    Sleep    1
    Click Element    ${ThirtyEighthRPB}
    Input Text    ${ThirtyEighthRPB}    9500
    Sleep    1
    Click Element    ${ThirtyNinthRPB}
    Input Text    ${ThirtyNinthRPB}    9700
    Sleep    1
    Execute Javascript    window.scrollBy(0,1000)
    Click Element    ${FortiethRPB}
    Input Text    ${FortiethRPB}    10000
    Sleep    1
    Click Element    ${FortyFirstRPB}
    Input Text    ${FortyFirstRPB}    10200
    Sleep    1
    Click Element    ${FortySecondRPB}
    Input Text    ${FortySecondRPB}    10500
    Sleep    1
    Click Element    ${FortyThirdRPB}
    Input Text    ${FortyThirdRPB}    10700
    Sleep    1
    Click Element    ${FortyFourthRPB}
    Input Text    ${FortyFourthRPB}    11000
    Sleep    1
    Click Element    ${FortyFifthRPB}
    Input Text    ${FortyFifthRPB}    11200
    Sleep    1
    Click Element    ${FortySixthRPB}
    Input Text    ${FortySixthRPB}    11500
    Sleep    1

Enter RatePerTon For Scheme12
    Execute JavaScript    window.scrollBy(0, 3000)
    sleep   2
    ${load_temp_json}    Load Json From File    ${CURDIR}/../TestData/SchemesRate.json
    ${rate12}    Set Variable    ${load_temp_json}[Scheme12][RatePerTon]
    Set Global Variable    ${rate12}
    Wait Until Element Is Visible    ${FirstRate}    timeout=30s
    Click Element    ${FirstRate}
    Input Text    ${FirstRate}    ${rate12}
    Log To File    FirstRate:${rate12},
    Sleep    2
    ${updated_rate}    Evaluate    ${rate12}+1
    ${updatedjson}    Update Value To Json    ${load_temp_json}    $.Scheme12.RatePerTon    ${updated_rate}
    Dump Json To File    ${CURDIR}/../TestData/SchemesRate.json    ${updatedjson}

Enter RatePerTon For Scheme13
    Execute JavaScript    window.scrollBy(0, 3000)
    sleep   2
    # ${load_temp_json}    Load Json From File    ${CURDIR}/../TestData/SchemesRate.json
    # ${rate13}    Set Variable    ${load_temp_json}[Scheme13][RatePerTon]
    # Set Global Variable    ${rate13}
    Wait Until Element Is Visible    ${FirstRPB}    timeout=30s
    Click Element    ${FirstRPB}
    Input Text    ${FirstRPB}    30
    Log To File    FirstRate:30,
    Sleep    1
    Click Element    ${SecondRPB}
    Input Text    ${SecondRPB}    40
    Log To File    SecondRate:40,
    Sleep    1
    Click Element    ${ThirdRPB}
    Input Text    ${ThirdRPB}    50
    Log To File    ThirdRate:50,
    Sleep    1
    Click Element    ${FourthRPB}
    Input Text    ${FourthRPB}    60
    Log To File    FourthRate:60,
    # ${updated_rate}    Evaluate    ${rate13}+1
    # ${updatedjson}    Update Value To Json    ${load_temp_json}    $.Scheme13.RatePerTon    ${updated_rate}
    # Dump Json To File    ${CURDIR}/../TestData/SchemesRate.json    ${updatedjson}

Enter RatePerTon For Scheme15
    Execute JavaScript    window.scrollBy(0, 5000)
    sleep   2
    # ${load_temp_json}    Load Json From File    ${CURDIR}/../TestData/SchemesRate.json
    # ${rate13}    Set Variable    ${load_temp_json}[Scheme13][RatePerTon]
    # Set Global Variable    ${rate13}
    Wait Until Element Is Visible    ${FirstRPB}    timeout=30s
    Click Element    ${FirstRPB}
    Input Text    ${FirstRPB}    100
    Log To File    FirstRate:100,
    Sleep    1
    Click Element    ${SecondRPB}
    Input Text    ${SecondRPB}    120
    Log To File    SecondRate:120,
    Sleep    1
    Click Element    ${ThirdRPB}
    Input Text    ${ThirdRPB}    140
    Log To File    ThirdRate:140,
    Sleep    1
    Click Element    ${FourthRPB}
    Input Text    ${FourthRPB}    150
    Log To File    FourthRate:150,
    Sleep    1
    Execute Javascript    window.scrollBy(0, 3000)
    Wait Until Element Is Visible    ${FifthRPB}    timeout=30s
    Click Element    ${FifthRPB}
    Input Text    ${FifthRPB}    160
    Log To File    FifthRate:160,
    Sleep    1
    # ${updated_rate}    Evaluate    ${rate13}+1
    # ${updatedjson}    Update Value To Json    ${load_temp_json}    $.Scheme13.RatePerTon    ${updated_rate}
    # Dump Json To File    ${CURDIR}/../TestData/SchemesRate.json    ${updatedjson}

Enter RatePerTon For Scheme16Blended
    Execute JavaScript    window.scrollBy(0, 5000)
    sleep   2
    Wait Until Element Is Visible    ${FirstRPB}    timeout=30s
    Click Element    ${FirstRPB}
    Input Text    ${FirstRPB}    50
    Log To File    FirstRate:50,
    Sleep    1
    Click Element    ${SecondRPB}
    Input Text    ${SecondRPB}    55
    Log To File    SecondRate:55,
    Sleep    1
    Click Element    ${ThirdRPB}
    Input Text    ${ThirdRPB}    60
    Log To File    ThirdRate:60,
    Sleep    1
    Click Element    ${FourthRPB}
    Input Text    ${FourthRPB}    65
    Log To File    FourthRate:65,
    Sleep    1
    
Enter RatePerTon For Scheme16OPC
    Execute JavaScript    window.scrollBy(0, 5000)
    sleep   2
    ${load_temp_json}    Load Json From File    ${CURDIR}/../TestData/SchemesRate.json
    ${rate16OPC}    Set Variable    ${load_temp_json}[Scheme16OPC][RatePerTon]
    Wait Until Element Is Visible    ${FirstRPB}    timeout=30s
    Click Element    ${FirstRPB}
    Input Text    ${FirstRPB}    70
    Log To File    FirstRate:70,
    Sleep    1
    Click Element    ${SecondRPB}
    Input Text    ${SecondRPB}    75
    Log To File    SecondRate:75,
    Sleep    1
    Click Element    ${ThirdRPB}
    Input Text    ${ThirdRPB}    80
    Log To File    ThirdRate:80,
    Sleep    1
    Click Element    ${FourthRPB}
    Input Text    ${FourthRPB}    ${rate16OPC}
    Log To File    FourthRate:${rate16OPC},
    Sleep    1
    ${updated_rate}    Evaluate    ${rate16OPC}+1
    ${updatedjson}    Update Value To Json    ${load_temp_json}    $.Scheme16OPC.RatePerTon    ${updated_rate}
    Dump Json To File    ${CURDIR}/../TestData/SchemesRate.json    ${updatedjson}

Enter RatePerTon For Scheme17
    Fill First Row of Slab
    Fill Second Row of Slab
    Fill Third Row of Slab
    Fill Fourth Row of Slab

Fill First Row of Slab
    Execute JavaScript    window.scrollBy(0, 5000)
    Wait Until Element Is Visible    ${FirstRPB}    timeout=30s
    sleep   2
    Click Element    ${FirstRPB}
    Input Text    ${FirstRPB}    100
    Sleep    1
    Click Element    //tbody/tr[1]/td[3]/input[1]
    Input Text    //tbody/tr[1]/td[3]/input[1]    110
    Sleep    1
    Click Element    //tbody/tr[1]/td[4]/input[1]
    Input Text    //tbody/tr[1]/td[4]/input[1]    120
    Sleep    1
    Log To File    First Row Of Rate:100,110,120

Fill Second Row of Slab
    Wait Until Element Is Visible    ${SecondRPB}    timeout=30s
    Click Element    ${SecondRPB}
    Input Text    ${SecondRPB}    70
    Sleep    1
    Click Element    //tbody/tr[2]/td[3]/input[1]
    Input Text    //tbody/tr[2]/td[3]/input[1]    80
    Sleep    1
    Click Element    //tbody/tr[2]/td[4]/input[1]
    Input Text    //tbody/tr[2]/td[4]/input[1]    90
    Sleep    1
    Log To File    Second Row Of Rate:70,80,90

Fill Third Row of Slab
    Wait Until Element Is Visible    ${ThirdRPB}    timeout=30s
    Click Element    ${ThirdRPB}
    Input Text    ${ThirdRPB}    40
    Sleep    1
    Click Element    //tbody/tr[3]/td[3]/input[1]
    Input Text    //tbody/tr[3]/td[3]/input[1]    50
    Sleep    1
    Click Element    //tbody/tr[3]/td[4]/input[1]
    Input Text    //tbody/tr[3]/td[4]/input[1]    60
    Sleep    1
    Log To File    Third Row Of Rate:40,50,60

Fill Fourth Row of Slab
    Wait Until Element Is Visible    ${FourthRPB}    timeout=30s
    Click Element    ${FourthRPB}
    Input Text    ${FourthRPB}    10
    Sleep    1
    Click Element    //tbody/tr[4]/td[3]/input[1]
    Input Text    //tbody/tr[4]/td[3]/input[1]    20
    Sleep    1
    Click Element    //tbody/tr[4]/td[4]/input[1]
    Input Text    //tbody/tr[4]/td[4]/input[1]    30
    Sleep    1
    Log To File    Fourth Row Of Rate:10,20,30

Enter RatePerTonForScheme18
    Fill First Row of Slab for Scheme18
    Fill Second Row of Slab for Scheme18
    Fill Third Row of Slab for Scheme18
    Fill Fourth Row of Slab for Scheme18

Fill First Row of Slab for Scheme18
    Execute JavaScript    window.scrollBy(0, 10000)
    sleep   2
    Wait Until Element Is Visible    ${FirstRPB}    timeout=30s
    Click Element    ${FirstRPB}
    Input Text    ${FirstRPB}    10
    Sleep    1
    Click Element    //tbody/tr[1]/td[3]/input[1]
    Input Text    //tbody/tr[1]/td[3]/input[1]    20
    Sleep    1
    Click Element    //tbody/tr[1]/td[4]/input[1]
    Input Text    //tbody/tr[1]/td[4]/input[1]    30
    Log To File    First Row Of Rate:10,20,30
Fill Second Row of Slab for Scheme18
    Wait Until Element Is Visible    ${SecondRPB}    timeout=30s
    Click Element    ${SecondRPB}
    Input Text    ${SecondRPB}    40
    Sleep    1
    Click Element    //tbody/tr[2]/td[3]/input[1]
    Input Text    //tbody/tr[2]/td[3]/input[1]    50
    Sleep    1
    Click Element    //tbody/tr[2]/td[4]/input[1]
    Input Text    //tbody/tr[2]/td[4]/input[1]    60
    Sleep    1
    Log To File    Second Row Of Rate:40,50,60

Fill Third Row of Slab for Scheme18
    Wait Until Element Is Visible    ${ThirdRPB}    timeout=30s
    Click Element    ${ThirdRPB}
    Input Text    ${ThirdRPB}    70
    Sleep    1
    Click Element    //tbody/tr[3]/td[3]/input[1]
    Input Text    //tbody/tr[3]/td[3]/input[1]    80
    Sleep    1
    Click Element    //tbody/tr[3]/td[4]/input[1]
    Input Text    //tbody/tr[3]/td[4]/input[1]    90
    Sleep    1
    Log To File    Third Row Of Rate:70,80,90

Fill Fourth Row of Slab for Scheme18
    Wait Until Element Is Visible    ${FourthRPB}    timeout=30s
    Click Element    ${FourthRPB}
    Input Text    ${FourthRPB}    100
    Sleep    1
    Click Element    //tbody/tr[4]/td[3]/input[1]
    Input Text    //tbody/tr[4]/td[3]/input[1]    110
    Sleep    1
    Click Element    //tbody/tr[4]/td[4]/input[1]
    Input Text    //tbody/tr[4]/td[4]/input[1]    120
    Sleep    1
    Log To File    Fourth Row Of Rate:100,110,120

Enter RatePerTon For Scheme20
    Enter First Row Of Slab For Scheme20
    Enter Second Row Of Slab For Scheme20
    Enter Third Row Of Slab For Scheme20
    Enter Fourth Row Of Slab For Scheme20
    Enter Fifth Row Of Slab For Scheme20

Enter First Row Of Slab For Scheme20
    Execute JavaScript    window.scrollBy(0, 10000)
    sleep   2
    Wait Until Element Is Visible    ${FirstRPB}    timeout=30s
    Click Element    ${FirstRPB}
    Input Text    ${FirstRPB}    1
    Sleep    1
    Click Element    //tbody/tr[1]/td[3]/input[1]
    Input Text    //tbody/tr[1]/td[3]/input[1]    2
    Sleep    1
    Click Element    //tbody/tr[1]/td[4]/input[1]
    Input Text    //tbody/tr[1]/td[4]/input[1]    3
    Sleep    1
    Click Element    //tbody/tr[1]/td[5]/input[1]
    Input Text    //tbody/tr[1]/td[5]/input[1]    4
    Sleep    1
    Click Element    //tbody/tr[1]/td[6]/input[1]
    Input Text    //tbody/tr[1]/td[6]/input[1]    5
    Sleep    1
    Log To File    First Row Of Rate:1,2,3,4,5

Enter Second Row Of Slab For Scheme20
    Wait Until Element Is Visible    ${SecondRPB}    timeout=30s
    Click Element    ${SecondRPB}
    Input Text    ${SecondRPB}    6
    Sleep    1
    Click Element    //tbody/tr[2]/td[3]/input[1]
    Input Text    //tbody/tr[2]/td[3]/input[1]    7
    Sleep    1
    Click Element    //tbody/tr[2]/td[4]/input[1]
    Input Text    //tbody/tr[2]/td[4]/input[1]    8
    Sleep    1
    Click Element    //tbody/tr[2]/td[5]/input[1]
    Input Text    //tbody/tr[2]/td[5]/input[1]    9
    Sleep    1
    Click Element    //tbody/tr[2]/td[6]/input[1]
    Input Text    //tbody/tr[2]/td[6]/input[1]    10
    Sleep    1
    Log To File    Second Row Of Rate:6,7,8,9,10

Enter Third Row Of Slab For Scheme20
    Wait Until Element Is Visible    ${ThirdRPB}    timeout=30s
    Click Element    ${ThirdRPB}
    Input Text    ${ThirdRPB}    11
    Sleep    1
    Click Element    //tbody/tr[3]/td[3]/input[1]
    Input Text    //tbody/tr[3]/td[3]/input[1]    12
    Sleep    1
    Click Element    //tbody/tr[3]/td[4]/input[1]
    Input Text    //tbody/tr[3]/td[4]/input[1]    13
    Sleep    1
    Click Element    //tbody/tr[3]/td[5]/input[1]
    Input Text    //tbody/tr[3]/td[5]/input[1]    14
    Sleep    1
    Click Element    //tbody/tr[3]/td[6]/input[1]
    Input Text    //tbody/tr[3]/td[6]/input[1]    15
    Sleep    1
    Log To File    Third Row Of Rate:11,12,13,14,15

Enter Fourth Row Of Slab For Scheme20
    Wait Until Element Is Visible    ${FourthRPB}    timeout=30s
    Click Element    ${FourthRPB}
    Input Text    ${FourthRPB}    16
    Sleep    1
    Click Element    //tbody/tr[4]/td[3]/input[1]
    Input Text    //tbody/tr[4]/td[3]/input[1]    17
    Sleep    1
    Click Element    //tbody/tr[4]/td[4]/input[1]
    Input Text    //tbody/tr[4]/td[4]/input[1]    18
    Sleep    1
    Click Element    //tbody/tr[4]/td[5]/input[1]    
    Input Text    //tbody/tr[4]/td[5]/input[1]    19
    Sleep    1
    Click Element    //tbody/tr[4]/td[6]/input[1]
    Input Text    //tbody/tr[4]/td[6]/input[1]    20
    Sleep    1
    Log To File    Fourth Row Of Rate:16,17,18,19,20

Enter Fifth Row Of Slab For Scheme20
    Wait Until Element Is Visible    ${FifthRPB}    timeout=30s
    Click Element    ${FifthRPB}
    Input Text    ${FifthRPB}    21
    Sleep    1
    Click Element    //tbody/tr[5]/td[3]/input[1]
    Input Text    //tbody/tr[5]/td[3]/input[1]    22
    Sleep    1
    Click Element    //tbody/tr[5]/td[4]/input[1]
    Input Text    //tbody/tr[5]/td[4]/input[1]    23
    Sleep    1
    Click Element    //tbody/tr[5]/td[5]/input[1]
    Input Text    //tbody/tr[5]/td[5]/input[1]    24
    Sleep    1
    Click Element    //tbody/tr[5]/td[6]/input[1]
    Input Text    //tbody/tr[5]/td[6]/input[1]    25
    Sleep    1
    Log To File    Fifth Row Of Rate:21,22,23,24,25
    
Enter AbsoluteValue For Scheme5
    Execute JavaScript    window.scrollBy(0, 3000)
    sleep   2
    Wait Until Element Is Visible    ${FirstRate}    timeout=20s
    Click Element    ${FirstRate}
    Input Text    ${FirstRate}    5
    Log To File    FirstRate:5,
    Sleep    2
    Click Element    ${SecondRate}
    Input Text    ${SecondRate}    10
    Log To File    SecondRate:10,
    Sleep    2
    Click Element    ${ThirdRate}
    Input Text    ${ThirdRate}    20
    Log To File    ThirdRate:20,
    Sleep    2
    Click Element    ${FourthRate}
    Input Text    ${FourthRate}    30
    Log To File    FourthRate:30,
    Sleep    2
    Click Element    ${FifthRate}
    Input Text    ${FifthRate}    40
    Log To File    FifthRate:40,
    Sleep    2
    Execute JavaScript    window.scrollBy(0, 3000)
    sleep   2
    Click Element    ${SixthRate}
    Input Text    ${SixthRate}    50
    Log To File    SixthRate:50,
    Sleep    2    

Enter RatePerBag For Scheme4
    Execute JavaScript    window.scrollBy(0, 4000)
    sleep   2
    ${load_temp_json}    Load Json From File    ${CURDIR}/../TestData/SchemesRate.json
    ${rate4}    Set Variable    ${load_temp_json}[Scheme4][RatePerBag]
    Wait Until Element Is Visible    ${FirstRPB}    timeout=20s
    Click Element    ${FirstRPB}
    Input Text    ${FirstRPB}    0
    Log To File    FirstRate:0,
    Set Global Variable    ${rate4}
    Sleep    2
    Click Element    ${SecondRPB}
    Input Text    ${SecondRPB}    40
    Log To File    SecondRate:40,
    Sleep    2
    Click Element    ${ThirdRPB}
    Input Text    ${ThirdRPB}    ${rate4}
    Sleep    2
    Log To File    ThirdRate:${rate4},
    ${updated_rate}    Evaluate    ${rate4}+1
    ${updatedjson}    Update Value To Json    ${load_temp_json}    $.Scheme4.RatePerBag    ${updated_rate}
    Dump Json To File    ${CURDIR}/../TestData/SchemesRate.json    ${updatedjson}
    # Click Element    ${FourthRPB}
    # Input Text    ${FourthRPB}    40
    # Sleep    2
    # Click Element    ${FifthRPB}
    # Input Text    ${FifthRPB}    50
    # Sleep    2

Enter PartBSlab
    Execute Javascript    window.scrollBy(0, 2000)
    Wait Until Element Is Visible    ${PartBSlab}    timeout=30s
    Click Element    ${PartBSlab}
    Wait Until Element Is Visible   ${SelectPartBSlabType}
    Click Element   ${SelectPartBSlabType}
    ${rownum}=    Convert To Integer    ${Rownumber}
    ${data}=    readdata    PartBSlab  ${rownum}
    Log    ${data}
    Log To File    PartBSlab:${data},
    Select From List By Label  ${SelectPartBSlabType}   ${data}
    Sleep    2

Enter PartBRate
    Execute Javascript    window.scrollBy(0, 2000)
    Wait Until Element Is Visible    ${PartBRate}    timeout=20s
    Click Element    ${PartBRate}
    Sleep    1
    Wait Until Element Is Enabled    ${PartBRate}    timeout=20s
    Wait Until Element Is Visible    ${PartBRate}    timeout=20s
    Scroll Element Into View    ${PartBRate}
    # BuiltIn.Wait Until Keyword Succeeds    2s    2s    Click Element    ${PartBRate}
    Click Element    ${PartBRate}
    Input Text    ${PartBRate}    25
    Log To File    PartBRate:25,
    Sleep    2


View Scheme
    Execute JavaScript    window.scrollBy(0, 1000)
    # Force scroll to element    ${ViewScheme}
#    Run Keyword And Ignore Error    Scroll Element Into View    ${ViewScheme}
    Wait Until Element Is Visible    ${ViewScheme}    timeout=30s
    Click Element    ${ViewScheme}
    Sleep   2

Submit Scheme
    Wait Until Element Is Visible    ${Submit}    timeout=30s
    Click Element   ${Submit}
    Sleep   2

#retieves shemenumber after submitting scheme
Retrieve SchemeSubmissionSuccessfulMessage
    ${AlertText}    Handle Alert    timeout=120s
    ${status}    Run Keyword And Return Status    Should Contain    ${AlertText}    Created
    Run Keyword If    "${status}" == "False"    Fail    Scheme already exists or unable to create scheme
    ${SchemeNumber}  Retrieve SchemeNumber   ${AlertText}    3
    Log To Console  Scheme Number is ${SchemeNumber}
    RETURN    ${SchemeNumber}

#Store SchemeNumber Into Global Variable
Get SchemeNumber
    ${ReturunValue}=    Retrieve SchemeSubmissionSuccessfulMessage
    Set Global Variable    ${SchemeNumber}    ${ReturunValue}
    Log To File    Scheme Number: ${SchemeNumber},
    RETURN  ${SchemeNumber}

#get schemenumber after every alert
Retrieve SchemeNumber
    [Arguments]  ${Text}    ${Index}
    ${WordsInAlert}  Split String    ${text}  
    ${SchemeNumber}  Set Variable    ${WordsInAlert}[${index}]
    RETURN  ${SchemeNumber}

#retieves shemenumber after scheme recommended
Retrieve StatusChangeAlert
    ${AlertText}    Handle Alert
    ${SchemeNumber}  Retrieve SchemeNumber   ${AlertText}    0
    Sleep   10
    Log To Console  Scheme Number is ${SchemeNumber}
#    Handle Alert    accept
    Sleep   10
    RETURN    ${SchemeNumber}

Filter Scheme
    [Arguments]  ${SchemeNumber}
    Wait Until Page Contains    Scheme Index
    Wait Until Element is Visible   ${Filters}    timeout=30s
    Sleep   2
    Wait Until Element Is Enabled    ${Filters}    timeout=30s
    Click Element   ${Filters}
#    Sleep   5
    Wait Until Element Is Visible    ${ResetFilter}    timeout=30s
    Click Element   ${ResetFilter}
    Wait Until Element Is Enabled    ${GetData}    timeout=30s
    Click Element   ${GetData}
    Wait Until Element Is Visible   ${Filters}    timeout=50s
    # Wait Until Element Is Enabled    ${Filters}    timeout=30s
    Sleep    2
    Click Element   ${Filters}
    Sleep   2
    Wait Until Element Is Visible    ${SchemeNumber_loc}    timeout=30s
    Click Element   ${SchemeNumber_loc}
    Sleep    2
    # Input Text    ${SchemeNumber_loc}    ${SchemeNumber}       
    Execute Javascript    document.evaluate(arguments[0], document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.value \= arguments[1];    ARGUMENTS    ${SchemeNumber_loc}    ${SchemeNumber}
    Click Element   ${SchemeNumber_loc}
    SeleniumLibrary.Press Keys    None    END
    SeleniumLibrary.Press Keys    None    BACKSPACE
    # SeleniumLibrary.Press Keys    None    ${SchemeNumber}[-1]
    SeleniumLibrary.Press Keys    None    END
    SeleniumLibrary.Press Keys    None    CTRL+z
    Sleep   2
    Wait Until Element Is Enabled    ${GetData}    timeout=30s
    Click Element   ${GetData}
    Sleep   2

Force scroll to element
    [Arguments]    ${element_xpath}
    Execute Javascript    document.evaluate ('${element_xpath}', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView();
 
Close Browser window
    close browser