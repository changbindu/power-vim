# vim 使用Tips

### 功能键
- F1		---- none
- F2		---- 打开本提示
- F3		---- 打开文件浏览器
- F4		---- 打开函数列表
- F5		---- 格式化C代码
- F6		---- 打开/关闭粘贴模式(禁用自动缩进, 即 :set paste)

### 多Tab编辑
- :tabnew <file> ---- 打开一个新标签(或则在NerdTree窗口按't'键)
- Ctrl+Shift+→	---- 切换到下一个标签
- Ctrl+Shift+←	---- 切换到上一个标签
- tl		---- 浏览所有的Tab

### 多窗口操作
- -		---- 打开窗口选择，收入窗口序号a,b,c...
- :sp <file>	---- 可以水平分割窗口
- :vs <file>	---- 可以垂直分割窗口
- Ctrl+w	---- 可以快速在窗口间切换
- Alt+方向键	---- 切换到前／下／上／后一个窗格
- qall		---- 关闭所有文件
- wall		---- 写入所有文件

### 复制粘贴删除
- v		---- 进入可是模式，然后用方向键选择文本，按y复制
- yy		---- 拷贝当前行到剪贴板
- nyy		---- 复制从当前行开始的n行
- p		---- 在光标后粘贴
- dd		---- 删除当前行
- ndd		---- 从当前行开始向后删除n行
- dgg		---- 删除到文件首
- dG		---- 删除到文件尾

### 搜索
(以下命令规则：',x'表示搜索输入的字符，加上w则自动搜索光标位置的字符，比如',wr', ',wf')
###vimgrep
- ,r		---- 在当前目录递归搜索输入的单词，r代表recursive
- ,R		---- 同上，直接用grep命令搜索

###CtrlP
- ,p		---- 打开CtrlP,在工作目录模糊搜索文件，工作目录是git根目录或当前
		     文件的目录(如果没有找到.git目录)
- ,p.		---- 在工作目录模糊搜索文件
- ,pb		---- 列出所有打开的文件(buffers)
- ,g		---- 打开CtrlP，在当前文件搜索符号(需要ctag文件)
- ,G		---- 打开CtrlP，在所有打开的文件中搜索符号
- ,f		---- 打开CtrlP，在当前文件搜索单词
当CtrlP打开后:
- <c-f>		---- 切换搜索方式,如MRU, Buffers, Files
- <c-d>		---- 切换到只搜索文件名模式，不包括全路径
- <c-r>		---- 切换到正则表达式搜索模式


### 替换
- :s/old/new/g	 ---- 当前行无提示替换
- :%s/old/new/g	 ---- 无提示替换
- :%s/old/new/gc ---- 确认替换
- :g/{pattern}/d ---- 删除匹配行
- :v/{pattern}/d ---- 保留匹配行(只显示包含xxx字符串的行)

- :g/{pattern}/d ---- 删除匹配行
- :v/{pattern}/d ---- 保留匹配行

### 一般跳转
- gg		---- 将光标移到文件头部
- G		---- 将光标移到文件尾部
- #G or #gg	---- 移动光标到指定行#. 例如: 5G
- $		---- 移动光标到行尾
- 33%		---- 文件的33%处

### 符号跳转
####ctags
生成tags文件：ctags -R （ctags也可以使用cscope数据库）
- CTRL-]	---- 跟着link/tag转入 (follow link/tag)
- CTRL-T	---- 标签退栈，配合CTRL-]
- CTRL-o	---- 向后跳转
- CTRL-i	---- 向前跳转
- :ju		---- 显示所有的可以跳跃的地方 (print jump list)
- :tag xxx	---- 跳转到符号xxx定义处

####cscope
生成cscope数据库：
find . -name "*.h" -o -name "*.c" -o -name "*.cc" > cscope.files
cscope -bkq -i cscope.files
对于Linux Kernel，还可以用'make cscope'直接生成cscope数据库。
- ,fg		---- 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
- ,fc		---- 查找调用本函数的函数
- ,ft		---- 查找指定的字符串
- ,fs		---- 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
- ,fd		---- 查找本函数调用的函数
- ,fe		---- 查找egrep模式，相当于egrep功能，但查找速度快多了
- ,ff		---- 查找并打开文件，类似vim的find功能
- ,fi		---- 查找包含本文件的文件

### 折叠命令
- set fdm=syntax/indent	设置折叠方式
- zc		---- 折叠
- zo		---- 展开折叠
- zm		---- 对所在范围内所有嵌套的折叠点进行折叠
- zr		---- 对所在范围内所有嵌套的折叠点展开

### 代码注释(nerdcommenter)
(Visual模式下执行命令，会对选中的特定区块进行注释/反注释)
- ,ca		---- 在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
- ,cc		---- 注释当前行
- ,c		---- 切换注释/非注释状态
- ,cs		---- 以”性感”的方式注释
- ,cA		---- 在当前行尾添加注释符，并进入Insert模式
- ,cu		---- 取消注释

### 高亮
- ,h		---- 高亮当前单词(在空白行表示取消高亮)
- z/		---- 开启/打开自动高亮当前单词模式

### snipMate
输入for, if, switch等编程语言关键字，然后按<tab>自动插入代码片段，比如"for<tab>":
for (i = 0; i < count; i++) {

}

### Git集成(git-vim)
- ,gs		---- :GitStatus
- ,gd		---- :GitDiff
- ,gD		---- :GitDiff –cached
- ,gl		---- :GitLog
- ,ga		---- :GitAdd
- ,gA		---- :GitAdd <cfile>
- ,gc		---- :GitCommit
- ,gb		---- :GitBlame


### diff 模式
- 比较 A ， B 文件， vim – d A B 或者这样或先打开文件 A， 然后 
    :vsp（全名vsplit）
  打开 B，然后输入命令
    :diffthis
  或 vimdiff   FILE_LEFT FILE_RIGHT
- ]c		---- 跳转到下一差异点
- [c 		---- 反向跳转

### 拼写检查
:set spell spelllang=en_us
在错误的单词上按 z= 显示纠正提示。

### Python调试:
/todo

### 编辑大文件
编辑大文件时，插件会导致卡死，此时可以禁用插件启动vim: vim -u "NONE" file.log
