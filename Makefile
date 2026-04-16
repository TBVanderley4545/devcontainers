CWD := $(shell pwd)

DEBIAN_DIR := ${CWD}/debian
DEBIAN_CONTAINER_NAME := debian_devcontainer-devcontainer
ARCH_DIR := ${CWD}/arch
ARCH_CONTAINER_NAME := arch_devcontainer-devcontainer

define base_build
	cd $(1) && devcontainer up --dotfiles-repository https://github.com/TBVanderley4545/devcontainer-dotfiles
endef

define base_use
	cd $(1) && devcontainer exec zsh
endef

define base_stop
	docker stop $(shell docker ps -aqf name=$(1))
endef

build-debian:
	$(call base_build,${DEBIAN_DIR})

build-arch:
	$(call base_build,${ARCH_DIR})

use-debian:
	$(call base_use,${DEBIAN_DIR})

use-arch:
	$(call base_use,${ARCH_DIR})

stop-debian:
	$(call base_stop,${DEBIAN_CONTAINER_NAME})

stop-arch:
	$(call base_stop,${ARCH_CONTAINER_NAME})

stop-all:
	$(call base_stop,${devcontainer})
