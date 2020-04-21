FROM elasticsearch:6.5.4

ADD jieba /usr/share/elasticsearch/plugins/jieba
ADD ik /usr/share/elasticsearch/plugins/ik
