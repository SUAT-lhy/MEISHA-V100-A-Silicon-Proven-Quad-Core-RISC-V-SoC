def reformat_data(input_file, output_file, start_address=0, address_increment=4):
    with open(input_file, 'r') as f:
        lines = f.readlines()
    
    reformatted_data = []
    current_address = start_address
    
    for line in lines:
        line = line.strip()
        if len(line) == 16:  # 确保每行都是16位
            first_half = line[:8]
            second_half = line[8:]
            
            # 添加地址并直接连接数据，没有空格
            first_line = f"{current_address:08x}{first_half}"
            reformatted_data.append(first_line)
            current_address += address_increment
            
            second_line = f"{current_address:08x}{second_half}"
            reformatted_data.append(second_line)
            current_address += address_increment
    
    with open(output_file, 'w') as f:
        for item in reformatted_data:
            f.write(f"{item}\n")

# 使用示例
input_file = "/home/autumn/test_new_meisha/spi_slave/MEISHAV100/trunk/sw/case/hello_meisha.hex"
output_file = "ddr.hex"
start_address = 0x80000000  # 起始地址，例如 0x80000000
address_increment = 4       # 地址增量，例如 4 字节

reformat_data(input_file, output_file, start_address, address_increment)
print(f"数据已重新排列并保存到 {output_file}")