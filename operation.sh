#! /bin/bash -
predir="../"

file1=$1
action=$2
brname=$3

function onPull(){
    echo $1 $2;
    pushd "$predir""$2"
    git pull --rebase
    popd 
}

#切换分支
function onCo(){
    echo $2;
    pushd "$predir""$2"
    git checkout $brname
    popd 
}

#获取远程分支
function onCoRemote(){
    echo $2;
    pushd "$predir""$2"
    git checkout -b $brname  origin/$brname
    popd 
}

#创建切换分支
function onCoB(){
    echo $2;
    pushd "$predir""$2"
    git checkout -b $brname
    popd 
}

#删除分支
function onDel(){
    echo $2;
    pushd "$predir""$2"
    git branch -d $brname
    popd 
}


function onDelD(){
    echo $2;
    pushd "$predir""$2"
    git branch -D $brname
    popd 
}

#删除远程分支
function onDelRemote(){
    echo $2;
    pushd "$predir""$2"
    git branch -r -d origin/$brname
    popd 
}

function onPush(){
    echo $2;
    pushd "$predir""$2"
    git push origin $brname
    popd 
}


function pullAction(){
    cat $file1 | while read line
    do
        onPull ${line};
    done
}

function coAction(){
    cat $file1 | while read line
    do
        onCo ${line};
    done
}

function coRemoteAction(){
    cat $file1 | while read line
    do
        onCoRemote ${line};
    done
}

function coBAction(){
    cat $file1 | while read line
    do
        onCoB ${line};
    done
}

function delAction(){
    cat $file1 | while read line
    do
        onDel ${line};
    done
}

function delDAction(){
    cat $file1 | while read line
    do
        onDelD ${line};
    done
}

function delRemoteAction(){
    cat $file1 | while read line
    do
        onDelRemote ${line};
    done
}

function pushAction(){
    cat $file1 | while read line
    do
        onPush ${line};
    done
}

function helpAction(){
    echo "相关命令:
../operation.sh $file1 help                           显示帮助
../operation.sh $file1 co dev                         批量切换`dirname $PWD`目录下的module的分支, dev为分支名
../operation.sh $file1 co-b dev                       批量创建并切换`dirname $PWD`目录下的module的分支, dev为要创建及切换的分支名
../operation.sh $file1 coremote dev                   批量切换出`dirname $PWD`目录下的module的远程分支, dev为分支名(不需要加origin)
../operation.sh $file1 del dev                        批量删除`dirname $PWD`目录下的module的本地dev分支
../operation.sh $file1 del-D dev                      批量删除`dirname $PWD`目录下的module的本地dev分支(带-D,强制删除)
../operation.sh $file1 delremote dev                  批量删除`dirname $PWD`目录下的module的远程dev分支
../operation.sh $file1 pull                           批量拉取`dirname $PWD`目录下的module的最新代码
../operation.sh $file1 push                           批量推送`dirname $PWD`目录下的module的代码到远程仓库"
}

case $action in
    "pull"  ) pullAction;;
    "co"  ) coAction;;
    "coremote"  ) coRemoteAction;;
    "co-b"  ) coBAction;;
    "del"  ) delAction;;
    "del-D"  ) delDAction;;
    "delremote"  ) delRemoteAction;;
    "push"  ) pushAction;;
    "help"  ) helpAction;;
esac 
