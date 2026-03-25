'''
Author: your name
Date: 2022-04-20 19:40:21
LastEditTime: 2022-05-01 11:16:30
LastEditors: your name
Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
FilePath: \opentitan\hw\ip\axi_xbar\util\axi_xbar.py
'''
#!/usr/bin/env python3
# Vendor 		: 
# Author 		: ling
# Filename 	:  
# Date Created: 2022.04.26 
# Version		: V1.0
# File description	:
# Revision History :
r"""Mako template to Hjson register description
"""
import sys
import argparse
from io import StringIO

from mako.template import Template


def main():
    parser = argparse.ArgumentParser(prog="reg_timer")
    parser.add_argument(
        'input',
        nargs='?',
        metavar='file',
        type=argparse.FileType('r'),
        default=sys.stdin,
        help='input template file')
    parser.add_argument('--harts', '-s', type=int, help='Number of Harts')
    parser.add_argument(
        '--timers',
        '-t',
        type=int,
        default=1,
        help='Number of Timers in a Hart. Maximum up to 32')

    args = parser.parse_args()

    if args.timers > 32:
        raise Exception("OOB TIMERS")
    # Determine output: if stdin then stdout if not then ??
    out = StringIO()

    reg_tpl = Template(args.input.read())
    out.write(reg_tpl.render(harts=args.harts, timers=args.timers))

    print(out.getvalue())

    out.close()


if __name__ == "__main__":
    main()
