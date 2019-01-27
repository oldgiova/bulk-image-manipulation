#!/usr/bin/python3

import argparse, os

def parse_file(file_list):
    with open(file_list) as f:
        content = f.readlines()
    content = [x.strip() for x in content]
    return content

def parse_dir(images_dir):
    images_list = []
    print(images_dir)
    for file in os.listdir(images_dir):
        if file.endswith(".png"):
            images_list.append(file)
    return images_list

def join_rock(name_list,images_list):
    if len(name_list) != len(images_list):
        print("check your list")
        return False
    for filename,imagename in zip(name_list, images_list):
        print("renaming ", imagename, " in ", filename)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--file", type=str, help="file list")
    parser.add_argument("--dir", type=str, help="dir containing files")

    args = parser.parse_args()

    file_list = args.file
    images_dir = args.dir

    name_list = parse_file(file_list)
    print(name_list)
    print(type(name_list))

    images_list = parse_dir(images_dir)
    print(images_list)
    print(type(images_list))

    join_rock(name_list, images_list)

if __name__ == '__main__':
    main()
