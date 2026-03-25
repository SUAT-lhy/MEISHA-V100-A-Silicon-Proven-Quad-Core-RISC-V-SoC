# -*- coding: utf-8 -*-
import argparse

def parse_address(address_line):
    # Extract the address from a line starting with @
    return int(address_line[1:], 16)

def fill_missing_addresses_and_collect_data(lines):
    collected_hex = []
    prev_addr = None

    for line in lines:
        if line.startswith('@'):
            addr = parse_address(line)
            if prev_addr is not None:
                diff = addr - prev_addr
                if diff > 1:  # There's at least one byte missing
                    collected_hex.extend(['00'] * (diff - 1))
            prev_addr = addr
        else:
            cleaned_hex = ''.join(line.split()).upper()
            collected_hex.extend([cleaned_hex[i:i+2] for i in range(0, len(cleaned_hex), 2)])

    return collected_hex

def reverse_within_8byte_chunks(hex_data):
    reversed_chunks = []

    for i in range(0, len(hex_data), 8):
        chunk = hex_data[i:i+8]
        # Reverse the bytes within this 8-byte chunk
        reversed_chunk = chunk[::-1]
        reversed_chunks.append(''.join(reversed_chunk))

    return reversed_chunks

def reformat_hex_data_from_file(input_filename, output_filename):
    try:
        with open(input_filename, 'r', encoding='utf-8') as infile:
            lines = infile.readlines()

        # Collect and process hex data while filling gaps
        collected_hex = fill_missing_addresses_and_collect_data(lines)

        # Reverse the order of bytes within each 8-byte chunk
        reversed_chunks = reverse_within_8byte_chunks(collected_hex)

        # Write the reformatted data to the output file
        with open(output_filename, 'w', encoding='utf-8') as outfile:
            for chunk in reversed_chunks:
                outfile.write(chunk + '\n')

        print("Hex data successfully reformatted from {} to {}".format(input_filename, output_filename))

    except FileNotFoundError:
        print("Error: The file {} does not exist.".format(input_filename))
    except Exception as e:
        print("An error occurred: {}".format(e))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Reformat hex data by filling gaps, reversing byte order within 8-byte chunks, removing spaces, and omitting @ lines.')
    parser.add_argument('input_file', help='Path to the input hex file')
    parser.add_argument('output_file', help='Path to save the reformatted hex data')

    args = parser.parse_args()

    reformat_hex_data_from_file(args.input_file, args.output_file)