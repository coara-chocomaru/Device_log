Device_log

## 使い方

1. 以下のコマンドでスクリプトをデバイスに転送します:
   adb push log_txt.sh /data/local/tmp

2. 転送したスクリプトに実行権限を付与します:
   adb shell chmod 777 /data/local/tmp/log_txt.sh

3. スクリプトを実行します:
   adb shell -c sh /data/local/tmp/log_txt.sh

実行結果は、/sdcard/command_logs/ フォルダに日付ごとに保存されます。  
ログはシェルの権限内でのみ保存されます。

## カスタマイズ

- 必要に応じて、commands 配列に新しいコマンドを追加できます。  
  追加したい情報に応じて、適切なコマンドを追加してください。
