*** settings ***
Resource    Resources/create_route.robot
Resource    Resources/get_rib.robot

*** Variables ***
${DESTINATION}    172.16.0.0
${NETMASK}        255.255.255.0
${NEXTHOP}        192.168.2.101
${VRF_ROUTEDIST}  65010:101

*** TestCases ***
Create Routing in BGP6
    ${route}=  Create Dictionary   destination=${DESTINATION}
               ...                 netmask=${NETMASK}
               ...                 nexthop=${NEXTHOP}
               ...                 vrf_routeDist=${VRF_ROUTEDIST}
    Create Route  ${route}
