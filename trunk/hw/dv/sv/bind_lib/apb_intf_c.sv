


interface class apb_intf_c extends base_intf_c;

    typedef enum { 
        PORT_TYPE = "apb"
    } port_type_e;

    // 返回 apb interface
    pure virtual function virtual apb_interface get_if(int port_index);

    // 返回 apb interface
    pure virtual function apb_port_info get_port_info(int port_index);

endclass