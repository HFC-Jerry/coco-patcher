#
# Regular cron jobs for the coco-patcher package.
#
0 4	* * *	root	[ -x /usr/bin/coco-patcher_maintenance ] && /usr/bin/coco-patcher_maintenance
