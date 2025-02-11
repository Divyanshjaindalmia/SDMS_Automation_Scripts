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
${Rownumber}    11

*** Test Cases ***
TC012_CreateScheme10_SpecialDiscountQuantityDiscountScheme
    [Tags]    SDMS    Scheme10_SpecialDiscountQuantityDiscountScheme
    Log To File    Scheme10_SpecialDiscountQuantityDiscountScheme Starts
    Create new scheme type10
    Unblock Scheme Successfully
    PreCalculate Unblocked Scheme
    Recommend Scheme Successfully
    Validate Scheme Successfully
    Approve Scheme Successfully    
    # PreCalculate Approved Scheme
    Download PreCalculation To Get Total BilledQuantity
    Validate Billed Quantity Of Customer
    Validate Discount Given To Customer
    Log To File    Scheme10_SpecialDiscountQuantityDiscountScheme Ends
    