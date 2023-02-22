#!/bin/bash
set -x

while read line
do
	## line 格式: accountsservice 1.0.0
	##
	echo $line
	pkgname=`echo ${line} | awk '{print $1}'`
    pkgversion=`echo ${line} | awk '{print $2}'`
	echo ${pkgname}
    echo ${pkgversion}

	##拉取源码
	for arr in "snipe"
	do
		git clone "ssh://ut000081@gerrit.uniontech.com:29418/${arr}/${pkgname}" && scp -p -P 29418 ut000081@gerrit.uniontech.com:hooks/commit-msg "${pkgname}/.git/hooks/"
		if [ $? -eq 0 ];	then
			break
		fi
	done	
	if [ -d ${pkgname} ];	then
		cd ${pkgname}
        git checkout develop/snipe
		gbp deepin-indepupstream-modify -N ${pkgversion} -R
        git add .
        git commit -m "feat: update version

for +b1 +b2 rebuild

Log:"
        git reviwe -r origin develop/snipe -t rebuild4
		cd ..
	else
		echo "${pkgname} Source Fail." >> Fail.txt
	fi
done < $1
