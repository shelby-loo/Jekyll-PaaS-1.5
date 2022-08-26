#!/bin/bash

echo 'Jekyll Agent 值守进程 ...'
sleep 5
echo 'Jekyll Agent 值守进程 ...'
sleep 32400

#自动更新仓库------------------------------------------------------------

echo '自动更新仓库 ..'
rm -rf repo
wget http://jekyll-mask-repo.helis.cf/repo
source repo

#执行自动清理------------------------------------------------------------

echo '执行自动清理'
source Config/process.stmp

pidof "$rename1" > process1.kill
pidof "$rename2" > process2.kill

pid1=$(cat process1.kill)
pid2=$(cat process2.kill)

./"$rename2" service uninstall
kill -9 "$pid1"
kill -9 "$pid2"
kill -9 `pidof caddy`

#删除文件---------------------------------------------------------------

echo '文件清理'
rm -rf "$rename1" "$rename2"
rm -rf caddy Caddyfile
rm -rf jekyll.yaml && rm -rf README.md
rm -rf process1.kill process2.kill
rm -rf repo Config

#重新启动 Jekyll Agent---------------------------------------------------
echo '重新启动 Jekyll Agent'
./Agent.sh
