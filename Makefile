include $(TOPDIR)/rules.mk

PKG_NAME:=dashuazi
PKG_VERSION:=0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/dashuazi
    SECTION:=net
    CATEGORY:=Network
    TITLE:=dashuazi
    MAINTAINER:=jwz <jingpg93@gmail.com>
endef

define Build/Prepare
        mkdir -p $(PKG_BUILD_DIR)
        $(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/dashuazi/description
    dashuazi
endef

define Package/dashuazi/conffiles
/etc/dashuazi.cfg
endef

define Package/dashuazi/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dashuazi $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/zc_loopup.init $(1)/etc/init.d/zc_loopup
	$(INSTALL_DIR) $(1)/etc/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/dashuazi.cfg $(1)/etc/dashuazi.cfg
endef

$(eval $(call BuildPackage,dashuazi))
