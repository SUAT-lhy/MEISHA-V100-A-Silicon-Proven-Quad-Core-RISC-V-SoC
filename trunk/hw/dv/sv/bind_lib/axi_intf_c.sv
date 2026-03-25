

interface class axi_intf_c extends base_intf_c;

    typedef enum { 
        PORT_TYPE = "axi"
    } port_type_e;

    // 返回 axi interface
    pure virtual function virtual axi_interface get_if(int port_index);

    // 返回 axi port_info
    pure virtual function axi_port_info get_port_info(int port_index);

    //pure virtual function void set_axi_vif_work_mode(bit switch, bit mst_slv, bit is_monitor, string port_name);

endclass
