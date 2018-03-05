# Add user group.
addgroup --gid "$DOCKER_GRP_ID" "$DOCKER_GRP"
# Add a no password user.
adduser --disabled-password --gecos '' "$DOCKER_USER" \
      --uid "$DOCKER_USER_ID" --gid "$DOCKER_GRP_ID" 2>/dev/null
# Add user to sudo.
usermod -aG sudo "$DOCKER_USER"
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
cp -r /etc/skel/. /home/${DOCKER_USER}
chsh -s /usr/bin/zsh $DOCKER_USER

chown -R ${DOCKER_USER}:${DOCKER_GRP} "/home/${DOCKER_USER}"
