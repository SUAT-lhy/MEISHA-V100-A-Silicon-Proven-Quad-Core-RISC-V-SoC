

interface class tl_intf_c extends base_intf_c;

    typedef enum { 
        PORT_TYPE = "tl"
    } port_type_e;

    // 返回 tl interface
    pure virtual function virtual tl_if get_if(int port_index);

    // 返回 tl port_info
    pure virtual function tl_port_info get_port_info(int port_index);


endclass
