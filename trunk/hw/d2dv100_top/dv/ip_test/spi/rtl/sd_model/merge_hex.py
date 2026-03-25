import argparse



def reverse_bytes_and_group(input_file, output_file, group_size=8):
  """
  对输入文件中的十六进制数据进行字节内翻转和组内顺序翻转，并将结果写入输出文件。

  Args:
    input_file: 输入文件名
    output_file: 输出文件名
    group_size: 每组元素的数量
  """

  hex_list = []
  with open(input_file, 'r') as f:
    for line in f:
      hex_list.append(line.strip())

  reversed_list = []
  for i in range(0, len(hex_list), group_size):
    group = hex_list[i:i+group_size]
    # 字节内翻转
    # reversed_group = [group[i+1] + group[i] for i in range(0, len(group), 2)]
    # 组内顺序翻转
    # reversed_group.reverse()
    reversed_group = group[::-1]
    #print(reversed_group)
    reversed_list.append("".join(reversed_group))

  with open(output_file, 'w') as f:
    for item in reversed_list:
      print(item)
      f.write(item + '\n')
  


def main():
    parser = argparse.ArgumentParser(description='A program to reverse bytes and groups.')
    parser.add_argument('input_file', help='The input file')
    parser.add_argument('output_file', help='The output file')
    parser.add_argument('-g', '--group_size', type=int, default=8, help='The size of each group')

    args = parser.parse_args()

    # 示例用法
    reverse_bytes_and_group(args.input_file, args.output_file, args.group_size)

if __name__ == '__main__':
    main()
