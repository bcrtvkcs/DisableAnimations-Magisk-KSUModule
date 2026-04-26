#!/system/bin/sh
# Check Android version
if [ "$API" -lt 26 ]; then
    abort "Android 8.0 or higher required!"
fi
ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━"
ui_print "Disable Animations"
ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━"
ui_print ""
ui_print "- Device: $(getprop ro.product.model)"
ui_print "- Android: $(getprop ro.build.version.release)"
ui_print "- Module path: $MODPATH"
ui_print ""
# Check current animation scales
W=$(settings get global window_animation_scale 2>/dev/null)
T=$(settings get global transition_animation_scale 2>/dev/null)
A=$(settings get global animator_duration_scale 2>/dev/null)
ui_print "- Current window_animation_scale: ${W:-not set}"
ui_print "- Current transition_animation_scale: ${T:-not set}"
ui_print "- Current animator_duration_scale: ${A:-not set}"
ui_print ""
# Set permissions
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/service.sh 0 0 0755
ui_print "- Initialization completed!"
ui_print ""
# Update status
sed -i '/description/d' $MODPATH/module.prop
echo "description=Status: Installed ✅\\\\nDisables window, transition, and animator animations on boot." >> $MODPATH/module.prop