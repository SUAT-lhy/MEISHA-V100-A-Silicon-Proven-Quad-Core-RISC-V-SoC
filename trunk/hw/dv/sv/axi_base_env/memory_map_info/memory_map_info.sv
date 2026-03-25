// *************************************************************************************************
// Vendor 		: 
// Author 		: ling
// Filename 	: memory_map_info 
// Date Created: 2022.05.01 
// Version		: V1.0
// -------------------------------------------------------------------------------------------------
// File description	:
// -------------------------------------------------------------------------------------------------
// Revision History :
// *************************************************************************************************

//--------------------------------------------------------------------------------------------------
// module declaration
//--------------------------------------------------------------------------------------------------

class memory_map_info extends uvm_object;

    //----------------------------------------------------------------------------------------------
    // Parameter Define
    //----------------------------------------------------------------------------------------------
    mst_port_info mst_port[string];
    slv_port_info slv_port[string];

    bit access_relation_ship[string][string][string];  // mst_port_name, slv_port_name, addr_info_segment

    `uvm_object_utils(memory_map_info)

    // Constructor: new
    extern function new(string name = "memory_map_info");

    // 返回slave口id
    extern function bit [top_pkg::MAX_ID_WIDTH-1:0] get_slv_id(string mst_port_name, bit [top_pkg::MAX_ID_WIDTH-1:0] mst_id, bit [top_pkg::MAX_ADDR_WIDTH-1:0] addr);

    extern function string get_slv_name(string mst_port_name, bit [top_pkg::MAX_ID_WIDTH-1:0] mst_id, bit [top_pkg::MAX_ADDR_WIDTH-1:0] addr);

    extern function string get_mst_port_name(string port_inst_path);

    extern function string get_slv_port_name(string port_inst_path);

endclass: memory_map_info

function memory_map_info::new(string name = "memory_map_info");
    // initialization mst_port_info
    mst_port["m0_axi_mst"] = mst_port_info::type_id::create("m0_axi_mst");
    mst_port["m0_axi_mst"].port_name = "m0_axi_mst";
    mst_port["m0_axi_mst"].port_type = "axi";
    mst_port["m0_axi_mst"].port_inst_path = "amba_axi_m2s3*m0_axi_mst";
    mst_port["m1_axi_mst"] = mst_port_info::type_id::create("m1_axi_mst");
    mst_port["m1_axi_mst"].port_name = "m1_axi_mst";
    mst_port["m1_axi_mst"].port_type = "axi";
    mst_port["m1_axi_mst"].port_inst_path = "amba_axi_m2s3*m1_axi_mst";

    slv_port["s0_axi_slv"] = slv_port_info::type_id::create("s0_axi_slv");
    slv_port["s0_axi_slv"].port_name = "s0_axi_slv";
    slv_port["s0_axi_slv"].port_type = "axi";
    slv_port["s0_axi_slv"].port_inst_path = "amba_axi_m2s3*s0_axi_slv";
    slv_port["s0_axi_slv"].acc_info = new("acc_info");
    slv_port["s0_axi_slv"].acc_info.start_addr["0"] = 'h0000_0000;
    slv_port["s0_axi_slv"].acc_info.end_addr["0"] = 'h3FFF_FFFF;
    slv_port["s0_axi_slv"].acc_info.segment_id["0"] = 0;


    slv_port["s1_axi_slv"] = slv_port_info::type_id::create("s1_axi_slv");
    slv_port["s1_axi_slv"].port_name = "s1_axi_slv";
    slv_port["s1_axi_slv"].port_type = "axi";
    slv_port["s1_axi_slv"].port_inst_path = "amba_axi_m2s3*s1_axi_slv";
    slv_port["s1_axi_slv"].acc_info = new("acc_info");
    slv_port["s1_axi_slv"].acc_info.start_addr["0"] = 'h4000_0000;
    slv_port["s1_axi_slv"].acc_info.end_addr["0"] = 'h7FFF_FFFF;
    slv_port["s1_axi_slv"].acc_info.segment_id["0"] = 0;

    slv_port["s2_axi_slv"] = slv_port_info::type_id::create("s2_axi_slv");
    slv_port["s2_axi_slv"].port_name = "s2_axi_slv";
    slv_port["s2_axi_slv"].port_type = "axi";
    slv_port["s2_axi_slv"].port_inst_path = "amba_axi_m2s3*s2_axi_slv";
    slv_port["s2_axi_slv"].acc_info = new("acc_info");
    slv_port["s2_axi_slv"].acc_info.start_addr["0"] = 'h8000_0000;
    slv_port["s2_axi_slv"].acc_info.end_addr["0"] = 'hBFFF_FFFF;
    slv_port["s2_axi_slv"].acc_info.segment_id["0"] = 0;

    
    slv_port["default_axi_slv"] = slv_port_info::type_id::create("default_axi_slv");
    slv_port["default_axi_slv"].port_name = "default_axi_slv";
    slv_port["default_axi_slv"].port_type = "axi";
    slv_port["default_axi_slv"].port_inst_path = "amba_axi_m2s3*default_axi_slv";
    slv_port["default_axi_slv"].acc_info = new("acc_info");
    slv_port["default_axi_slv"].acc_info.start_addr["0"] = 'hC000_0000;
    slv_port["default_axi_slv"].acc_info.end_addr["0"] = 'hFFFF_FFFF;
    slv_port["default_axi_slv"].acc_info.segment_id["0"] = 0;

    access_relation_ship["m0_axi_mst"]["s0_axi_slv"]["0"] = 1;
    access_relation_ship["m0_axi_mst"]["s1_axi_slv"]["0"] = 1;
    access_relation_ship["m0_axi_mst"]["s2_axi_slv"]["0"] = 1;
    access_relation_ship["m0_axi_mst"]["default_axi_slv"]["0"] = 1;

    access_relation_ship["m1_axi_mst"]["s0_axi_slv"]["0"] = 1;
    access_relation_ship["m1_axi_mst"]["s1_axi_slv"]["0"] = 1;
    access_relation_ship["m1_axi_mst"]["s2_axi_slv"]["0"] = 1;
    access_relation_ship["m1_axi_mst"]["default_axi_slv"]["0"] = 1;

endfunction: new


function bit [top_pkg::MAX_ID_WIDTH-1:0] memory_map_info::get_slv_id(string mst_port_name, bit [top_pkg::MAX_ID_WIDTH-1:0] mst_id, bit [top_pkg::MAX_ADDR_WIDTH-1:0] addr);
    if(uvm_is_match("*m0_axi_mst*", mst_port_name)) begin
        get_slv_id = {4'b0, mst_id[7:0]};
    end
    else if(uvm_is_match("*m1_axi_mst*", mst_port_name)) begin
        get_slv_id = {4'b1, mst_id[7:0]};
    end
    else begin
        $error("get_slv_id, input mst_port_name %s, mst_id %0h, the addr is %0h, cannot match any slv id", mst_port_name, mst_id, addr);
    end
    return get_slv_id;
endfunction

function string memory_map_info::get_slv_name(string mst_port_name, bit [top_pkg::MAX_ID_WIDTH-1:0] mst_id, bit [top_pkg::MAX_ADDR_WIDTH-1:0] addr);
    foreach(slv_port[i]) begin
        foreach(slv_port[i].acc_info.start_addr[j]) begin
            if((addr >= slv_port[i].acc_info.start_addr[j]) && (addr <= slv_port[i].acc_info.end_addr[j]))begin
                return i;
            end
        end
    end
    $error("get_slv_port_name, input mst_port_name %s, mst_id %0h, the addr is %0h, cannot match any slv id", mst_port_name, mst_id, addr);
    return "";
endfunction

function string memory_map_info::get_slv_port_name(string port_inst_path);
    foreach(slv_port[i]) begin
        if(uvm_is_match({"*", i, "*"}, port_inst_path)) begin
            return i;
        end
    end
    $error("get_slv_port_name, input port_inst_path %s", port_inst_path);
    return "";
endfunction

function string memory_map_info::get_mst_port_name(string port_inst_path);
    foreach(mst_port[i]) begin
        if(uvm_is_match({"*", i, "*"}, port_inst_path)) begin
            return i;
        end
    end
    $error("get_mst_port_name, input port_inst_path %s", port_inst_path);
    return "";
endfunction