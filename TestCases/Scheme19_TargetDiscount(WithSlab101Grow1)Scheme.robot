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
Resource    ../POM/DBValidation.robot

Suite Setup    Launch Application
Suite Teardown    Close Browser window

*** Variables ***
${Rownumber}    21

*** Test Cases ***
TC022_CreateScheme19
    [Tags]    SDMS    Scheme19_TargetDiscountScheme
    Log To File    Scheme19_TargetDiscountScheme Starts
    Create New Scheme Type19
    Unblock Scheme Successfully
    PreCalculate Unblocked Scheme
    Recommend Scheme Successfully
    Validate Scheme Successfully
    Approve Scheme Successfully
    Download Calculation
    Validate Discount Provided To Customer According To BilledQty And AchievementPercentage
    Log To File    Scheme19_TargetDiscountScheme Ends