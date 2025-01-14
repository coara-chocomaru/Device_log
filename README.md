# Device_log
## 使い方
adb push log_txt.sh /data/local/tmp
adb shell chmod 777 /data/local/tmp/log_txt.sh
adb shell -c sh ./data/local/tmp/log_txt.sh
実行結果は/sdcard/command_logs/以下に日付で保存されます。
shellの権限の範囲でログを保存するだけです。

## カスタマイズ

- 必要に応じて、`commands` 配列に新しいコマンドを追加することができます。追加したい情報に応じて、適切なコマンドを追加してください。
