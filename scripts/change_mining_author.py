import sys
import random
import string

def generate_random_hex_string(length):
    hex_chars = string.hexdigits[:-1]  # 0-9 a-f
    random_hex = ''.join(random.choice(hex_chars) for _ in range(length))
    return random_hex

def change_mining_author(tmp_dir):
    with open(tmp_dir + "conflux.conf", 'r') as file:
        lines = file.readlines()
    with open(tmp_dir + "conflux.conf", 'w') as file:
        for line in lines:
            if line.startswith("mining_author"):
                random_hex_string = generate_random_hex_string(40)
                line = f"mining_author='" + random_hex_string + "'\n"
            file.write(line)
                 
    
if __name__ == "__main__":
    tmp_dir = sys.argv[0]
    change_mining_author(tmp_dir)