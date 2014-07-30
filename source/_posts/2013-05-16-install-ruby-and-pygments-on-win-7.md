---
layout: post
date: 2013-05-16
title: "在 win7 上安装 Ruby 1.9.3 和 pygments"
description: ""
category: "my tech"
tags: [ruby,python,pygments]
---

* [下载](http://www.7-zip.org/download.html)并安装 7zip。
* [下载](http://rubyforge.org/frs/download.php/76953/ruby-1.9.3-p429-i386-mingw32.7z) ruby 安装包，解压到指定目录，例如 D:/ruby。
* [下载](https://github.com/downloads/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe) DEVELOPMENT KIT，解压到指定目录，例如 D:/devkit。
* 设置环境变量 RUBY_HOME 为 D:/ruby。
* 将 %RUBY_HOME%\bin 添加到 path 中去。
* 打开命令行并执行

<!--more-->

```bat
D:
cd devkit
ruby dk.rb init
```
* 在生成的 config.yml 中添加

```yaml
- D:/usr/share/ruby
```
* 在命令行中执行

```bat
ruby dk.rb install
```
* [下载](http://www.python.org/ftp/python/2.7.5/python-2.7.5.msi)并安装 python 到指定目录，例如 D:/python。
* 设置环境变量 PY_HOME 为 D:/python。
* 将 %PY_HOME% 添加到 path 中去。
* [下载](http://peak.telecommunity.com/dist/ez_setup.py) ez_setup.py 到指定目录，例如 D:。
* 打开命令行并执行

```bat
D:
python ez_setup.py
```
* 添加 %PY_HOME%\Scripts 到 path 中去。
* 打开命令行并执行

```bat
easy_install pygments
```
