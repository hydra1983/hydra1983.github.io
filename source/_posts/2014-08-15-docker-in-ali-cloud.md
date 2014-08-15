title: 在阿里云中安装Docker
date: 2014-08-15 11:06:17
tags:
---

### 安装脚本

```shell
#Docker
sed -i -r 's/^(up route add \-net 172\..*)$/#\1/' /etc/network/interfaces
ifdown eth0
ifup eth0
curl -sSL https://get.docker.io/ubuntu/ | sh
sudo docker run -i -t ubuntu /bin/bash
```

### 说明

[Docker的文档](https://docs.docker.com/articles/networking/)中说到容器会使用 **172.17/16** 这个段的IP连接外部网络。

从文件 **/etc/network/interfaces** 中的 **up route add -net 172.16.0.0 netmask 255.240.0.0 gw 10.172.223.247 dev eth0** 可知，这个段的IP已经默认被阿里云的内网网卡 **eth0** 占用了。

```
10101100 00010000 00000000 00000000 172. 16.  0.  0 # 网络
11111111 11110000 00000000 00000000 255.240.  0.  0 # 子网掩码
10101100 00011111 11111111 11111111 172. 31.255.255 # 广播地址
```

因而需要先注释掉占用 **172.16/16** 这个段IP的配置，再安装 Docker。
