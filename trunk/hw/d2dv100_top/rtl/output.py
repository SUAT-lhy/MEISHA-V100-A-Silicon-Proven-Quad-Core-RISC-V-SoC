import os

# 定义根路径的占位符
root_placeholder = "${MEISHAV100_ROOT}"

# 定义实际路径以替换占位符
actual_root_path = "/home/autumn/test_new_meisha/spi_slave/MEISHAV100/trunk"  # 请替换为实际路径

# 输入文件路径
input_file = "meishav100_top.lst"

# 输出文件路径
output_file = "combined_output.sv"

# 打开输入文件并读取文件列表
with open(input_file, "r") as f:
    file_paths = f.readlines()

# 打开输出文件以写入所有文件的内容
with open(output_file, "w") as output:
    for file_path in file_paths:
        file_path = file_path.strip()
        
        # 检查文件路径是否为空
        if not file_path:
            continue

        if file_path.startswith("-f"):
            # 处理以 '-f' 开头的文件列表
            file_list_path = file_path[3:].replace(root_placeholder, actual_root_path)
            with open(file_list_path, "r") as file_list:
                for sub_file_path in file_list:
                    sub_file_path = sub_file_path.strip().replace(root_placeholder, actual_root_path)
                    
                    # 检查子文件路径是否为空
                    if not sub_file_path:
                        continue
                    
                    with open(sub_file_path, "r") as sub_file:
                        output.write(f"// Content from: {sub_file_path}\n")
                        output.write(sub_file.read())
                        output.write("\n\n")
        else:
            # 直接处理文件路径
            file_path = file_path.replace(root_placeholder, actual_root_path)
            with open(file_path, "r") as file:
                output.write(f"// Content from: {file_path}\n")
                output.write(file.read())
                output.write("\n\n")

print(f"所有文件的内容已写入 {output_file}")
