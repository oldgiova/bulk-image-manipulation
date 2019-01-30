#!/usr/bin/python3

import argparse, os

final_format = """       <div class="card">
         <img src="images/{}" alt="{}" title="{}">
         <p class="card-text">{}</p>
       </div>"""

def parse_file(file_list):
    with open(file_list) as f:
        content = f.readlines()
    content = [x.strip() for x in content]
    return content

def parse_dir(images_dir, file_type):
    images_list = []
    print(images_dir)
    for file in os.listdir(images_dir):
        lowerfile = file.lower()
        if lowerfile.endswith("." + file_type):
            images_list.append(file)
    return images_list

def join_rock(name_list,images_list,images_dir,file_type):
    print(len(name_list))
    print(len(images_list))
    if len(name_list) != len(images_list):
        print("check your list")
        return False
    for filename,imagename in zip(name_list, images_list):
        filename_mod = filename.lower()
        filename_mod = filename_mod.replace(' ', '_') + '.' + file_type
        os.rename(os.path.join(images_dir, imagename), os.path.join(images_dir, filename_mod))
        no_scarpa_antinfortunistica = filename.replace('Scarpa antinfortunistica ', '')
        print(final_format.format(filename_mod, filename, filename, no_scarpa_antinfortunistica))

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--file", type=str, help="file list")
    parser.add_argument("--dir", type=str, help="dir containing files")
    parser.add_argument("--type", type=str, help="jpg or png")

    args = parser.parse_args()

    file_list = args.file
    images_dir = args.dir
    file_type = args.type

    name_list = parse_file(file_list)
    print(name_list)
    print(type(name_list))

    images_list = parse_dir(images_dir, file_type)
    print(images_list)
    print(type(images_list))

    join_rock(name_list, images_list, images_dir,file_type)

if __name__ == '__main__':
    main()
