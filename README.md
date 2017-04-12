# Pubbon -- A JIT for Python3.6
## 1. 安装方法
### 1.1 Windows 10(x64) 平台
     首先，确保你的windows系统内安装有Visual Studio 2015以及Python 3.6，然后执行以下步骤：
1. 下载`CMake`并安装；<br>
https://cmake.org/files/v3.8/cmake-3.8.0-win64-x64.msi
2. 安装`llvm-4.0`：<br>
* 下载`llvm-4.0`源代码包并解压；<br>
http://releases.llvm.org/download.html#4.0.0 <br>
* 在源代码文件夹下新建一个`build`目录后，运行`cmake-gui`，其中选项`Source Code`选择源代码目录，选项`binaries`选择新建的`build`目录；<br>
* 点击按钮`Configure`，选择选项`Visual Studio 14 2015 Win64`，配置完毕后将` CMAKE_INSTALL_PREFIX`设置为想要将`llvm-4.0`安装到的目录；<br>
* 依次点击按钮`Configure`和`Generate`，生成完毕后用Visual Studio 2015打开`build`目录下的解决方案文件`LLVM.sln`，在界面上端把`DEBUG`选项改为`Release`，在界面右端选中`INSTALL`项目，右键点击该项目并选择`生成`；<br>
* 安装完毕后，将之前指定的`llvm-4.0`目标目录下`bin`文件夹加入系统环境变量；<br>
3.  安装`Pubbon`模块：<br>
* 手动下载或用`git clone`命令从`https://github.com/KuribohG/Pubbon.git`下载源代码；<br>
* 在开始菜单中找到`Visual Studio 2015`文件夹，打开`VS2015 x64 Native Tools Command Prompt(VS2015 x64 本地工具命令提示符)`，使用`cd`命令进入本机下载的`Pubbon`源代码目录；<br>
* 执行命令`python setup.py install`或者`python3 setup.py install`，安装`Pubbon`模块；<br>

## 2. 使用方法及示例

1. 在`Pubbon`目录外的任意位置，打开一个`python`源代码文件；
2. 在代码的第一行加入`import pubbon`，第二行加入`pubbon.install_jit()`，然后执行即可；
3. 例如，执行如下所示`tester.py`文件，则将会得到输出：
```python
import pubbon
pubbon.install_jit();

def myAdd(x, y):
	return x + y
	
sum = 0
for i in range(5):
	sum = myAdd(sum, i)
print("sum = %d" % sum)
```

```
** myjit is evaluating frame=000002255E5B6210 lasti=-1 lineno=4 throwflag=0
jitted run_count: 1
** myjit is evaluating frame=000002255E5B6210 lasti=-1 lineno=4 throwflag=0
jitted run_count: 1
** myjit is evaluating frame=000002255E5B6210 lasti=-1 lineno=4 throwflag=0
jitted run_count: 2
** myjit is evaluating frame=000002255E5B6210 lasti=-1 lineno=4 throwflag=0
jitted run_count: 3
** myjit is evaluating frame=000002255E5B6210 lasti=-1 lineno=4 throwflag=0
jitted run_count: 4
sum = 10
```
