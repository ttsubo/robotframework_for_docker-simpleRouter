*** settings ***
Resource    Resources/create_route.robot
Resource    Resources/get_event.robot
Resource    Resources/get_rib.robot

*** Variables ***
${DESTINATION}    172.16.0.0
${NETMASK}        255.255.255.0
${NEXTHOP}        192.168.2.101
${VRF_ROUTEDIST}  65010:101
${host}           BGP6
${port}           8086

*** TestCases ***
Create Routing in BGP6
    ${route}=  Create Dictionary   destination=${DESTINATION}
               ...                 netmask=${NETMASK}
               ...                 nexthop=${NEXTHOP}
               ...                 vrf_routeDist=${VRF_ROUTEDIST}
    Create Route  ${route}  ${host}  ${port}

Get Rib in BGP6
    Sleep  10 seconds
    Get Rib  ${host}  ${port}

Get Event in TestServer
    Sleep  20 seconds
    Get Event
