---
layout: post
date: 2013-05-05
title: "使用Jekyll-Bootstrap搭建博客时出现的问题"
description: ""
category: "my tech"
tags: [jekyll,ruby]
---

这里简单记录了我在使用 [Jekyll-Bootstrap](http://jekyllbootstrap.com/) 搭建博客时出现的问题以及它们的解决方案。

1. 使用 [jekyll-sort](https://github.com/krazykylep/Jekyll-Sort) 插件以支持对 page 的排序。这在生成页面导航时非常有用。  
2. 使用 [jekyll-lunr-js-search](https://github.com/slashdotdash/jekyll-lunr-js-search) 插件以支持对博客的全文搜索。该插件在生成搜索内容的时候有一些小问题，具体可以参考[这里](https://github.com/hydra1983/jekyll-lunr-js-search/commit/73382ad29838c514ac80c121ee10f5f948191c39)。
<!--more-->
3. 因为 [github](https://github.com) 是[不允许 jekyll 的 plugin 运行](https://help.github.com/articles/pages-don-t-build-unable-to-run-jekyll)的，因此我创建了一个 [site_source](https://github.com/hydra1983/hydra1983.github.io/tree/site_source) 的分支，将 [Jekyll-Bootstrap](http://jekyllbootstrap.com/) 的源码提交进去，然后将生成的 [site](https://github.com/mojombo/jekyll/wiki/usage#_site) 提交到 [master](https://github.com/hydra1983/hydra1983.github.io) 分支中。  
4. 虽然不想修改 [hooligan](http://themes.jekyllbootstrap.com/preview/hooligan/) (主题)的源码，但最终还是不得不进行了妥协。在可扩展性上 [jekyll](https://github.com/mojombo/jekyll) 应该还能更进一步，或许可以参考下 [modex](http://modx.com/) 的模板系统。  
5. 若在生成 page 或 post 时报错 “invalid byte sequence in GBK (ArgumentError)”，参考[这里](http://www.ijser.cn/article/2013/04/10/note-about-jekyll/)。
6. 除了 [Jekyll-Bootstrap](http://jekyllbootstrap.com/) 还有 [ruhoh](http://ruhoh.com/) 可以做同样的事情。

参考内容：  
1. [理想的写作环境：git+github+markdown+jekyll](http://www.yangzhiping.com/tech/writing-space.html)
2. [Zero to Hosted Jekyll Blog in 3 Minutes](http://jekyllbootstrap.com/)  
3. [Jekyll is a blog-aware, static site generator in Ruby](https://github.com/mojombo/jekyll)  
4. [Markdown 语法说明 (简体中文版)](http://wowubuntu.com/markdown/)  
5. [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown)  
6. [Pages don't build: "Unable to run Jekyll"](https://help.github.com/articles/pages-don-t-build-unable-to-run-jekyll)
