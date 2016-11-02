# vim 使用Tips

### 功能键
- F1 none
- F2 打开本提示
- F3 打开文件浏览器
- F4 打开函数列表
- F5 格式化C代码

### 多Tab编辑
- :tabnew <file>	打开一个新标签(或则在NerdTree窗口按't'键)
- Ctrl+Shift+→		切换到下一个标签
- Ctrl+Shift+←		切换到上一个标签
- tl			浏览所有的Tab

### 多窗口操作
- -		打开窗口选择，收入窗口序号a,b,c...
- :sp <file>	可以水平分割窗口
- :vs <file>	可以垂直分割窗口
- Ctrl+w	可以快速在窗口间切换
- Alt+方向键	切换到前／下／上／后一个窗格
- qall		关闭所有文件
- wall		写入所有文件

### 复制粘贴
- v	进入可是模式，然后用方向键选择文本，按y复制
- yy	拷贝当前行到剪贴板
- nyy	复制从当前行开始的n行
- p	在光标后粘贴
- dd	删除当前行
- ndd	从当前行开始向后删除n行

### 文字搜索
(以下命令规则：',x'表示搜索输入的字符，加上w则自动搜索光标位置的字符，比如',wr', ',wf')
- ,r	在当前目录递归搜索(vimgrep)输入的单词，R代表recursive
- ,R	同上，直接用grep命令搜索
- ,g	在当前文件搜索(CtrlP)输入的符号(需要ctag文件)
- ,G	在所有打开的文件中搜索(CtrlP)输入的符号
- ,f	在当前文件搜索(CtrlP)输入的单词
- ,p	在工作目录模糊搜索(CtrlP)输入的文件名，工作目录是git根目录或当前文件的目录(如果没有找到.git文件夹)

### 替换
- :s/old/new/g		当前行无提示替换
- :%s/old/new/g		无提示替换
- :%s/old/new/gc	确认替换
- :g/{pattern}/d	删除匹配行
- :v/{pattern}/d	保留匹配行(只显示包含xxx字符串的行)

- :g/{pattern}/d	删除匹配行
- :v/{pattern}/d	保留匹配行

### 一般跳转
- gg		将光标移到文件头部
- G		将光标移到文件尾部
- #G or #gg	移动光标到指定行#. 例如: 5G
- $		移动光标到行尾
- 33%		文件的33%处

### 符号跳转
- CTRL-]	跟着link/tag转入 (follow link/tag)
- CTRL-o	回到上一次的jump (go back)
- CTRL-i	跳回下一个 (go forward)
- :ju		显示所有的可以跳跃的地方 (print jump list)

### 折叠命令
- set fdm=syntax/indent	设置折叠方式
- zc			折叠
- zo			展开折叠
- zm			对所在范围内所有嵌套的折叠点进行折叠
- zr			对所在范围内所有嵌套的折叠点展开

### 代码注释
(Visual模式下执行命令，会对选中的特定区块进行注释/反注释)
- ,ca		在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
- ,cc		注释当前行
- ,c		切换注释/非注释状态
- ,cs		以”性感”的方式注释
- ,cA		在当前行尾添加注释符，并进入Insert模式
- ,cu		取消注释

### diff 模式
- 比较 A ， B 文件， vim – d A B 或者这样或先打开文件 A，
  然后 :vsp（全名vsplit） 打开 B，然后输入命令 :diffthis
  或 vimdiff   FILE_LEFT FILE_RIGHT
- ]c 跳转到下一差异点
- [c 反向跳转]

### Python调试:
- :Dbg over
- :Dbg into
- :Dbg out
- :Dbg here
- :Dbg break
- :Dbg watch
- :Dbg down
- :Dbg up

### 编辑大文件
编辑大文件时，插件会导致卡死，此时可以禁用插件启动vim: vim -u "NONE" file.log
