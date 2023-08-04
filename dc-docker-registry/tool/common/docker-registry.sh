#!/bin/bash

# 获取所有镜像
function get_all_images() {
    REGISTRY_URL="$1"
    REGISTRY_API_VERSION="$2"
    USERNAME="$3"
    PASSWORD="$4"

    # Get list of all images
    response=$(curl -s -u $USERNAME:$PASSWORD $REGISTRY_URL/$REGISTRY_API_VERSION/_catalog)
    images=$(echo $response | jq -r '.repositories[]')

    # Check if images list is empty
    if [ "${#images[@]}" -eq 0 ]; then
        echo "No images found in the registry"
        return 1
    fi

    for image in $images; do
        response=$(curl -s -u $USERNAME:$PASSWORD $REGISTRY_URL/$REGISTRY_API_VERSION/$image/tags/list)
        if ! echo "$response" | jq '. | has("tags")' | grep -q "true"; then
            continue
        fi
        tags=$(echo $response | jq -r '.tags[]')
        for tag in $tags; do
            manifest_response=$(curl -s -I -u $USERNAME:$PASSWORD $REGISTRY_URL/$REGISTRY_API_VERSION/$image/manifests/$tag)
            if echo "$manifest_response" | grep -q "Docker-Content-Digest"; then
                echo "$REGISTRY_URL/$image:$tag (镜像被标记为删除，等待垃圾回收)"
            elif echo "$manifest_response" | grep -q "404 Not Found"; then
                continue
            else
                echo "$REGISTRY_URL/$image:$tag"
            fi
        done
    done
}

delete_all_images() {
    REGISTRY_URL=$1
    REGISTRY_API_VERSION=$2
    USERNAME=$3
    PASSWORD=$4

    # 查询仓库里的镜像列表
    images=$(curl -s -u $USERNAME:$PASSWORD $REGISTRY_URL/$REGISTRY_API_VERSION/_catalog | jq -r '.["repositories"][]')

    # 遍历镜像列表
    for image in $images; do
        # 获得镜像的tag列表
        tags=$(curl -s -u $USERNAME:$PASSWORD $REGISTRY_URL/$REGISTRY_API_VERSION/$image/tags/list | jq -r '.["tags"][]')

        # 遍历tag列表
        for tag in $tags; do
            # 获取镜像的digest
            manifest_response=$(curl -s -I -u $USERNAME:$PASSWORD $REGISTRY_URL/$REGISTRY_API_VERSION/$image/manifests/$tag)
            if echo "$manifest_response" | grep -q "404 Not Found"; then
                echo "镜像 $image:$tag 的 digest 已经被标记删除等待垃圾回收"
            else
                # 删除镜像
                digest=$(echo "$manifest_response" | grep "Docker-Content-Digest" | awk '{print $2}')
                curl -s -u $USERNAME:$PASSWORD -X DELETE $REGISTRY_URL/$REGISTRY_API_VERSION/$image/manifests/$digest
                echo "镜像 $image:$tag 的 digest 已经被标记删除等待垃圾回收"
            fi
        done
    done
    docker exec registry bin/registry garbage-collect /etc/docker/registry/config.yml
    echo "镜像删除完毕，请耐心等待垃圾回收"

}

# delete_all_images() {
#     REGISTRY_URL=$1
#     REGISTRY_API_VERSION=$2
#     USERNAME=$3
#     PASSWORD=$4

#     # Get a list of all images in the registry
#     IMAGES=$(curl -s -u $USERNAME:$PASSWORD -X GET "$REGISTRY_URL/v2/_catalog" | jq -r '.repositories[]')
#     echo "IMAGES:$IMAGES"

#     # Loop through images
#     for IMAGE in $IMAGES
#     do
#         # Get list of tags for current image
#         TAGS=$(curl -s -u $USERNAME:$PASSWORD $REGISTRY_URL/$REGISTRY_API_VERSION/$IMAGE/tags/list | jq -r '.tags[]')

#         # Loop through tags
#         for TAG in $TAGS
#         do
#             # Get digest for current image and tag
#             DIGEST=$(curl -s -u $USERNAME:$PASSWORD -I -H 'Accept: application/vnd.docker.distribution.manifest.v2+json' $REGISTRY_URL/$REGISTRY_API_VERSION/$IMAGE/manifests/$TAG | grep Docker-Content-Digest | awk '{print $2}')

#             # 检查镜像是否存在
#             response=$(curl -s -w "%{http_code}" -X HEAD -u "$USERNAME:$PASSWORD" "$REGISTRY_URL/$REGISTRY_API_VERSION/$IMAGE/manifests/$DIGEST")
#             status_code=$(echo "${response}" | sed -n '$p')

#             if [[ "${status_code}" =~ ^2 ]]; then # 镜像存在
#                 response=$(curl -s -w "%{http_code}" -X DELETE -u "$USERNAME:$PASSWORD" "$REGISTRY_URL/$REGISTRY_API_VERSION/$IMAGE/manifests/$DIGEST")
#                 status_code=$(echo "${response}" | sed -n '$p')

#                 if [[ "${status_code}" =~ ^2 ]]; then # 操作成功
#                     echo "Deleted $IMAGE:$TAG"
#                     echo "Image deleted successfully."
#                 elif [[ "${status_code}" -eq 404 ]]; then # 镜像已被删除
#                     error_message="Image $IMAGE:$TAG has already been deleted."
#                     echo "Failed to delete image. Error message: ${error_message}"
#                 else # 操作失败
#                     error_message=$(echo "${response}" | sed '$d')
#                     echo "Failed to delete image. Error message: ${error_message}"
#                     exit 1
#                 fi
#             else # 不会出现镜像不存在的情况
#                 echo "Unexpected error: image $IMAGE:$TAG not found."
#                 exit 1
#             fi
#         done
#     done

#     echo "All images deleted successfully."
# }