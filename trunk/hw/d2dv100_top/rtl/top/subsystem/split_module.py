import argparse
import re
import os

def split_file(filename, file_list_path):
  current_module = None
  current_content = ""
  file_list = []
  with open(filename, "r") as f:
    for line in f:
      if line.startswith("module "):
        # Extract module name from the line
        match = re.match(r"module\s+([\w]+)", line)
        if match:
          module_name = match.group(1)
        else:
          raise ValueError("Invalid module declaration format")

        # Start of a new module
        if current_module:
          # Write content of previous module to file
          with open(f"{current_module}.v", "w") as f:
            f.write(current_content)
          file_list.append(f"{current_module}.v")
        current_module = module_name
        current_content = line  # Include the starting module line
      elif line.startswith("endmodule"):
        # End of current module
        current_content += line
        with open(f"{current_module}.v", "w") as f:
          f.write(current_content)
        file_list.append(f"{current_module}.v")
        current_module = None
      else:
        # Add line to current module content
        current_content += line

  # Write content of last module (if any)
  if current_module:
    with open(f"{current_module}.v", "w") as f:
      f.write(current_content)
    file_list.append(f"{current_module}.v")

  # Write file list to a separate file
  with open(file_list_path, "w") as f:
    for filename in file_list:
      f.write('`include "' + f"{filename}" + '"' + "\n")

if __name__ == "__main__":
  parser = argparse.ArgumentParser(description="Split Verilog file into modules")
  parser.add_argument("filename", help="Path to the Verilog file")
  parser.add_argument("--file-list", dest="file_list_path", help="Path to save the file list", default="file_list.scr")
  
  args = parser.parse_args()
  if args.file_list_path == "file_list.scr":
    args.file_list_path = os.path.basename(args.filename) + ".scr"

  split_file(args.filename, args.file_list_path)
