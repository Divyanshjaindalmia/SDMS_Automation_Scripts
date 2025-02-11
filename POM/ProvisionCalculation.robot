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
Resource    PreCalculate.robot
Resource    ProvisionSchemeList.robot
    
*** Variables ***
${ProvisionCalculation}   //a[contains(text(),'Provision Calculation ')]
${DownloadCalculation}  //button[contains(text(),'Download Calculation')]
${CalculationStatus}    //tbody/tr[1]/td[8]
${MaxRefreshAttempts}   150
${RefreshInterval}  5s

*** Keywords ***
Download Provision Calculation To Get Total BilledQuantity
    Download Provision Calculation
    GetLatestDownloadedPreCalculationFile    precal
Download Provision Calculation
    # Wait Until Element Is Visible   ${ProvisionCalculation}   timeout=10s
    # Sleep    2
    # Click Element   ${ProvisionCalculation}
    # Filter Provsion Scheme  ${SchemeNumber}
    # Wait And Refresh Until Status Changes   ${CalculationStatus}
    Wait Until Element Is Visible   ${SelectProvScheme}   timeout=10s
    Click Element  ${SelectProvScheme}
    Wait Until Element Is Visible   ${DownloadCalculation}   timeout=10s
    Click Element   ${DownloadCalculation}
    Sleep   5
    Wait Until Element Is Visible   ${SaveCal}   timeout=30s
    Click Element   ${SaveCal}
    log  Provision Calculation downloaded
    Sleep   2

Approve Provision Calculation
    Wait Until Element Is Visible    ${CalStatus}    timeout=10s
    Click Element    ${CalStatus}
    Sleep    2
    Wait Until Element Is Visible    ${ApproveSchemeCalButton}    timeout=10s
    Click Element    ${ApproveSchemeCalButton}
    Sleep    2
    Wait Until Element Is Visible    ${SubmitCalApprove}    timeout=10s
    Click Element    ${SubmitCalApprove}
    Sleep   10
    ${AlertText}    Handle Alert    timeout=50s
    log  Provision Calculation Approved

Wait And Refresh Until Status Changes
    [Arguments]    ${CalculationStatus}
    FOR    ${i}    IN RANGE    ${MaxRefreshAttempts}
        Click Element   ${Refresh}
        Sleep    ${RefreshInterval}
        ${status}=    SeleniumLibrary.Get Text    ${CalculationStatus}
        Run Keyword If    '${status}' == 'Calculated'    Exit For Loop
        log  ${status}
        Run Keyword If    '${status}' == 'Calc Failed'
        ...    Fail    Calculation Failed
    END

