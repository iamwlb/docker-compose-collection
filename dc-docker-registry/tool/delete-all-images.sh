# source global.bashrc
###
 # @Author: 王丽兵
 # @Date: 2023-04-04 11:00:39
 # @LastEditTime: 2023-04-06 16:19:56
 # @LastEditors: 王丽兵
 # @Description: 
 # @FilePath: /deploymentScript/devops/dc-docker-registry/tool/delete-all-images.sh
### 
# source common/docker-registry.sh

# delete_all_images $REGISTRY_URL $REGISTRY_API_VERSION $USERNAME $PASSWORD
cd ..
docker-compose down
rm -rf docker-registry/data/registry/docker
docker-compose up -d
cd tool
echo "删除仓库所有镜像完毕"
ls