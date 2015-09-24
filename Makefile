include $(TOPDIR)/rules.mk

PKG_NAME:=dashuazi
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/dashuazi
  SECTION:=utils
  CATEGORY:=Multimedia
  DEPENDS:=
  TITLE:=dashuazi
  MAINTAINER:=jwz <jingpg93@gmail.com>
endef

define Package/dashuazi/description
 dashuazi
endef

define Package/dashuazi/conffiles
/etc/dashuazi.cfg
endef

define Package/dashuazi/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/dashuazi $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/zc_loopup.init $(1)/etc/init.d/zc_loopup
	$(INSTALL_DIR) $(1)/etc/
	$(INSTALL_DATA) ./files/dashuazi.cfg $(1)/etc/dashuazi.cfg
endef

$(eval $(call BuildPackage,dashuazi))
