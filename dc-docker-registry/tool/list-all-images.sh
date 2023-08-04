source global.bashrc
source common/docker-registry.sh

get_all_images $REGISTRY_URL $REGISTRY_API_VERSION $USERNAME $PASSWORD
