# Disable Animations Magisk & KSU Module

A Magisk / KernelSU module that automatically sets all animation scales to `0.0` on every boot to reduce micro-stutter in some games on such gpu-layered systems like WSA.

> ### ⚠️ DISCLAIMER ⚠️
> **I am not responsible** for *bricked devices*, *dead SD cards*, *thermonuclear war*, or *you getting fired because the alarm app failed*. Please do some research if you have any concerns about features included in this module before flashing it. YOU are choosing to make these modifications, and if you point the finger at me for messing up your device, I will laugh at you!

## What Does It Do?

Sometimes Android resets animation scales to their defaults on every restart. This module sets the following global settings to `0.0` automatically after each boot:

- `window_animation_scale`
- `transition_animation_scale`
- `animator_duration_scale`

Disabling these animations reduces rendering overhead in software graphics translation layer, which can help reduce periodic frame time spikes in games.

## How It Works

1. Waits for the device to fully boot.
2. Sets all three animation scales to `0.0` via the `settings` command.
3. Verifies the changes and reports the result in the module description.

## Installation

1. [Download the latest release](https://github.com/bcrtvkcs/DisableAnimations-Magisk-KSUModule/releases/latest/download/DisableAnimations.zip).
2. Flash it via **Magisk**, **KernelSU**, or **KernelSU Next**.
3. Reboot.
4. Verify via: `adb shell settings get global window_animation_scale` should return `0.0`.
5. You're all set!
6. If you experience any issues, please open one through the [Issues](https://github.com/bcrtvkcs/DisableAnimations-Magisk-KSUModule/issues) panel.

## Uninstallation

Uninstalling the module via Magisk/KSU Manager and rebooting will automatically restore all animation scales to `1.0`.

## Compatibility

- Android 8.0+
- Magisk or KernelSU or KernelSU Next
