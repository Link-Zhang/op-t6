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

# Modify default theme
sed -i 's|luci-theme-bootstrap|luci-theme-argon|g' feeds/luci/collections/luci-light/Makefile

# Modify smb
sed -i 's|445|25445|g' feeds/packages/net/samba4/files/samba.init
sed -i 's|invalid users = root|#invalid users = root|g' feeds/packages/net/samba4/files/smb.conf.template
sed -i 's|null passwords = yes|#null passwords = yes|g' feeds/packages/net/samba4/files/smb.conf.template
sed -i 's|#dns proxy = No|dns proxy = No|g' feeds/packages/net/samba4/files/smb.conf.template



# Modify hostname
sed -i 's|OpenWrt|NanoPC-T6|g' package/base-files/files/bin/config_generate

# Change ash to bash
sed -i 's|/bin/ash|/bin/bash|g' package/base-files/files/etc/passwd

# Set Default root password
sed -i 's|root:::0:99999:7:::|root:$1$CVCXbKh9$r5w6F.rsYfy3Uszzi7TuD0:8195:0:99999:7:::|g' package/base-files/files/etc/shadow

# Modify Luci Page
sed -i '23,33d' package/luci-theme-argon/luasrc/view/themes/argon/footer.htm

# Modify Luci Login Page
sed -i '24,26d' package/luci-theme-argon/luasrc/view/themes/argon/footer_login.htm



# Add luci-app-turboacc
curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh --no-sfe
