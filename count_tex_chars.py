import os
import re

# 统计单个tex文件中的中英文字符数量
# 模板中的字符总计: 中文字符=4684, 英文字符=2336
def count_chars_in_tex(file_path):
    chinese_count = 0
    english_count = 0
    with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
        for line in f:
            # 去除注释
            line = re.sub(r'%.*', '', line)
            # 去除LaTeX命令
            line = re.sub(r'\\[a-zA-Z]+(\[[^\]]*\])?(\{[^\}]*\})?', '', line)
            # 统计中文字符
            chinese_count += len(re.findall(r'[\u4e00-\u9fff]', line))
            # 统计英文字符（只统计字母，不含数字和符号）
            english_count += len(re.findall(r'[A-Za-z]', line))
    return chinese_count, english_count

# 遍历目录，统计所有tex文件
def count_chars_in_repo(root_dir):
    total_chinese = 0
    total_english = 0
    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename.endswith('.tex'):
                file_path = os.path.join(dirpath, filename)
                chinese, english = count_chars_in_tex(file_path)
                print(f"{file_path}: 中文字符={chinese}, 英文字符={english}")
                total_chinese += chinese
                total_english += english
    print(f"\n总计: 中文字符={total_chinese}, 英文字符={total_english}")

if __name__ == "__main__":
    count_chars_in_repo(os.path.dirname(os.path.abspath(__file__)))



