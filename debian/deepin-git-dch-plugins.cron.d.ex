#
# Regular cron jobs for the deepin-git-dch-plugins package
#
0 4	* * *	root	[ -x /usr/bin/deepin-git-dch-plugins_maintenance ] && /usr/bin/deepin-git-dch-plugins_maintenance
