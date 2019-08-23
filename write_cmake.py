import glob, os

def write(path, f_writer):
    for file in os.listdir(path):
        print(file)
        if os.path.isdir(os.path.join(path, file)):
            print("here")
            write(os.path.join(path, file), f_writer)
        elif file.endswith("so"):
            file = file.replace("lib", "")
            f_writer.write(file+"\n")

f = open("/home/sayem/cmake.txt", "a")
write("/home/sayem/code/huawei_libs", f)
f.close()