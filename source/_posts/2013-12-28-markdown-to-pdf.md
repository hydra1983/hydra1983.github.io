---
layout: post
title: "从 Markdown 生成 PDF"
description: ""
category: "my tech" 
tags: [brackets, markdown, pdf, pandoc, phantomjs, nodejs, marked]
---

用 [Brackets](http://brackets.io/) 和 [Markdown](https://help.github.com/articles/github-flavored-markdown) 写完简历后，想到需要将 markdown 文件转为其他格式才能作为简历分发出去。这其他格式，就支持程度来说，自然是 PDF 了。于是乎，google 之，大概有两种思路：

0. 将 markdown 文件直接转化为 PDF，可以使用 [pandoc](http://johnmacfarlane.net/pandoc/)
0. 将 markdown 文件转化为 HTML ，然后将 HTML 转化为 PDF ，可以使用 [marked](https://github.com/chjj/marked) 和 [phantomjs](http://phantomjs.org/)

### 第一种思路

* 下载并安装 [pandoc for win](https://pandoc.googlecode.com/files/pandoc-1.12.2.1.msi)
* 下载并安装 [MiKTeX for win](http://mirror.bjtu.edu.cn/CTAN/systems/win32/miktex/setup/basic-miktex.exe)
* 安装完后所需工具会自动添加到系统路径中去
* 下载[这个模板](https://raw.github.com/tzengyuxio/pages/gh-pages/pandoc/pm-template.latex)，以支持中文的自动换行等
* 用文本编辑器（我用的是 Sublime Text 3）打开 pm-template.latex，找到这一行：

<!--more-->

```latex
\setCJKmainfont{LiHei Pro}
```
将其修改为：

```latex
\setCJKmainfont{SimSun}
```
或者其他任意一款系统中已有的中文字体
在命令行中运行：

```bat
fc-list >> fonts.txt
```
可以查看系统中安装的所有字体
或者下载并安装 [NexusFont](http://www.xiles.net/pds/NexusFontSetup2.5.8.exe)，来查看及管理字体

* 如果不需要 PDF 标签，可以修改这一行：

```latex
\usepackage[setpagesize=false, % page size defined by xetex
```
为

```latex
\usepackage[bookmarks=false, % disable bookmark in generated pdf
            setpagesize=false, % page size defined by xetex 
```
* 打开命令行提示符，并执行：

```bat
pandoc -s resume.md -o resume.pdf --template=pm-template.latex --latex-engine=xelatex
```

Done!

### 第二种思路
* 下载并安装 [nodejs](http://nodejs.org/dist/v0.10.24/x64/node-v0.10.24-x64.msi)
* 下载 [pantomjs](https://phantomjs.googlecode.com/files/phantomjs-1.9.2-windows.zip) 并解压到指定目录
* 下载 [markdown.css](https://raw.github.com/gruehle/MarkdownPreview/master/markdown.css)，放入与 resume.md 相同的文件夹下，并用文本编辑器打开，修改这一行：

```css
a[href]:after { content: " (" attr(href) ")"; }
```
为

```css
a[href]:after { content: ""; }
```
这样就不会将链接的地址显示在链接后面了

* 将解压的 phantomjs 加入系统路径
* 安装完毕后，打开命令行提示符，并执行：

```bat
npm -g install marked
```
* 接下来，生成 HTML

```bat
marked -i resume.md -o resume.html --breaks
```
* 创建 index.html，用文本编辑器打开并添加以下内容：

```html
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<title>{标题}</title>
<link rel="stylesheet" type="text/css" href="markdown.css" />
</head>
<body>
{内容}
</body>
</html>
```

将 **{标题}** 替换为 **简历**，将 **{内容}** 替换为 **resume.html** 的内容

* 从 HTML 生成 PDF

```bat
phantomjs "{pantomjs install dir}/examples/rasterize.js" "file:///{index.html 路径}" resume.pdf A4
```

Done!

### 第一种方法与第二种方法一起使用
* 使用第一种方法生成 PDF，样式难以控制
* 使用第二种方法生成 PDF，无法在 PDF 中创建有效链接，参见[这里](https://github.com/ariya/phantomjs/issues/10196 "Suggestion: Include hyperlink action in PDF output for hyperlinks in webpage")
* 可以先生成 HTML，然后再生成 PDF
* 生成 HTML 的步骤同思路二
* 从 HTML 转化为 PDF，打开命令行，并运行：

```bat
pandoc -s resume.html -o resume.pdf --template=pm-template.latex --latex-engine=xelatex
```

Done!

### 从 HTML 生成 PDF 的另一种方法

* 用 Chrome 打开 **resume.html**
* 鼠标右键点击页面，选择 **打印**

Done!


参考：

0. [利用Pandoc将markdown文件转化为pdf](http://blog.sina.com.cn/s/blog_5ee56d450101dah2.html)
0. [pdflatex is needed for pdf output: Pandoc](http://install-pandoc.blogspot.com/2012/02/pdflatex-is-needed-for-pdf-output.html)
