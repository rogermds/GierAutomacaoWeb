*** Settings ***
Library           String

*** Test Cases ***
For-Loop-In-Range
    @{reverse_list}=    Evaluate  list(range(6,2,-1))
    FOR    ${INDEX}    IN    @{reverse_list}
        Log To Console    ${INDEX}
    END