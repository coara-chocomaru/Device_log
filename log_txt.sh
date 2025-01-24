#!/system/bin/sh

LOG_DIR="/sdcard/command_logs"
mkdir -p "$LOG_DIR"

DATE=$(date +"%Y-%m-%d")
LOG_FILE="$LOG_DIR/${DATE}_commandLog.txt"

echo "Command Test Log - $DATE" > "$LOG_FILE"
echo "-------------------------------" >> "$LOG_FILE"

commands=(
    "cat /proc/cpuinfo"
    "ps"
    "getprop"
    "getenforce"
    "dumpsys"
    "cat /proc/binder/proc/*"
    "cat /proc/binder/stats"
    "cat /proc/last_kmsg"
    "cat /sys/class/net/wlan0/address"
    "cat /proc/meminfo"
    "cat /proc/iomem"
    "cat /sys/devices/system/cpu/possible"
    "cat /sys/devices/soc0/chip_name"
    "cat /sys/devices/soc0/family"
    "cat /sys/devices/soc0/vendor"
    "cat /proc/version"
    "cat /proc/stat"
    "ls /mnt"
    "ifconfig"
    "ip addr"
    "ip route"
    "netstat -an"
    "mount"
    "top -n 1"
    "cat /proc/devices"
    "cat /proc/filesystems"
    "cat /proc/interrupts"
    "cat /proc/ioports"
    "cat /proc/partitions"
    "cat /proc/zoneinfo"
    "cat /proc/diskstats"
    "dumpstate"
    "pm list packages"
    "pm list permissions"
    "pm list users"
    "pm list libraries"
    "pm list features"
    "pm list staged-sessions"
    "pm get-max-users"
    "pm get-max-running-users"

)

for cmd in "${commands[@]}"; do
    echo "----------- $cmd -----------" >> "$LOG_FILE"
    $cmd >> "$LOG_FILE" 2>&1
    echo "" >> "$LOG_FILE"  # コマンドごとに空行を追加
done

echo "Log saved to: $LOG_FILE"
