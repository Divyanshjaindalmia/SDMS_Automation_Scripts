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
${Rownumber}    10

*** Test Cases ***
TC011_CreateScheme9_SubDealerScheme
    [Tags]    SDMS    Scheme9PartB_SubDealerScheme
    Log To File    Scheme9PartB_SubDealerScheme Starts
    ${scheme_9_Status}    Load Json From File    ${EXECDIR}/Resources/Custom_handler.json
    Skip If    "${scheme_9_Status["Scheme9PartA"]}"=="FAIL"    msg=Scheme 09 Dependency Failed. Skipping Test
    # Create new scheme type9
    # Unblock Scheme Successfully
    # PreCalculate Approved Scheme
    Read Scheme Number9
    Recommend Scheme Successfully
    Validate Scheme Successfully
    Approve Scheme Successfully
    Download Precalculation And Discount Given To SubDealer
    Validate Billed Quantity Of SubDealer
    Remove Scheme Number9
    Log To File    Scheme9PartB_SubDealerScheme Ends