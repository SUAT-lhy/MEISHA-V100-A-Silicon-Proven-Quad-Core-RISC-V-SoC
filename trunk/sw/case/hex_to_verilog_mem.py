# -*- coding: utf-8 -*-

import argparse

def hex_to_verilog_mem(input_file, output_file, start_address, end_address):
    # 打开输入文件和输出文件
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        # 初始化当前地址
        current_address = start_address
        # 遍历输入文件的每一行
        for line in infile:
            # 如果行以 @ 开头，表示地址
            if line.startswith('@'):
                # 提取地址并转换为整数
                address = int(line[1:], 16)
                # 如果当前地址小于目标地址，补零
                while current_address < address:
                    outfile.write("{0:016x}\n".format(0))  # 写入 16 个小写字符（8 字节）
                    current_address += 8  # 每次增加 8 字节（64 位）
            else:
                # 将数据行按空格分割，去除空字符串
                data = [x for x in line.strip().split(' ') if x]
                # 将数据按 8 字节一组转换为 64 位十六进制值
                for i in range(0, len(data), 8):
                    # 将 8 个字节拼接为一个 64 位值
                    word = ''.join(data[i:i+8][::-1])  # 小端序
                    outfile.write("{0}\n".format(word.lower()))  # 写入 16 个小写字符（8 字节）
                    current_address += 8  # 每次增加 8 字节（64 位）
        # 如果当前地址小于结束地址，补零
        while current_address < end_address:
            outfile.write("{0:016x}\n".format(0))  # 写入 16 个小写字符（8 字节）
            current_address += 8  # 每次增加 8 字节（64 位）

def main():
    # 创建命令行参数解析器
    parser = argparse.ArgumentParser(description="Convert HEX file to Verilog $readmemh format.")
    parser.add_argument("input_file", help="Path to the input HEX file.")
    parser.add_argument("output_file", help="Path to the output HEX file.")
    parser.add_argument("--start_address", type=lambda x: int(x, 0), default=0x80000000, help="Start address (default: 0x80000000).")
    parser.add_argument("--end_address", type=lambda x: int(x, 0), default=0x80008000, help="End address (default: 0x80008000).")
    
    # 解析命令行参数
    args = parser.parse_args()
    
    # 调用转换函数
    hex_to_verilog_mem(args.input_file, args.output_file, args.start_address, args.end_address)

if __name__ == "__main__":
    main()