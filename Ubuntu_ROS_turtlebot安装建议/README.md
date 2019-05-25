<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Git常用操作 - django-\/\/  i K |</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="www.django-wiki.org">
	<link href=" /media/favicon.ico" rel="shortcut icon"> 
    <!-- Le styles -->
    <link href="/static/wiki/bootstrap/css/wiki-bootstrap.min.css" rel="stylesheet">

    
      
        <link rel="stylesheet" href="/static/wiki/colorbox/example1/colorbox.css" />
      
    


    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

  </head>

  <body>

    

    
    <div class="navbar navbar-fixed-top navbar-inverse">
      <div class="container">
        <div class="navbar-header">
          <!-- .navbar-toggle is used as the toggle for collapsed navbar content -->
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          
          <a class="navbar-brand" href="/">django-\/\/ i K |</a>
          
        </div>
        <div class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" id="wiki-search-form" method="GET" action="/laboratory/git/gitoperator/_search/"
          >
            <div class="input-group">
              <input type="search" class="form-control search-query" name="q" placeholder="在当前文章搜索……" />
              <span class="input-group-btn">
                <button class="btn btn-default" type="submit">
                  <span class="fa fa-search"></span>
                </button>
              </span>
            </div><!-- /input-group -->
          </form>
          <div class="navbar-right">
            
            <ul class="nav navbar-nav">
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <span class="badge notification-cnt">0</span>
                  admin
                  <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                  
                  <li>
                    <a href="/_accounts/settings/">
                      <i class="fa fa-gear"></i>
                      账户设置
                    </a>
                  </li>
                  
                  <li>
                    <a href="/_accounts/logout/">
                      <i class="fa fa-power-off"></i>
                      注销
                    </a>
                  </li>
                  
                  <li>
                    <a href="/_admin/">
                      <i class="fa fa-trash-o"></i>
                      已删除的文章
                    </a>
                  </li>
                  
                  
                    

  <li class="divider notification-before-list"></li>
  <li class="notifications-empty"><a href="#"><em>没有通知</em></a></li>
  <li class="divider"></li>
  <li>
    <a href="#" onclick="notify_mark_read()">
      <i class="fa fa-check-square-o"></i>
      清除通知列表
    </a>
  </li>
  <li>
    <a href="/_plugin/notifications/">
      <i class="fa fa-wrench"></i>
      通知设置
    </a>
  </li>



                  
                  
                    

<li class="divider"></li>
<li>
  <a href="/_plugin/globalhistory/">
    <i class="fa fa-clock-o"></i>
    总历史
  </a>
</li>

                  
                </ul>
              </li>
            </ul>
            
          </div>
          
          <ul class="nav navbar-nav">
            <li class="active"><a href="/">首页</a></li>
            <li><a href="https://github.com/django-wiki/django-wiki" target="_blank">关于</a></li>
          </ul>
          
        </div>
      </div>
    </div>
    

    <div class="container" style="margin-top: 60px;">

      


      <!-- Reserved for breadcrumbs -->
      


<div id="article-breadcrumbs">

<ul class="breadcrumb pull-left">
  
    <li><a href="/">个人知识管理系统</a></li>
  
    <li><a href="/laboratory/">科学技术</a></li>
  
    <li><a href="/laboratory/git/">Git</a></li>
  
  <li class="active">Git常用操作</li>
</ul>
<div class="pull-left" style="margin-left: 10px;">
  <div class="btn-group">
    <a class="btn btn-info dropdown-toggle" data-toggle="dropdown" href="#" style="padding: 7px;" title="子文章 Git常用操作">
      <span class="fa fa-sitemap"></span>
      <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
      
        <li>
          <a href="/laboratory/git/gitoperator/gitworkingprinciple/">
            Git的工作原理与概念
          </a>
        </li>
        
      
      <li class="divider"></li>
      <li>
        <a href="/laboratory/git/gitoperator/_dir/">浏览子文章 &raquo;</a>
      </li>
    </ul>
  </div>
</div>
<div class="pull-left" style="margin-left: 10px;">
  <div class="btn-group">
    <a class="btn btn-info dropdown-toggle" data-toggle="dropdown" href="#" style="padding: 7px;" title="子文章 Git常用操作">
      <span class="fa fa-file"></span>
      <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
      <li>
        
        <a href="/laboratory/git/_create/" style="padding: 7px;">
          <span class="fa fa-arrow-right"></span>
          在Git常用操作旁新建同级文章
        </a>
        
        <a href="/laboratory/git/gitoperator/_create/" style="padding: 7px;">
          <span class="fa fa-arrow-down"></span>
          在Git常用操作下新建子文章
        </a>
      </li>
    </ul>
  </div>
</div>
<div style="clear: both"></div>
</div>




      <!-- Main page contents go here -->
      

  <div id="article-container">
    <ul class="nav nav-pills" id="article-menu">
      <li class="pull-left" id="article-title-li">
        <h1 id="article-title">
          Git常用操作
          <small style="font-size: 14px;">
            
            <a href="/laboratory/git/gitoperator/"><span class="fa fa-bookmark"></span> gitoperator</a>
            
            
          </small>
        </h1>
      </li>
      



<li class="pull-right">
  
  <a href="/laboratory/git/gitoperator/_settings/">
    <span class="fa fa-wrench"></span>
    <span class="hidden-xs">设置</span>
  </a>
  
</li>


  <li class="pull-right">
    <a href="/laboratory/git/gitoperator/_plugin/attachments/">
      <span class="fa fa-file"></span>
      <span class="hidden-xs">附件</span>
    </a>
  </li>


<li class="pull-right">
  <a href="/laboratory/git/gitoperator/_history/">
    <span class="fa fa-clock-o"></span>
    <span class="hidden-xs">修改</span>
  </a>
</li>


<li class="pull-right">
  <a href="/laboratory/git/gitoperator/_edit/">
    <span class="fa fa-edit"></span>
    <span class="hidden-xs">编辑</span>
  </a>
</li>


<li class="pull-right active">
  <a href="/laboratory/git/gitoperator/">
    <span class="fa fa-home"></span>
    <span class="hidden-xs">查看</span>
  </a>
</li>



    </ul>
    <div>
      

  



<div class="wiki-article">
  <div class="toc"><span class="toctitle">内容</span><ul>
<li><a href="#wiki-toc-git-status">git status状态简览</a></li>
<li><a href="#wiki-toc-gitignore">.gitignore忽略文件</a></li>
<li><a href="#wiki-toc-git-init-git">git init创建 Git 仓库</a></li>
<li><a href="#wiki-toc-">克隆现有的仓库</a></li>
<li><a href="#wiki-toc-git-add">git add 暂存</a></li>
<li><a href="#wiki-toc-git-diff">git diff 查看哪些未暂存</a></li>
<li><a href="#wiki-toc-git-diff-cached">git diff --cached</a></li>
<li><a href="#wiki-toc-git-commit">git commit 提交</a></li>
<li><a href="#wiki-toc-git-commit-a">git commit 加上 -a 跳过使用暂存区域</a></li>
<li><a href="#wiki-toc-_1">移除文件</a></li>
<li><a href="#wiki-toc-glob">glob 模式</a></li>
<li><a href="#wiki-toc-git-mv">git mv 移动</a></li>
<li><a href="#wiki-toc-_2">撤消操作</a></li>
<li><a href="#wiki-toc-_3">取消暂存的文件</a></li>
<li><a href="#wiki-toc-_4">撤消对文件的修改</a></li>
<li><a href="#wiki-toc-_5">查看远程仓库</a></li>
<li><a href="#wiki-toc-_6">添加远程仓库</a></li>
<li><a href="#wiki-toc-_7">从远程仓库中抓取与拉取</a></li>
<li><a href="#wiki-toc-git-clone">git clone</a></li>
<li><a href="#wiki-toc-git-push">git push</a></li>
<li><a href="#wiki-toc-git-remote-show">git remote show</a></li>
</ul>
</div>
<h1 id="wiki-toc-git-status">git status状态简览</h1>
<p>git status 命令的输出十分详细，但其用语有些繁琐。 如果你使用 git status -s 命令或 git status --short 命令，你将得到一种更为紧凑的格式输出。 运行 git status -s ，状态报告输出如下：</p>
<div class="codehilite-wrap"><div class="codehilite"><pre><span></span>$ git status -s
 M README
MM Rakefile
A  lib/git.rb
M  lib/simplegit.rb
?? LICENSE.txt
</pre></div>
</div>

<p>新添加的未跟踪文件前面有 ?? 标记，新添加到暂存区中的文件前面有 A 标记，修改过的文件前面有 M 标记。 你可能注意到了 M 有两个可以出现的位置，出现在右边的 M 表示该文件被修改了但是还没放入暂存区，出现在靠左边的 M 表示该文件被修改了并放入了暂存区。 例如，上面的状态报告显示： README 文件在工作区被修改了但是还没有将修改后的文件放入暂存区,lib/simplegit.rb 文件被修改了并将修改后的文件放入了暂存区。 而 Rakefile 在工作区被修改并提交到暂存区后又在工作区中被修改了，所以在暂存区和工作区都有该文件被修改了的记录。</p>
<h1 id="wiki-toc-gitignore">.gitignore忽略文件</h1>
<p>一般我们总会有些文件无需纳入 Git 的管理，也不希望它们总出现在未跟踪文件列表。 通常都是些自动生成的文件，比如日志文件，或者编译过程中创建的临时文件等。 在这种情况下，我们可以创建一个名为 .gitignore 的文件，列出要忽略的文件模式。 来看一个实际的例子：</p>
<div class="codehilite-wrap"><div class="codehilite"><pre><span></span>$ cat .gitignore
*.<span class="o">[</span>oa<span class="o">]</span>
*~
</pre></div>
</div>

<p>第一行告诉 Git 忽略所有以 .o 或 .a 结尾的文件。一般这类对象文件和存档文件都是编译过程中出现的。 第二行告诉 Git 忽略所有以波浪符（~）结尾的文件，许多文本编辑软件（比如 Emacs）都用这样的文件名保存副本。 此外，你可能还需要忽略 log，tmp 或者 pid 目录，以及自动生成的文档等等。 要养成一开始就设置好 .gitignore 文件的习惯，以免将来误提交这类无用的文件。</p>
<p>文件 .gitignore 的格式规范如下：</p>
<ul>
<li>
<p>所有空行或者以 ＃ 开头的行都会被 Git 忽略。</p>
</li>
<li>
<p>可以使用标准的 glob 模式匹配。</p>
</li>
<li>
<p>匹配模式可以以（/）开头防止递归。</p>
</li>
<li>
<p>匹配模式可以以（/）结尾指定目录。</p>
</li>
<li>
<p>要忽略指定模式以外的文件或目录，可以在模式前加上惊叹号（!）取反</p>
</li>
</ul>
<p>所谓的 glob 模式是指 shell 所使用的简化了的正则表达式。 星号（<em>）匹配零个或多个任意字符；[abc] 匹配任何一个列在方括号中的字符（这个例子要么匹配一个 a，要么匹配一个 b，要么匹配一个 c）；问号（?）只匹配一个任意字符；如果在方括号中使用短划线分隔两个字符，表示所有在这两个字符范围内的都可以匹配（比如 [0-9] 表示匹配所有 0 到 9 的数字）。 使用两个星号（</em>) 表示匹配任意中间目录，比如 a/**/z 可以匹配 a/z , a/b/z 或 a/b/c/z 等。</p>
<div class="codehilite-wrap"><div class="codehilite"><pre><span></span>我们再看一个 .gitignore 文件的例子：

# no .a files
*.a

# but do track lib.a, even though you&#39;re ignoring .a files above
!lib.a

# only ignore the TODO file in the current directory, not subdir/TODO
/TODO

# ignore all files in the build/ directory
build/

# ignore doc/notes.txt, but not doc/server/arch.txt
doc/*.txt

# ignore all .pdf files in the doc/ directory
doc/**/*.pdf
</pre></div>
</div>

<p>GitHub 有一个十分详细的针对数十种项目及语言的 .gitignore 文件列表，你可以在 <a href="https://github.com/github/gitignore"><span class="fa fa-external-link"></span><span> https://github.com/github/gitignore</span></a> 找到它.</p>
<h1 id="wiki-toc-git-init-git">git init创建 Git 仓库</h1>
<p>$ git init
$ git add *.c
$ git add LICENSE
$ git commit -m 'initial project version'</p>
<h1 id="wiki-toc-">克隆现有的仓库</h1>
<p>git clone <a href="https://github.com/libgit2/libgit2"><span class="fa fa-external-link"></span><span> https://github.com/libgit2/libgit2</span></a> mylibgit<br>
会保存到你执行这句话的目录下。<br>
Git 支持多种数据传输协议。 上面的例子使用的是 https:// 协议，不过你也可以使用 git:// 协议或者使用 SSH 传输协议，比如 user@server:path/to/repo.git 。</p>
<h1 id="wiki-toc-git-add">git add 暂存</h1>
<h1 id="wiki-toc-git-diff">git diff 查看哪些未暂存</h1>
<p>工作目录中当前文件和暂存区域快照之间的差异</p>
<h1 id="wiki-toc-git-diff-cached">git diff --cached</h1>
<p>查看已暂存的将要添加到下次提交里的内容。<br>
Git 1.6.1 及更高版本还允许使用 git diff --staged，效果是相同的，但更好记些。）</p>
<h1 id="wiki-toc-git-commit">git commit 提交</h1>
<p>使用 git config --global <a href="http://core.editor"><span class="fa fa-external-link"></span><span> core.editor</span></a> 命令设定你喜欢的编辑软件
- 你也可以在 commit 命令后添加 -m 选项，将提交的评论与命令放在同一行。</p>
<h1 id="wiki-toc-git-commit-a">git commit 加上 -a 跳过使用暂存区域</h1>
<h1 id="wiki-toc-_1">移除文件</h1>
<ul>
<li>1、从已跟踪文件清单中移除<br>
用 git rm 命令完成此项工作，并连带从工作目录中删除指定的文件，这样以后就不会出现在未跟踪文件清单中了。</li>
<li>如果只是简单地从工作目录中手工删除文件，运行 git status 时就会在 “Changes not staged for commit” 部分（也就是 未暂存清单）看到：</li>
<li>如果删除之前修改过并且已经放到暂存区域的话，则必须要用强制删除选项 -f（译注：即 force 的首字母）。 这是一种安全特性，用于防止误删还没有添加到快照的数据，这样的数据不能被 Git 恢复。
<br><br></li>
<li>2、想让文件保留在磁盘，但是并不想让 Git 继续跟踪</li>
<li>添加 .gitignore </li>
<li>或者git rm --cached README</li>
</ul>
<h1 id="wiki-toc-glob">glob 模式</h1>
<ul>
<li>git rm log/*.log</li>
<li>注意到星号 * 之前的反斜杠 \， 因为 Git 有它自己的文件模式扩展匹配方式，所以我们不用 shell 来帮忙展开。 此命令删除 log/ 目录下扩展名为 .log 的所有文件。 类似的比如：</li>
<li>git rm *~</li>
</ul>
<h1 id="wiki-toc-git-mv">git mv 移动</h1>
<ul>
<li>git mv file_from file_to</li>
</ul>
<div class="codehilite-wrap"><div class="codehilite"><pre><span></span> git mv README.md README
$ git rm README.md
$ git add README
</pre></div>
</div>

<h1 id="wiki-toc-_2">撤消操作</h1>
<div class="codehilite-wrap"><div class="codehilite"><pre><span></span>$ git commit -m <span class="s1">&#39;initial commit&#39;</span>
$ git add forgotten_file
$ git commit --amend
</pre></div>
</div>

<h1 id="wiki-toc-_3">取消暂存的文件</h1>
<div class="codehilite-wrap"><div class="codehilite"><pre><span></span>use &quot;git reset HEAD &lt;file&gt;...&quot; to unstage
git reset HEAD CONTRIBUTING.md
</pre></div>
</div>

<h1 id="wiki-toc-_4">撤消对文件的修改</h1>
<div class="codehilite-wrap"><div class="codehilite"><pre><span></span>use &quot;git checkout -- &lt;file&gt;...&quot; to discard changes in working directory
</pre></div>
</div>

<h1 id="wiki-toc-_5">查看远程仓库</h1>
<div class="codehilite-wrap"><div class="codehilite"><pre><span></span>git remote -v
</pre></div>
</div>

<h1 id="wiki-toc-_6">添加远程仓库</h1>
<div class="codehilite-wrap"><div class="codehilite"><pre><span></span> git remote add &lt;shortname&gt; &lt;url&gt; 

 git remote add pb https://github.com/paulboone/ticgit
</pre></div>
</div>

<h1 id="wiki-toc-_7">从远程仓库中抓取与拉取</h1>
<p>如果你想拉取 Paul 的仓库中有但你没有的信息，可以运行 </p>
<div class="codehilite-wrap"><div class="codehilite"><pre><span></span> git fetch [remote-name]

 git fetch pb
</pre></div>
</div>

<p>必须注意 git fetch 命令会将数据拉取到你的本地仓库 - 它并不会自动合并或修改你当前的工作。 当准备好时你必须手动将其合并入你的工作。</p>
<h1 id="wiki-toc-git-clone">git clone</h1>
<p>如果你使用 clone 命令克隆了一个仓库，命令会自动将其添加为远程仓库并默认以 “origin” 为简写。 </p>
<h1 id="wiki-toc-git-push">git push</h1>
<p>推送</p>
<div class="codehilite-wrap"><div class="codehilite"><pre><span></span> git push [remote-name] [branch-name]
 git push origin master
</pre></div>
</div>

<p>当你和其他人在同一时间克隆，他们先推送到上游然后你再推送到上游，你的推送就会毫无疑问地被拒绝。 你必须先将他们的工作拉取下来并将其合并进你的工作后才能推送。 </p>
<h1 id="wiki-toc-git-remote-show">git remote show</h1>
<p>git remote show [remote-name]
 这些信息非常有用，它告诉你正处于 master 分支，并且如果运行 git pull，就会抓取所有的远程引用，然后将远程 master 分支合并到本地 master 分支。</p>
</div>


  
  

  
  

  
  

  
    
  
  
    
  

  
  

  
  

  
  




    </div>
  </div>



      <footer id="wiki-footer">
        <hr />
        
        <a href="https://github.com/django-wiki/django-wiki" class="pull-right"><img src="/static/wiki/img/github_icon.png" /></a>
        
        
  <p style="margin-bottom: 10px;"><em>此文章的最后一次编辑时间: 2019年5月25日 11:53</em></p>

        <p>Powered by <a href="http://www.django-wiki.org">django-wiki</a>, an open source application under the <a href="http://www.gnu.org/licenses/quick-guide-gplv3.html">GPLv3</a> license. Let knowledge be the cure.</p>
        <div style="clear: both"></div>
      </footer>
      </div>

    </div> <!-- /container -->

    

    <script src="/static/wiki/js/jquery-3.3.1.min.js"></script>
    <script src="/static/wiki/js/core.js"></script>
    <script src="/static/wiki/bootstrap/js/bootstrap.min.js"></script>
    <!-- Optionally enable responsive features in IE8 -->
    <script src="/static/wiki/js/respond.min.js"></script>
    
<script type="text/javascript">
  URL_NOTIFY_GET_NEW = "/notify/json/get/";
  URL_NOTIFY_MARK_READ = "/notify/json/mark-read/";
  URL_NOTIFY_GOTO = "/notify/goto/";
</script>

<script type="text/javascript" src="/static/wiki/plugins/notifications/js/ui.js"></script>

  <script type="text/javascript" src="/static/wiki/js/article.js"></script>


      
        <script type="text/javascript" src="/static/wiki/colorbox/jquery.colorbox-min.js"></script>
      
        <script type="text/javascript" src="/static/wiki/js/images.js"></script>
      
    


  </body>
</html>
