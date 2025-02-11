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
Suite Teardown    Run Keywords    Close Browser window    AND    Status_OPS

*** Variables ***
${Rownumber}    10
${SUITE_9part_A_STATUS}    PASS

*** Test Cases ***
TC011_CreateScheme9_SubDealerScheme
    [Tags]    SDMS    Scheme09PartA_SubDealerScheme
    Log To File    Scheme09PartA_SubDealerScheme Starts
    Create new scheme type9
    Unblock Scheme Successfully
    Precalculate Scheme6
    # Recommend Scheme Successfully
    # Validate Scheme Successfully
    # Approve Scheme Successfully
    # PreCalculate Approved Scheme
    Log To File    Scheme09PartA_SubDealerScheme Ends

*** Keywords ***
Status_OPS
    ${OX}    Load Json From File    ${EXECDIR}/Resources/Custom_handler.json
    ${Updated_Access_token_pushData}    Update Value To Json    ${OX}    $.Scheme9PartA    ${SUITE STATUS}
    Dump Json To File    ${EXECDIR}/Resources/Custom_handler.json    ${Updated_Access_token_pushData}