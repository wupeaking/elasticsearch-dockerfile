# elasticsearch-dockerfile
es带分词插件的镜像

Elasticsearch docker版本在生产环境单机部署

1. 设置Linux内核
sysctl -w vm.max_map_count=262144

2. 修改挂载本地路径的所有权
mkdir esdatadir
chmod g+rwx esdatadir
chgrp 1000 esdatadir

3. 启动镜像
docker run -d -p 9200:9200 -p 9300:9300 \
-e "bootstrap.memory_lock=true" --ulimit memlock=-1:-1 \  # 禁止swap
-e ES_JAVA_OPTS="-Xms16g -Xmx16g" \  设置JVM heap
-e "discovery.type=single-node" \
-v esdatadir:/usr/share/elasticsearch/data \
--log-opt mode=non-blocking --log-opt max-buffer-size=40m \
--name maps-elasticsearch \
wupengxin/elasticsearch:6.5.4-jieba-ik-pinyin