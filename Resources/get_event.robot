*** settings ***
Library     Lib.conversions
Library     RequestsLibrary
Library     Collections

*** Keywords ***
Get Event
    [Arguments]  ${event_id}
    ${headers}=  Create Dictionary  Content-Type=application/json
    Create Session  TestServer  http://127.0.0.1:10080  ${headers}
    ${data}=  Create Dictionary   event=${event_id}
    ${params}=  Get Json From Dict  ${data}
    ${result} =  Post  TestServer  /apgw/event  ${params}
    Log     ${result.status_code}
    Log     ${result.json()['event']['event_id']}
    Log     ${result.json()['event']['event_time']}
    Log     ${result.json()['event']['event_type']}
    Log     ${result.json()['event']['peer_bgp_id']}
    Log     ${result.json()['event']['peer_as']}
    Log     ${result.json()['event']['received_time']}
    Log     ${result.json()['event']['vpnv4_prefix']}
    Log     ${result.json()['event']['nexthop']}
    Log     ${result.json()['event']['ping_result']}
    Log     ${result.json()['event']['ping_recv']}
    Log     ${result.json()['event']['show_neighbor_result']}
    Log     ${result.json()['event']['show_rib_result']}
    Should Be Equal As Strings  ${result.status_code}  200
