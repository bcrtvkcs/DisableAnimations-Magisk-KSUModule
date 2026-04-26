#!/system/bin/sh
# Restore default animation scales
settings put global window_animation_scale 1.0
settings put global transition_animation_scale 1.0
settings put global animator_duration_scale 1.0
echo "DisableAnimations: module uninstalled, animation scales restored to 1.0" >> /dev/kmsg