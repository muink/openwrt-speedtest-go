include $(TOPDIR)/rules.mk

PKG_NAME:=speedtest-go
PKG_VERSION:=1.7.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/showwin/speedtest-go/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=1273ad19dc8ecc4ff40204c62c372bb90c81c73c1cf3a9b208bab7f1035dfa67

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0
PKG_BUILD_FLAGS:=no-mips16

GO_PKG:=github.com/showwin/speedtest-go

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/speedtest-go
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Test Internet Speed
  URL:=https://github.com/showwin/speedtest-go
  DEPENDS:=$(GO_ARCH_DEPENDS) +ca-bundle
endef

define Package/speedtest-go/description
  Command Line Interface and pure Go API to
  Test Internet Speed using speedtest.net
endef

$(eval $(call GoBinPackage,speedtest-go))
$(eval $(call BuildPackage,speedtest-go))
