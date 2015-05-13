*** settings ***
Resource    Resources/delete_route.robot
Resource    Resources/get_event.robot
Resource    Resources/get_rib.robot

*** Variables ***
${DESTINATION}    172.16.0.0
${NETMASK}        255.255.255.0
${VRF_ROUTEDIST}  65010:101
${host}           BGP6
${port}           8086

*** TestCases ***
Delete Routing in BGP6
    ${route}=  Create Dictionary   destination=${DESTINATION}
               ...                 netmask=${NETMASK}
               ...                 vrf_routeDist=${VRF_ROUTEDIST}
    Delete Route  ${route}  ${host}  ${port}

Get Rib in BGP6
    Sleep  10 seconds
    Get Rib  ${host}  ${port}

Get Event in TestServer
    Sleep  20 seconds
    Get Event
