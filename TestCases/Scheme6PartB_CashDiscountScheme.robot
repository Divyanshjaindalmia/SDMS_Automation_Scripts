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
${Rownumber}    7

*** Test Cases ***
TC08_CreateScheme6_CashDiscountScheme
    [Tags]    SDMS    Scheme6PartB_CashDiscountScheme
    ${scheme_6_Status}    Load Json From File    ${EXECDIR}/Resources/Custom_handler.json
    Skip If    "${scheme_6_Status["Scheme6PartA"]}"=="FAIL"    msg=Scheme 06A Dependency Failed. Skipping Test
    # Create new scheme type6    
    # Unblock Scheme Successfully
    # PreCalculate Approved Scheme
    Log To File    Scheme6PartB_CashDiscountScheme Starts
    Read Scheme Number
    Recommend Scheme Successfully
    Validate Scheme Successfully
    Approve Scheme Successfully
    Download PreCalculation To Get Total BilledQuantity
    Validate Payment and Invoice Dates
    Remove Scheme Number
    Log To File    Scheme6PartB_CashDiscountScheme Ends