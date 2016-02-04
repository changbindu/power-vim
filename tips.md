# vim 使用tip

### 一般编辑
- ctrl+c 复制
- ctrl+v 粘贴
- yy 拷贝当前行到剪贴板
- nyy 复制从当前行开始的n行
- p 在光标后粘贴
- dd 删除当前行
- ndd 从当前行开始向后删除n行
- e <file> 打开文件
- :s/old/new/g 当前行无提示替换
- :%s/old/new/g 无提示替换
- :%s/old/new/gc 确认替换
- :g/{pattern}/d  删除匹配行
- :v/{pattern}/d  保留匹配行(只显示包含xxx字符串的行)

:g/{pattern}/d "删除匹配行 
:v/{pattern}/d "保留匹配行

### 快捷键
- F2 自动去空行
- ctrl+F2 比较文件
- F3 打开当前文件目录
- ctrl+F3 打开树状目录
- F5 编译程序
- F6 大码格式化

### 跳转
- gg 将光标移到文件头部
- G  将光标移到文件尾部
- #G or #gg 移动光标到指定行#. 例如: 5G
- mx 设置书签,x只能是a-z的26个字母
- `x 跳转到书签处(“`”是1左边的键)`)`
- fx：移动光标到当前行的下一个 x 处。很明显，x 可以是任意一个字母，而且你可以使用 ; 来重复你的上一个 f 命令
- Fx：和 fx 类似，不过是往回找
- $：移动光标到行尾
- 33% : 文件的33%处
- CTRL-] 跟着link/tag转入 (follow link/tag)
- CTRL-o 回到上一次的jump (go back)
- CTRL-i 跳回下一个 (go forward)
- :ju 显示所有的可以跳跃的地方 (print jump list)

### 折叠命令
- set fdm=syntax 设置折叠方式
- zc 折叠
- zC 对所在范围内所有嵌套的折叠点进行折叠
- zo 展开折叠
- zO 对所在范围内所有嵌套的折叠点展开

### 多窗口操作

- 使用`:sp + 文件名`可以水平分割窗口
- 使用`:vs + 文件名`可以垂直分割窗口
- 使用`Ctrl + w`可以快速在窗口间切换, Ctrl+w+方向键——切换到前／下／上／后一个窗格
- 在vim和talglist窗口之间切换的命令为ctrl + w + w
- 关闭vim窗口中的一个：切换到你想要关闭的窗口，然后输入：bd （buffer delete）
- qall 关闭所有文件quit all
- wall 写入所有文件write all
- :bn—下一个文件
- :bp—上一个文件

### diff 模式
- 比较 A ， B 文件， vim – d A B 或者这样或先打开文件 A，然后 :vsp（全名vsplit） 打开 B，
然后输入命令 :diffthis 或 vimdiff   FILE_LEFT FILE_RIGHT
- ]c 跳转到下一差异点
- [c 反向跳转]

### 编写python程序
- 自动插入头信息：
    - `#!/usr/bin/env python`
    - `# coding=utf-8`
- 输入`.`或按`TAB`键会触发代码补全功能
- `:w`保存代码之后会自动检查代码错误与规范
- 按`F6`可以按`pep8`格式对代码格式优化
- 按`F5`可以一键执行代码


### 编写markdown文件
- 编写markdown文件(`*.md`)的时候，在normal模式下按 `md` 即可在当前目录下生成相应的`html`文件
- 生成之后还是在normal模式按`fi`可以使用firefox打开相应的`html`文件预览
- 当然也可以使用万能的`F5`键来一键转换并打开预览
- 如果打开过程中屏幕出现一些混乱信息，可以按`Ctrl + l`来恢复

### 编辑大文件
编辑大文件时，插件会导致卡死，此时可以禁用插件启动vim: vim -u "NONE" file.log
