#!/system/bin/sh
MODDIR="/data/adb/modules/DisableAnimations"

update_status() {
    local status_text="$1"
    local status_emoji="$2"
    local new_description="description=Status: $status_text $status_emoji\\\\nDisables window, transition, and animator animations on boot."
    sed -i "s|^description=.*|$new_description|" "$MODDIR/module.prop"
    echo "DisableAnimations: $status_text" >> /dev/kmsg
}

update_status "Starting" "⏳"

echo "DisableAnimations: waiting for boot completion" >> /dev/kmsg
until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 1
done
echo "DisableAnimations: boot completed" >> /dev/kmsg

sleep 5

update_status "Setting animation scales" "⏳"

settings put global window_animation_scale 0.0
settings put global transition_animation_scale 0.0
settings put global animator_duration_scale 0.0

echo "DisableAnimations: animation scales set" >> /dev/kmsg

# Verify
W=$(settings get global window_animation_scale)
T=$(settings get global transition_animation_scale)
A=$(settings get global animator_duration_scale)

echo "DisableAnimations: window=$W transition=$T animator=$A" >> /dev/kmsg

if [ "$W" = "0.0" ] && [ "$T" = "0.0" ] && [ "$A" = "0.0" ]; then
    update_status "Success" "✅"
    echo "DisableAnimations: all scales confirmed 0.0" >> /dev/kmsg
else
    update_status "Failed" "❌"
    echo "DisableAnimations: one or more scales not set correctly" >> /dev/kmsg
fi

echo "DisableAnimations: script completed" >> /dev/kmsg