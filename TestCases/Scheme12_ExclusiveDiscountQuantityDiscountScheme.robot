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



# Suite Setup    Run Keywords    Launch Application    AND    Start Video Recording
# Suite Teardown    Run Keywords    Close Browser window    AND    Stop Video Recording
Suite Setup    Launch Application
Suite Teardown    Close Browser window

*** Variables ***
${Rownumber}    13

*** Test Cases ***
TC014_CreateScheme12_ExclusiveDiscountQuantityDiscountScheme
    [Tags]    SDMS    Scheme12_ExclusiveDiscountQuantityDiscountScheme
    Log To File    Scheme12_ExclusiveDiscountQuantityDiscountScheme Starts
    Create New Scheme Type12
    Unblock Scheme Successfully
    PreCalculate Unblocked Scheme
    Recommend Scheme Successfully
    Validate Scheme Successfully
    Approve Scheme Successfully
    # PreCalculate Approved Scheme
    Download Calculation
    Validate Rate
    Validate Billed Quantity By Material
    Log To File    Scheme12_ExclusiveDiscountQuantityDiscountScheme Ends