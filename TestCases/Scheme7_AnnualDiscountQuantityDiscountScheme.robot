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
${Rownumber}    8

*** Test Cases ***
TC09_CreateScheme7_AnnualDiscountQuantityDiscountScheme
    [Tags]    SDMS    Scheme7_AnnualDiscountQuantityDiscountScheme
    Log To File    Scheme7_AnnualDiscountQuantityDiscountScheme Starts
    Create new scheme type7
    Unblock Scheme Successfully
    PreCalculate Unblocked Scheme
    Recommend Scheme Successfully
    Validate Scheme Successfully
    Approve Scheme Successfully
    # PreCalculate Approved Scheme
    Download PreCalculation And Get Average Quantity
    Validate Billed Quantity From DB
    Log To File    Scheme7_AnnualDiscountQuantityDiscountScheme Ends