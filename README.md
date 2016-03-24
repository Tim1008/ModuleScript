### 1. 环境
- 支持shell
- 已安装配置好git

### 2. 使用
`说明:`

- 在命令行下，将目录切换到你的项目目录${project_workspace};
- 首先clone本项目到${project_workspace}(将config文件夹,script.sh,operation.sh,并将这3个文件移动到${project_workspace})
- 将script.sh和operation.sh标记为可执行程序,否则在使用时记得前面加bash,或sh,如:bash script.sh config/demoProjects config/demoSettings((demoProjects是要导入的module配置文件,demoSettings是settings.gradle要添加的module))
- clone开发项目, 执行./script config/xxxProjects config/xxxSettings. 比如: ./script config/demoProjects config/demoSettings

- 平时工作时,切换到相应的项目目录,然后根据不同需求执行不同命令.比如:
- cd ${project_workspace}/anjuke
- ../operation.sh ../config/demoProjects help
- 
- 
- ../operation.sh ../config/demoProjects help                           显示帮助
- ../operation.sh ../config/demoProjects co dev                         批量切换${project_workspace}目录下的module的分支, dev为分支名
- ../operation.sh ../config/demoProjects co-b dev                       批量创建并切换${project_workspace}目录下的module的分支, dev为要创建及切换的分支名
- ../operation.sh ../config/demoProjects coremote dev                   批量切换出${project_workspace}目录下的module的远程分支, dev为分支名(不需要加origin)
- ../operation.sh ../config/demoProjects del dev                        批量删除${project_workspace}目录下的module的本地dev分支
- ../operation.sh ../config/demoProjects del-D dev                      批量删除${project_workspace}目录下的module的本地dev分支(带-D,强制删除)
- ../operation.sh ../config/demoProjects delremote dev                  批量删除${project_workspace}目录下的module的远程dev分支
- ../operation.sh ../config/demoProjects pull                           批量拉取${project_workspace}目录下的module的最新代码 
- ../operation.sh ../config/demoProjects push                           批量推送${project_workspace}目录下的module的代码到远程仓库


### 3. 配置
#### 3.1 新项目
新项目添加在`config文件夹的xxxProjects`配置文件内，添加 git 项目地址,以及clone到本地的文件夹名，区分大小写。如 dotFiles 项目地址为：  
```
git@github.com:Tim1008/dotFiles.git
```
则添加`git@github.com:Tim1008/dotFiles.git dotFiles`,前面是git仓库地址,后面是clone到本地显示的文件夹名,中间隔一个空格

### 4. 设置别名
- mac: bash_profile文件添加 alias xxx=../operation.sh ../config/xxxProjects   (其中xxx改为自己习惯的别名)
- linux: bashrc文件添加 alias xxx="../operation.sh ../config/xxxProjects" 比如alias agit="../operation.sh ../config/demoProjects"
- 设置好之后就可以用别名了,终端切换到相应目录下,然后: xxx help; xxx co-b dev;xxx pull...等等.(xxx是之前设置的别名)
