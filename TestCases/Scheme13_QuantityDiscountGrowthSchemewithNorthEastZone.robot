*** Settings ***
Library  SeleniumLibrary
Library  BuiltIn
Library    OperatingSystem
Library    ../Resources/Utility.py
Library    Collections
Library    String
Library    DateTime
Library    ScreenCapLibrary
Resource    ../POM/RebateProcessSchemeCreation.robot
Resource    ../POM/SchemeIndex.robot
Resource    ../POM/SchemeApproval.robot
Resource    ../POM/PreCalculate.robot
Resource    ../POM/CalculationVerification.robot
Resource    ../POM/CalculationPosting.robot
Resource    ../POM/DBValidation.robot
Resource    ../POM/ProvisionSchemeList.robot
Resource    ../POM/ProvisionCalculation.robot
Resource    ../POM/ProvisionPosting.robot
Resource    ../POM/DBValidation.robot

Suite Setup    Launch Application
Suite Teardown    Close Browser window

*** Variables ***
${Rownumber}    14

*** Test Cases ***
TC015_CreateScheme13_QuantityDiscountGrowthSchemewithNorthEastZone
    [Tags]    SDMS    Scheme13_QuantityDiscountGrowthSchemewithNorthEastZone
    Log To File    Scheme13_QuantityDiscountGrowthSchemewithNorthEastZone Starts
    Create New Scheme Type13
    Unblock Scheme Successfully
    PreCalculate Unblocked Scheme
    Recommend Scheme Successfully
    Validate Scheme Successfully
    Approve Scheme Successfully
    Download PreCalculation To Get Total BilledQuantity
    Retrieve Billed Quantity From DB And Validate with PreperiodMin and Max Qty
    Calcluate Growth and Validate Rate
    Log To File    Scheme13_QuantityDiscountGrowthSchemewithNorthEastZone Ends