import os
import random

# 定义输出文件路径
output_file = "./spi_stim.txt"

# 创建slm_files目录，如果不存在
os.makedirs(os.path.dirname(output_file), exist_ok=True)

# 定义起始地址和地址增量
start_address = 0x80000000
address_increment = 4

# 定义stimuli数量
num_stimuli = 200

# 生成stimuli向量并写入文件
with open(output_file, "w") as f:
    for i in range(num_stimuli):
        address = start_address + i * address_increment
        data = random.randint(0, 0xFFFFFFFF)  # 生成随机数据
        # 将地址和数据拼接成一个64位的数值，并转换为16进制字符串
        stimuli_vector = (address << 32) | data
        f.write(f"{stimuli_vector:016x}\n")

print(f"{output_file} 文件生成完毕。")
