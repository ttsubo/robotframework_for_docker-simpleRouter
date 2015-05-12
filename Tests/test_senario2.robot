*** settings ***
Resource    Resources/get_event.robot

*** Variables ***
${EVENT_ID}    4

*** TestCases ***
Get Event in TestServer
    ${event_id}=  Create Dictionary   event_id=${EVENT_ID}
    Get Event  ${event_id}
