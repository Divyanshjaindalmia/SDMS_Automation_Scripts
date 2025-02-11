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
Resource    ../POM/ProvisionSchemeList.robot
Resource    ../POM/ProvisionCalculation.robot
Resource    ../POM/ProvisionPosting.robot
Resource    ../POM/DBValidation.robot
Suite Setup    Launch Application
Suite Teardown    Close Browser window
*** Variables ***
${Rownumber}    1
${Rateperbag}   //tbody/tr[1]/td[2]/input[1]

*** Test Cases ***
TC02_CreateScheme2_ProvsionScheme
    [Tags]    SDMS    Scheme2_ProvisionScheme
    # Load data    Scheme2        #For Intenal Dev Json only
    # Sleep   5
    Log To File    Scheme2_ProvisionScheme Starts
    Create New Provision Scheme
    # Unblock Scheme Successfully
    PreCalculate Unblocked Scheme
    Recommend Scheme Successfully
    Validate Scheme Successfully
    Approve Scheme Successfully
    Provision Scheme List
    Download Provision Calculation To Get Total BilledQuantity
    Approve Provision Calculation
    Post Provision Scheme
    Validate And Compare Billed Quantity
    Validate Discount
    Log To File    Scheme2_ProvisionScheme Ends