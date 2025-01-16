#!/system/bin/sh


OUTPUT_DIR="/data/local/tmp/pm_log"
DATE=$(date +%Y%m%d_%H%M%S)

DEVICE=$(getprop ro.product.device)

mkdir -p $OUTPUT_DIR

packages=$(pm list packages -s | sed 's/package://')


for package in $packages; do

    OUTPUT_FILE="${OUTPUT_DIR}/${DATE}_${package}.txt"

    echo "Device: $DEVICE" > $OUTPUT_FILE
    echo "Date: $DATE" >> $OUTPUT_FILE
    echo "-----------------------------" >> $OUTPUT_FILE
    echo "------$package------" >> $OUTPUT_FILE

    # pm dump の内容を追加
    pm dump $package >> $OUTPUT_FILE
    echo "" >> $OUTPUT_FILE
done


echo "pm dump has been saved to $OUTPUT_DIR"

# /data/local/tmp/pm_log を /sdcard/pm_log
cp -r $OUTPUT_DIR /sdcard/

# /data/local/tmp/pm_log
rm -rf $OUTPUT_DIR


echo "全ての処理が終了/sdcard/pm_log/に保存されました"