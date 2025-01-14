#!/system/bin/sh

# 出力ファイルの設定
OUTPUT_DIR="/sdcard"
DATE=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="${OUTPUT_DIR}/${DATE}.txt"

# ファイルにヘッダーを追加
echo "Package Dump - $DATE" > $OUTPUT_FILE
echo "-----------------------------" >> $OUTPUT_FILE

# 全パッケージリストを取得
packages=$(pm list packages -s | sed 's/package://')

# 各パッケージに対してpm dumpを実行
for package in $packages; do
    echo "------$package------" >> $OUTPUT_FILE
    # pm dumpコマンドでパッケージの詳細を取得
    pm dump $package >> $OUTPUT_FILE
    echo "" >> $OUTPUT_FILE
done

# 完了メッセージ
echo "Package dump has been saved to $OUTPUT_FILE"