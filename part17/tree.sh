#!/bin/bash

list_recursive()
{
	# 現在参照中のファイルパス
	local filepath=$1
	# インデント
	local indent=$2

	# ファイルでもディレクトリでもその名前を表示
	# ※パス名は'##*/'で消す
	echo "${indent}${filepath##*/}"

	if [ -d "$filepath" ]; then
		# ディレクトリなら、その中のファイルや
		# ディレクトリを一覧表示
		# ディレクトリの場合
		if [ -d "$filepath" ]; then
			local fname
			for fname in $(ls "$filepath")
			do
				# ディレクトリ内ファイルを表示
				# echo "${filepath}/${fname}"	
				list_recursive "${filepath}/${fname}" $'\t'"$indent"
			done
		fi
	fi
}

# メイン処理
# IFSを待避
_IFS=$IFS
IFS=$'\n'
list_recursive "$1" ""
IFS=$_IFS
