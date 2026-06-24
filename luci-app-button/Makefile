
include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-button
PKG_VERSION:=1.0.0
PKG_RELEASE:=1
PKG_MAINTAINER:=OpenWrt Community
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-button
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI support for Button Automation
  DEPENDS:=+luci-base
  PKGARCH:=all
endef

define Package/luci-app-button/description
  LuCI support for Button Automation - Physical button control for routers.
  Supports WiFi toggle, LED control, custom commands, and multiple LED triggers.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-button/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/etc/config/button_automation $(1)/etc/config/button_automation
	$(INSTALL_DIR) $(1)/etc/hotplug.d/button
	$(INSTALL_BIN) ./files/etc/hotplug.d/button/99-button $(1)/etc/hotplug.d/button/99-button
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/usr/bin/button-runner $(1)/usr/bin/button-runner
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) ./files/usr/share/luci/menu.d/luci-app-button.json $(1)/usr/share/luci/menu.d/luci-app-button.json
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) ./files/usr/share/rpcd/acl.d/luci-app-button.json $(1)/usr/share/rpcd/acl.d/luci-app-button.json
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/system
	$(INSTALL_DATA) ./files/www/luci-static/resources/view/system/button.js $(1)/www/luci-static/resources/view/system/button.js
endef

$(eval $(call BuildPackage,luci-app-button))
