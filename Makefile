include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-button
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-button
SECTION:=luci
CATEGORY:=LuCI
TITLE:=Button Automation
DEPENDS:=+luci-base +rpcd
PKGARCH:=all
endef

define Package/luci-app-button/description
Physical button automation for OpenWrt.
endef

define Build/Compile
endef

define Package/luci-app-button/install
$(CP) ./etc $(1)/
$(CP) ./usr $(1)/
$(CP) ./www $(1)/
endef

$(eval $(call BuildPackage,luci-app-button))
