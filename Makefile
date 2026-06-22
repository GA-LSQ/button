include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-button
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-button
SECTION:=luci
CATEGORY:=LuCI
SUBMENU:=3. Applications
TITLE:=Button Automation
DEPENDS:=+luci-base +rpcd
PKGARCH:=all
endef

define Package/luci-app-button/description
Button automation for OpenWrt.
endef

define Build/Compile
endef

define Package/luci-app-button/install
$(INSTALL_DIR) $(1)/etc/config
$(INSTALL_CONF) ./etc/config/button $(1)/etc/config/

```
$(INSTALL_DIR) $(1)/etc/hotplug.d/button
$(INSTALL_BIN) ./etc/hotplug.d/button/99-button \
	$(1)/etc/hotplug.d/button/

$(INSTALL_DIR) $(1)/usr/bin
$(INSTALL_BIN) ./usr/bin/button-runner \
	$(1)/usr/bin/

$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
$(INSTALL_DATA) ./usr/share/luci/menu.d/luci-app-button.json \
	$(1)/usr/share/luci/menu.d/

$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
$(INSTALL_DATA) ./usr/share/rpcd/acl.d/luci-app-button.json \
	$(1)/usr/share/rpcd/acl.d/

$(INSTALL_DIR) $(1)/www/luci-static/resources/view/system
$(INSTALL_DATA) \
	./www/luci-static/resources/view/system/button.js \
	$(1)/www/luci-static/resources/view/system/
```

endef

$(eval $(call BuildPackage,luci-app-button))
