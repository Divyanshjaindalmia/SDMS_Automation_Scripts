*** Settings ***
Library  Process
Library  SeleniumLibrary
Library  BuiltIn
Library    OperatingSystem
Library    Collections
Library    String
Library    ../Resources/Utility.py
Resource    RebateProcessSchemeCreation.robot
Resource    SchemeApproval.robot
Resource    ProvisionCalculation.robot

*** Variables ***
${Budget&Provision}  //b[contains(text(),'Budget & Provision')]
${ProvisionSchemeList}  //a[contains(text(),'Provision Scheme List')]
${FilterProvsionScheme}  //span[contains(text(),'Filters')]
${SelectMonth}  //input[@type='month' and @name='selectMonth']
${SelectProvScheme}  //div[@class='ui-chkbox-box ui-widget ui-state-default']
${CalculateProvision}   //button[contains(text(),'Calculate Provision')]
# ${ProvisionCalculation}   //a[contains(text(),'Provision Calculation ')]
# ${DownloadCalculation}  //button[contains(text(),'Download Calculation')]
# ${CalculationStatus}    //tbody/tr[1]/td[8]

*** Keywords ***
Provision Scheme List
    Sleep    1
    Click Element   ${Budget&Provision}
    Wait Until Element Is Visible   ${ProvisionSchemeList}   timeout=30s
    Click Element   ${ProvisionSchemeList}
    Filter Provsion Scheme    ${SchemeNumber}
    Wait Until Element Is Visible   ${SelectProvScheme}   timeout=30s
    Click Element  ${SelectProvScheme}
    Wait Until Element Is Visible   ${CalculateProvision}
    Click Element   ${CalculateProvision}
    Sleep   5
    ${AlertText}    Handle Alert
    log  Provision Calculation started
    Sleep   3
    Wait Until Element Is Visible   ${ProvisionCalculation}   timeout=30s
    Sleep    2
    Click Element   ${ProvisionCalculation}
    Filter Provsion Scheme    ${SchemeNumber}
    Wait And Refresh Until Status Changes   ${CalculationStatus}

Filter Provsion Scheme
    [Arguments]  ${SchemeNumber}
    Wait Until Element Is Visible   ${FilterProvsionScheme}   timeout=30s
    Click Element   ${FilterProvsionScheme}
    Wait Until Element Is Visible   ${SchemeNumber_loc}
    Click Element   ${SchemeNumber_loc}
    Input Text  ${SchemeNumber_loc}  ${SchemeNumber}
    Sleep   2
    Wait Until Element Is Visible   ${SelectMonth}   timeout=30s
    # ${month}    getcurrentmonth
    ${month}    Getpreviousmonth
    ${year}  getcurrentyear
    SeleniumLibrary.Press Keys    ${SelectMonth}    ${month}
    Press Key    ${SelectMonth}    ARROW_RIGHT
    SeleniumLibrary.Press Keys    ${SelectMonth}    ${year}
    Sleep   2
    Click Element   ${GetData}
    Sleep   2