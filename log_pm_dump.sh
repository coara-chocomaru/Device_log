#!/system/bin/sh

OUTPUT_DIR="/sdcard"
DATE=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="${OUTPUT_DIR}/${DATE}.txt"

echo "Package Dump - $DATE" > $OUTPUT_FILE
echo "-----------------------------" >> $OUTPUT_FILE

packages=$(pm list packages -s | sed 's/package://')

for package in $packages; do
    echo "------$package------" >> $OUTPUT_FILE
    
    pm dump $package >> $OUTPUT_FILE
    echo "" >> $OUTPUT_FILE
done

echo "pm dump has been saved to $OUTPUT_FILE"
