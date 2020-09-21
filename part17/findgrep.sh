#!/bin/bash

usage()
{
	# シェルスクリプトのファイル名を取得
	local script_name=$(basename "$0")

	# ピアドキュメントでヘルプを表示
	cat << END
	Usage: $script_name PATTERN [PATH] [NAME_PATTERN]
	find file in current directory, and print lines which match PATTERN.

		PATH		find file in PATH directory, instead of current directory.
		NAME_PATTERN	specify name pattern to find file

	Examples:
		$script_name return
		$script_name return ~ '*.txt'
END
# ↑ENDの前後にTAB,空白などは入れないこと
}

# コマンドライン引数が0個の場合
if [ "$#" -eq 0 ]; then
	usage
	# 終了ステータス1で終了
	exit 1
fi

# 検索文字
pattern=$1
# 検索ディレクトリ
directory=$2
# 検索ファイルパターン
name=$3

# 検索ディレクトリが存在しないならエラー
if [ ! -d "$directory" ]; then
	# エラーメッセージを標準エラー出力に出す(1>&2)
	echo "$0: ${directory}: No such directory" 1>&2
	exit 2
fi

# 第2引数(検索ディレクトリ)が空なら、
# デフォルト値"."(カレントディレクトリ)を設定
if [ -z "$directory" ]; then
	directory='.'
fi

# 第3引数(検索ファイルパターン)が空文字列なら、
# デフォルト値として'*'(なんでも)を設定
if [ -z "$name" ]; then
	name='*'
fi

find "$directory" -type f -name "$name" | xargs grep -nH "$pattern"
