import json
# 读取JSON文件并解析为Python对象
with open('medical9.json', 'r', encoding='utf-8') as f:
    data_list = json.load(f)
# 将字典存储到一个新的JSON文件中
with open('medical10.json', 'w', encoding='utf-8') as f:
    for dictionary in data_list:
        json.dump(dictionary, f, ensure_ascii=False)
        f.write('\n')