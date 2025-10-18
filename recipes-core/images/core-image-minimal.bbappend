inherit extrausers
YOCTO_PASSWORD ?= '\$6\$0bgKQIZ5l/6.soU5\$OyKkjViYKHq2V8gcwdfh0JRWMeNcdz8KcE8zXJXkAPL/MiMOwjqB4qcdL.3O3loIm/QbmoEwmW3LPqpEzHDNS.'
YOCTO_USER ?= "yocto"

EXTRA_USERS_PARAMS = "useradd -p '${YOCTO_PASSWORD}' -G users,sudo ${YOCTO_USER}"

IMAGE_INSTALL:append = "sudo dtc"

ROOTFS_POSTPROCESS_COMMAND += "enable_sudo_group; add_sudoers_file;"

enable_sudo_group() {
    sed -i 's/^# *%sudo/%sudo/' ${IMAGE_ROOTFS}/etc/sudoers || true
}

add_sudoers_file() {
    mkdir -p ${IMAGE_ROOTFS}/etc/sudoers.d
    echo '${YOCTO_USER} ALL=(ALL) ALL' > ${IMAGE_ROOTFS}/etc/sudoers.d/${YOCTO_USER}
    chmod 440 ${IMAGE_ROOTFS}/etc/sudoers.d/${YOCTO_USER}
}