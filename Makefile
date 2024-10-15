include $(TOPDIR)/rules.mk

PKG_NAME:=url-block-test
PKG_VERSION:=1.0.0
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0-or-later

ifeq ("$(wildcard ../url-block-test)", "")
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/karen07/url-block-test.git
PKG_SOURCE_VERSION:=18f285feac5ac4d6bd036209a9c07a76ff977e0f
endif

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/url-block-test
	SECTION:=net
	CATEGORY:=Network
	DEPENDS:=
	TITLE:=Quick check if URLs is blocked
	URL:=https://github.com/karen07/url-block-test
endef

define Package/url-block-test/description
	Quick check if URLs is blocked
endef

ifneq ("$(wildcard ../url-block-test)", "")
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ../url-block-test/* $(PKG_BUILD_DIR)/
endef
endif

define Package/url-block-test/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/url-block-test $(1)/usr/bin/
endef

$(eval $(call BuildPackage,url-block-test))
