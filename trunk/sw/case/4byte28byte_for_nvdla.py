import re
import argparse

def convert_payload_format(input_file_path, output_file_path):
    """
    Reads payload data from an input file, processes it, and writes the
    converted format to an output file.

    Args:
        input_file_path (str): Path to the input text file.
        output_file_path (str): Path to the output text file.
    """

    try:
        with open(input_file_path, 'r') as infile:
            text = infile.read()
    except FileNotFoundError:
        print(f"Error: Input file not found at '{input_file_path}'")
        return

    lines = text.strip().split(',\n')
    processed_payloads = []

    for line in lines:
        payload_match = re.search(r"payload:(.*)}", line)
        if payload_match:
            payload_str = payload_match.group(1).strip()
            bytes_hex_str = payload_str.split()
            reversed_bytes_hex_str = bytes_hex_str[::-1] # Reverse byte order
            concatenated_hex_str = "".join([byte[2:] for byte in reversed_bytes_hex_str]) # Remove "0x" prefix and concatenate
            processed_payloads.append(concatenated_hex_str)

    output_lines = []
    for i in range(0, len(processed_payloads), 2):
        if i + 1 < len(processed_payloads):
            output_lines.append(processed_payloads[i+1] + processed_payloads[i] + '\n') # Add newline for file output
        else:
            output_lines.append(processed_payloads[i] + '\n') # Add newline for file output

    try:
        with open(output_file_path, 'w') as outfile:
            outfile.writelines(output_lines)
        print(f"Successfully converted data and wrote to '{output_file_path}'")
    except Exception as e:
        print(f"Error writing to output file '{output_file_path}': {e}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert payload format from file input to file output.")
    parser.add_argument("input_file", help="Path to the input text file")
    parser.add_argument("output_file", help="Path to the output text file")
    args = parser.parse_args()

    convert_payload_format(args.input_file, args.output_file)