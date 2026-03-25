
interface class base_intf_c;

    // current ip port name
    pure virtual function string get_port_name(string port_type, int port_index);

    // current ip port num
    pure virtual function int get_port_num(string port_type);

    pure virtual function void set_vif_work_mode(bit switch, bit [3:0] work_mode, string port_name);

    pure virtual function void drive_vip();


endclass


