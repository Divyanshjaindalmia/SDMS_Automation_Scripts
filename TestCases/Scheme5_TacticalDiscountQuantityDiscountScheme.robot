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
${Rownumber}    6

*** Test Cases ***
TC07_CreateScheme5_TacticalDiscountQuantityDiscount
    [Tags]    SDMS    Scheme5_TacticalDiscountQuantityDiscount
    Log To File    Scheme5_TacticalDiscountQuantityDiscount Starts
    Create new scheme type5
    Unblock Scheme Successfully
    PreCalculate Unblocked Scheme
    Recommend Scheme Successfully
    Validate Scheme Successfully
    Approve Scheme Successfully
    # PreCalculate Approved Scheme
    Download PreCalculation To Get Total BilledQuantity
    Validate AbsoluteValue According to Quantity
    Check If Quantity Is GreaterThan MinQtyInTons
    Log To File    Scheme5_TacticalDiscountQuantityDiscount Ends