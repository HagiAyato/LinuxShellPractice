#!/bin/bash

# 日記データの保存ディレクトリ
directory="${HOME}/diary"

# 保存ディレクトリがなければ作成
if [ ! -d "$directory" ]; then
	mkdir "$directory"
fi

# 日記ファイルパス
diaryfile="${directory}/$(date '+%Y-%m-%d').txt"

# 今日の日記新規作成時、先頭に日付を挿入
if [ ! -e "$diaryfile" ]; then
	date '+%Y/%m/%d' > "$diaryfile"
fi

vim "$diaryfile"
