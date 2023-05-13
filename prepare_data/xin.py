import requests
from bs4 import BeautifulSoup
import time
import pickle
# 定义爬取函数
def get_links(tag_name, attr_name, keyword):
    base_url = 'http://jib.xywy.com/il_sii_'
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36'
    }
    result = []  # 存储符合条件的网址
    for i in range(1, 11001):
        url = base_url + str(i) + '.htm'
        response = requests.get(url, headers=headers)
        if response.status_code != 200:
            print(f"请求失败，状态码为{response.status_code}，当前网址为{url}")
            continue
        soup = BeautifulSoup(response.text, 'html.parser')
        tags = soup.find_all(tag_name, class_=attr_name)
        for tag in tags:
            if keyword in tag.get_text():
                print(f"符合要求的网址：{url}")
                result.append(url)
                break
        time.sleep(1)
    print("所有符合要求的网址：")
    for link in result:
        print(link)
    # 将结果存储为二进制文件
    with open('links.pkl', 'wb') as f:
        pickle.dump(result, f)
    return result
# 调用函数
tag_name = 'div'
attr_name = 'wrap mt5'
keyword = '心脏病'
links = get_links(tag_name, attr_name, keyword)