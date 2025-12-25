#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify hostname
sed -i 's/OpenWrt/T6/g' package/base-files/files/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile

# Modify Luci Login Page
sed -i '24,26d' package/luci-theme-argon/luasrc/view/themes/argon/footer_login.htm

# Modify Luci Page
sed -i '23,33d' package/luci-theme-argon/luasrc/view/themes/argon/footer.htm

# Change ash to zsh
sed -i 's|/bin/ash|/bin/zsh|g' package/base-files/files/etc/passwd

# Change ttyd from services to system
sed -i 's|/services/|/system/|g' feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/luci-app-ttyd.json

# Change samba4 from services to nas
sed -i 's|/services/|/nas/|g' feeds/luci/applications/luci-app-samba4/root/usr/share/luci/menu.d/luci-app-samba4.json

