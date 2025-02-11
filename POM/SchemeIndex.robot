*** Settings ***
Library  Process
Library  SeleniumLibrary
Library  BuiltIn
Library    OperatingSystem
Library    ../Resources/Utility.py
Library    Collections
Library    String
Library    RPA.FTP
Resource    ../POM/CalculationPosting.robot
Resource    StoreSchemeNumber.robot

*** Keywords ***
Launch Application
    ${GetEnvData}=    getENVDetails
    Log    ${GetEnvData}
    ${url}    Set Variable    ${GetEnvData}[Url]
    log     ${url}
    ${userName}    Set Variable    ${GetEnvData}[Username]
    ${password}    Set Variable    ${GetEnvData}[Password]
    ${downloadDirectory}    Set Variable    ${EXECDIR}\\TestData\\Downloads
    # ${downloadDirectory}    Set Variable    C:\\Users\\girid\\Desktop\\sdms\\TestData\\Downloads
    ${prefs}=    Create Dictionary    download.default_directory=${downloadDirectory}    download.prompt_for_download=${False}
    open Browser    ${url}    ${Browser}    options=add_experimental_option("prefs",${prefs});add_argument("force-device-scale-factor=0.65")
    # Set Selenium Implicit Wait    10
    maximize browser window
    sleep   1
    Click Element  ${UserName_loc}
    input text  ${UserName_loc}  ${userName}
    sleep   1
    Click Element  ${Password_loc}
    input text  ${Password_loc}  ${password}
    sleep   1
    click element   ${Login_loc}
    sleep   2

Create New Standard Scheme
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
#    sleep   10
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    # Enter FromDate
    # Enter ToDate
    Enter FromDate For Scheme3
    Enter ToDate For Scheme3
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate
    Enter Scheme Doc No
    Enter SalesOrganisation
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegion
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePerBag For Standard Scheme
    View Scheme
    Submit Scheme
    Get SchemeNumber

Create New Provision Scheme
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    # Enter FromDate
    # Enter ToDate
    Enter FromDate For Scheme3
    Enter ToDate For Scheme3
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate
    Enter Scheme Doc No
    Enter SalesOrganisation
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegion
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePerBag For Provision Scheme
    View Scheme
    Submit Scheme
    Get SchemeNumber

create new scheme of type3 with Incremental Quantity
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme3
    Enter ToDate For Scheme3
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate
    Enter Scheme Doc No
    Enter SalesOrganisation
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegion
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Enter PreQualifierType
    Enter PrevFromDateQualifier
    Enter PrevToDateQualifier
    Enter PrePeriodFromDate
    Enter PrePeriodToDate
    Enter PrePeriodMinimumQuantity
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePerBag For Scheme type3
    View Scheme
    Submit Scheme
    Get SchemeNumber

create new scheme of type3 with Incremental Quantity Actual
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme3
    Enter ToDate For Scheme3
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate
    Enter Scheme Doc No
    Enter SalesOrganisation
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegion
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Enter PreQualifierType
    Enter PrevFromDateQualifier
    Enter PrevToDateQualifier
    Enter PrePeriodFromDate
    Enter PrePeriodToDate
    Enter PrePeriodMinimumQuantity
    Enter PrePeriodMaximumQuantity
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePerBag For Scheme type3
    View Scheme
    Submit Scheme
    Get SchemeNumber

Create new scheme type4 rake Discount
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    # Enter FromDate
    # Enter ToDate
    Enter FromDate For Scheme3
    Enter ToDate For Scheme3
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate
    Enter Scheme Doc No
    Enter SalesOrganisation
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegion
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Select Rake Quantity
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePerBag For Scheme4
    View Scheme
    Submit Scheme
    Get SchemeNumber

Create new scheme type5
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme5
    Enter ToDate For Scheme5
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate For Scheme5
    Enter Scheme Doc No
    Enter SalesOrganisation
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegion
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Enter PrePeriodFromDate For Scheme5
    Enter PrePeriodToDate For Scheme5
    Enter MinQtyInTons For Scheme5
    Enter PrePeriodMinimumQuantity
    Enter PrePeriodMaximumQuantity
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter AbsoluteValue For Scheme5
    View Scheme
    Submit Scheme
    Get SchemeNumber

Create new scheme type6
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme6
    Enter ToDate For Scheme6
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate For Scheme6
    Enter Scheme Doc No
    Enter SalesOrganisation For Scheme6
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegion
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePerBag For Scheme6
    View Scheme
    Submit Scheme
    Get SchemeNumber
    Store Scheme Number


Create new scheme type7
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme7
    Enter ToDate For Scheme7
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate For Scheme7
    Enter Scheme Doc No
    Enter SalesOrganisation
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegion
    Enter Sub States For Scheme7
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter Rate Per Ton For Scheme7
    View Scheme
    Submit Scheme
    Get SchemeNumber

Create new scheme type8
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    # Enter FromDate
    # Enter ToDate
    Enter FromDate For Scheme3
    Enter ToDate For Scheme3
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate For Scheme8
    Enter Scheme Doc No
    Enter SalesOrganisation
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegion
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    # Enter PrePeriodMinimumQuantity
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePerTon For Scheme8
    View Scheme
    Submit Scheme
    Get SchemeNumber

Create new scheme type9
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme3
    Enter ToDate For Scheme3
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate For Scheme9
    Enter Scheme Doc No
    Enter SalesOrganisation
    Enter SalesOrganisation Filters For Scheme9
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegion
    Enter CustomerRegion Filters For Scheme9
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePerTon For Scheme9
    View Scheme
    Submit Scheme
    Get SchemeNumber
    Store Scheme Number9

Create new scheme type10
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode Filter For Scheme10
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme10
    Enter ToDate For Scheme10
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate For Scheme10
    Enter Scheme Doc No
    Enter SalesOrganisation Filters For Scheme10
    # Enter DistributionChannel Filter For Scheme10
    Enter DistributionChannel
    Enter Division Filters For Scheme10
    Enter Plant Filters
    Enter CustomerRegionFilters For Scheme10
    Enter CustomersFromTo
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePErTon For Scheme10
    View Scheme
    Submit Scheme
    Get SchemeNumber
    
Create New Scheme Type11
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme3
    Enter ToDate For Scheme3
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate For Scheme8
    Enter Scheme Doc No
    Enter SalesOrganisation
    Enter SalesOrganisation Filters For Scheme11
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegion
    Enter CustomerRegionFilters For Scheme11
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePerTon For Scheme11
    View Scheme
    Submit Scheme
    Get SchemeNumber

Create New Scheme Type12
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode Filters For Scheme12
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme7
    Enter ToDate For Scheme7
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate For Scheme7
    Enter Scheme Doc No
    Enter SalesOrganisation Filters For Scheme12
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegionFilters For Scheme12
    Enter CustomerDistricts For Scheme12
    Enter Exclusive Customers To Scheme
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Enter Material To Be Excluded
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePerTon For Scheme12
    View Scheme
    Submit Scheme
    Get SchemeNumber

Create New Scheme Type13
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode Filter For Scheme10
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme3
    Enter ToDate For Scheme3
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate For Scheme13
    Enter Scheme Doc No
    Enter SalesOrganisation For Scheme13
    # Enter DistributionChannel Filter For Scheme10
    Enter DistributionChannel
    Enter Division Filters For Scheme10
    Enter CustomerRegionFilters For Scheme13
    Enter CustomersFromTo
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Enter PreQualifierType
    Enter PrevFromDate For Scheme13
    Enter PrevToDate For Scheme13
    Enter PayOutFromDateForScheme13
    Enter PayOutToDateForScheme13
    Enter PrePeriodFromDate For Scheme13
    Enter PrePeriodToDate For Scheme13
    Enter PrePeriodMinimumQuantity
    Enter PrePeriodMaximumQuantity
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePerTon For Scheme13
    Enter PartBSlab
    Enter PartBRate
    View Scheme
    Submit Scheme
    Get SchemeNumber

 Create New Scheme Type14
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme3
    Enter ToDate For Scheme3
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate For Scheme8
    Enter Scheme Doc No
    Enter SalesOrganisation
    Enter SalesOrganisation Filters For Scheme11
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegion
    Enter SalesDistricts For Scheme14
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    # Enter ProfitCenter
    Upload SchemeDocument
    Enter FielToUpload For Scheme14
    View Scheme
    Submit Scheme
    Get SchemeNumber

 Create New Scheme Type15
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme15
    Enter ToDate For Scheme15
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate For Scheme15
    Enter Scheme Doc No
    Enter SalesOrganisation
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegion
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Enter PreQualifierType
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePerTon For Scheme15
    View Scheme
    Submit Scheme
    Get SchemeNumber

Create New Scheme Type16 For Blended
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme3
    Enter ToDate For Scheme3
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate
    Enter Scheme Doc No
    Enter SalesOrganisation
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegion For Scheme16
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Enter PreQualifierType
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePerTon For Scheme16Blended
    View Scheme
    Submit Scheme
    Get SchemeNumber

Create New Scheme Type16 For OPC
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme3
    Enter ToDate For Scheme3
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate
    Enter Scheme Doc No
    Enter SalesOrganisation
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegion For Scheme16
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Enter PreQualifierType
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePerTon For Scheme16OPC
    View Scheme
    Submit Scheme
    Get SchemeNumber

Create New Scheme Type17
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme3
    Enter ToDate For Scheme3
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate
    Enter Scheme Doc No
    Enter SalesOrganisation
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegion
    Enter CustomerRegionFilters For Scheme17
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Enter PreQualifierType
    Enter PayOutToDateForScheme17
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePerTon For Scheme17
    View Scheme
    Submit Scheme
    Get SchemeNumber

Create New Scheme Type18
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme3
    Enter ToDate For Scheme3
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate For Scheme18
    Enter Scheme Doc No
    Enter SalesOrganisation
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegionFilters For Scheme18
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Choose Discount On Actual Quantity
    Enter Incremental Quantity in Tons
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePerTonForScheme18
    View Scheme
    Submit Scheme
    Get SchemeNumber

Create New Scheme Type19
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme3
    Enter ToDate For Scheme3
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate For Scheme18
    Enter Scheme Doc No
    Enter SalesOrganisation
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegionFilters For Scheme18
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Choose Discount On Actual Quantity
    Upload SchemeDocument
    Choose SlabEntry And FielToUpload For Scheme19
    Enter SlabType For Scheme19
    Enter RatePerTonForScheme18
    View Scheme
    Submit Scheme
    Get SchemeNumber

Create New Scheme Type20
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Enter a new parent scheme
    Wait Until Element Is Visible    //a[text()="Scheme Index"]    timeout=20s
    Sleep    5s
    Click Element    //a[text()="Scheme Index"]
    Wait Until Element Is Visible    ${AddNewScheme}    timeout=30s
    Click Element   ${AddNewScheme}
    ${HaederText}   SeleniumLibrary.Get Text    xpath=//h3
    Should Be Equal As Strings  ${PageTitle}    ${HaederText}
    Enter CompanyCode Filters For Scheme12
    Enter SchemeCategory
    Enter CalSchemeType
    Enter SchemeType
    Enter SchemeNarration
    Enter FromDate For Scheme20
    Enter ToDate For Scheme20
    Enter SchemePeriod
    Enter Zone
    Enter AnnouncementDate For Scheme20
    Enter Scheme Doc No
    Enter SalesOrganisation Filters For Scheme12
    Enter DistributionChannel
    Enter Division
    Enter CustomerRegionFilters For Scheme12
    Enter DiscountG/LAccount
    Enter LiableG/LAccount
    Enter PrePeriodFromDate For Scheme20
    Enter PrePeriodToDate For Scheme20
    Choose Discount On Actual Quantity
    Enter Target Days
    Enter PrePeriodMinimumQuantity
    Enter PrePeriodMaximumQuantity
    Upload SchemeDocument
    Enter RebateSlabGrid
    Enter RatePerTon For Scheme20
    View Scheme
    Submit Scheme
    Get SchemeNumber

Log To File
    [Arguments]    ${input_data}
    OperatingSystem.Append To File    ${EXECDIR}/Custom Report/log.txt    ${input_data}${\n}