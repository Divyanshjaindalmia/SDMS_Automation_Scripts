*** Settings ***
Library  SeleniumLibrary
Library  BuiltIn
Library    OperatingSystem
Library    ../Resources/Utility.py
Library    Collections
Library    String
Library    ScreenCapLibrary
Resource    ../POM/RebateProcessSchemeCreation.robot
Resource    ../POM/SchemeIndex.robot
Resource    ../POM/SchemeApproval.robot
Resource    ../POM/PreCalculate.robot
Resource    ../POM/CalculationVerification.robot
Resource    ../POM/CalculationPosting.robot
Resource    ../POM/DBValidation.robot
Suite Setup    Launch Application
Suite Teardown    Close Browser window


*** Variables ***
${CHROME_OPTIONS}    --disable-infobars
${DOWNLOAD_DIR}    ${EXECDIR}//TestData//Downloads
#Global Variables
${AlertText}=   PASS

${AddNewScheme}     //button[@title='Add New scheme']
${CompanyCode}      //*[@name='comcodefrom']
${Schemecategory}   //select[@name='schemeCategory']
${Calschemetype}       //select[@name='schemeType']
${Schemetype}       //select[@name='custschemeType']
${Schemenarration}      //input[@name='schemeNaration']
${Fromdate}     //input[@name='scheme.fromDate']
${rownum}    0
*** Test Cases ***
TC01_Create_QuantityDiscountSchemeOfType1
    [Tags]    SDMS    Scheme1_QuantityDiscountScheme
    Log To File    Scheme1_QuantityDiscountScheme Starts
    Create New Standard Scheme
    Unblock Scheme Successfully
    PreCalculate Unblocked Scheme
    Recommend Scheme Successfully
    Validate Scheme Successfully
    Approve Scheme Successfully
    # PreCalculate Approved Scheme
    Download PreCalculation To Get Total BilledQuantity
    Validate Rate With Slab Provided
    Rebate Calculation
    Calculation Verification
    Calculation Posting
    Validate And Compare Billed Quantity
    Log To File    Scheme1_QuantityDiscountScheme Ends