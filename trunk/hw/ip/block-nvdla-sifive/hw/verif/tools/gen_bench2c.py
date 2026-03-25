import argparse
import re

def payload_to_int(payload):
    """将4字节payload转换为大端排列的整数。"""
    return int.from_bytes(payload, byteorder='big')

def preprocess_data(raw_data):
    """手动解析输入数据并转换为Python字典对象。"""
    data = []
    pattern = re.compile(r'\s*{\s*offset\s*:\s*0x([0-9a-fA-F]+)\s*,\s*size\s*:\s*4\s*,\s*payload\s*:\s*0x([0-9a-fA-F]+)\s*0x([0-9a-fA-F]+)\s*0x([0-9a-fA-F]+)\s*0x([0-9a-fA-F]+)\s*}\s*')
    matches = pattern.findall(raw_data)
    
    for match in matches:
        offset = int(match[0], 16)
        payload = [int(x, 16) for x in match[1:]]
        data.append({"offset": offset, "size": 4, "payload": payload})
    
    return data

def process_file(input_file, output_file, base_addr):
    # 读取输入文件并进行预处理
    with open(input_file, 'r') as f:
        raw_data = f.read()
    
    # 预处理输入数据
    data = preprocess_data(raw_data)

    # 生成C代码
    c_code = []
    current_offset = 0

    for entry in data:
        offset = entry['offset']
        
        # 处理跳过的地址
        while current_offset < offset:
            c_code.append(f"_REG32({hex(base_addr)}, {hex(current_offset)}) = 0x00000000;")
            current_offset += 4
        
        payload = entry['payload']
        temp_data = payload_to_int(payload)
        little_endian_data = int.from_bytes(temp_data.to_bytes(4, byteorder='big'), byteorder='little')
        c_code.append(f"_REG32({hex(base_addr)}, {hex(offset)}) = 0x{little_endian_data:08x};")
        
        current_offset = offset + 4

    # 写入输出文件
    with open(output_file, 'w') as f:
        for line in c_code:
            f.write(line + '\n')

def main():
    parser = argparse.ArgumentParser(description='处理包含数据的输入文件并生成对应的C代码。')
    parser.add_argument('input_file', type=str, help='包含数据的输入文件')
    parser.add_argument('output_file', type=str, help='生成C代码的输出文件')
    parser.add_argument('base_addr', type=lambda x: int(x, 0), help='基地址')
    
    args = parser.parse_args()
    
    process_file(args.input_file, args.output_file, args.base_addr)

if __name__ == "__main__":
    main()
