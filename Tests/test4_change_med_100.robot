*** settings ***
Resource    Resources/change_med.robot
Resource    Resources/get_event.robot
Resource    Resources/get_rib.robot

*** Variables ***
${PEERIP}         192.168.101.102
${MED}            100
${myhost}         BGP4
${myport}         8084
${peerhost}       BGP1
${peerport}       8081

*** TestCases ***
Change Med(100) in BGP4
    ${neighbor}=  Create Dictionary   peerIp=${PEERIP}
                  ...                 med=${MED}
    Change Med  ${neighbor}  ${myhost}  ${myport}

Get Rib in BGP1
    Sleep  10 seconds
    Get Rib  ${peerhost}  ${peerport}

Get Event in TestServer
    Sleep  20 seconds
    Get Event
