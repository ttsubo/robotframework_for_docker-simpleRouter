*** settings ***
Library     Lib.conversions
Library     RequestsLibrary
Library     Collections


*** Keywords ***
Create Route
    [Arguments]  ${route}
    ${headers}=  Create Dictionary  Content-Type=application/json
    Create Session  bgp6  http://127.0.0.1:8086  ${headers}
    ${data}=  Create Dictionary   route=${route}
    ${data}=  Get Json From Dict  ${data}
    ${result} =  Post  bgp6  /openflow/0000000000000001/route  ${data}
    Log     ${result.status_code}
    Log     ${result.json()}
    Should Be Equal As Strings  ${result.status_code}  200
