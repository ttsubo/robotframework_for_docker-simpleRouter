*** settings ***
Library     RequestsLibrary
Library     Collections

*** Keywords ***
Get Rib
    ${headers}=  Create Dictionary  Content-Type=application/json
    Create Session  bgp3  http://127.0.0.1:8083  ${headers}
    ${result} =  Get Request  bgp3  /openflow/0000000000000001/rib
    Log     ${result.status_code}
    Log     ${result.json()['rib']}
    Should Be Equal As Strings  ${result.status_code}  200
