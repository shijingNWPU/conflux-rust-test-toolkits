def calculate_average(file_path):
    total_sum = 0
    count = 0

    with open(file_path, 'r') as file:
        for line in file:
            if '【performance】sign:' in line:
                value = int(line.split('【performance】sign:')[1])
                total_sum += value
                count += 1
                print("value:", value, " count:", count)

    if count > 0:
        average = total_sum / count
        return average
    else:
        return None

# 用法示例
file_path = 'file.txt'
average_value = calculate_average(file_path)
if average_value is not None:
    print("平均值：", average_value)
else:
    print("文件中没有找到符合条件的值")