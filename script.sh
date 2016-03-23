#! /bin/bash -
echo "开始克隆项目"

function clone(){
    echo $1 $2;
    git clone $1 $2;
}

cat $1 | while read line
do
    clone ${line};
done

echo "开始构建build.gradle"
echo "buildscript {
    repositories {
        mavenCentral()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:1.5.0'
    }
}" | cat > build.gradle


echo "开始构建settings.gradle"

commom="include ':*'"

rm -rf settings.gradle

function buildSettings(){
    echo $1
    echo $commom | sed 's/\*/'$1'/'| cat >> settings.gradle
}

cat $2 | while read line
do
    buildSettings ${line};
done


