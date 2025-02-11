*** Settings ***
Library  Process
Library  SeleniumLibrary
Library  BuiltIn
Library    OperatingSystem
Library    Collections
Library    String
Library    ../Resources/Utility.py
Resource    RebateProcessSchemeCreation.robot
Resource    ProvisionSchemeList.robot

*** Variables ***
${ProvisioPosting}  (//a[contains(text(),'Calculation Posting')])[2]
${SelectProvScheme_Radio}    //div[@class="mat-radio-container"]
${Action}   //button[contains(text(),'Action')]
${CheckBoxForPosting}   (//div[@class='mat-checkbox-inner-container mat-checkbox-inner-container-no-side-margin'])[2]
${PostProvision}    //button[contains(text(),'Post Provision')]

*** Keywords ***
Post Provision Scheme
    Wait Until Element Is Visible    ${ProvisioPosting}    timeout=30s
    Click Element   ${ProvisioPosting}
    Filter Provsion Scheme  ${SchemeNumber}
    Run Keyword And Ignore Error    Wait Until Element Is Visible   ${SelectProvScheme_Radio}   timeout=30s
    Sleep    3s
    Click Element    ${SelectProvScheme_Radio}
    Wait Until Element Is Visible   ${Action}   timeout=30s
    Click Element  ${Action}
    Wait Until Element Is Visible   ${CheckBoxForPosting}   timeout=30s
    Click Element  ${CheckBoxForPosting}
    Sleep   2
    Click Element   ${PostProvision}
    Sleep    2
    ${AlertText}    Handle Alert
    log  Provision scheme has been posted