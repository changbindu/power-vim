" Vim syntax file
" Language:         Generic log files
" Maintainer:       Alex Dzyoba <avd@reduct.ru>
" Latest Revision:  2013-03-08
" Changes:          2013-03-08 Initial version

" Based on messages.vim - syntax file for highlighting kernel messages

if exists("b:current_syntax")
  finish
endif

syn match log_error 	'\c.*\<\(FATAL\|ERROR\|ERRORS\|FAIL\|FAILED\|FAILURE\|BUG\|Oops\|panic\|crash\|SIGSEGV\).*'
syn match log_warning 	'\c.*\<\(WARNING\|Exception\|Permission\|DELETE\|DELETING\|DELETED\|RETRY\|RETRYING|NULL\|TIMEOUT\).*'
syn region log_string 	start=/'/ end=/'/ end=/$/ skip=/\\./
syn region log_string 	start=/"/ end=/"/ skip=/\\./
syn match log_number 	'0x[0-9a-fA-F]*\|\[<[0-9a-f]\+>\]\|\<\d[0-9a-fA-F]*'
syn match log_notice 	'offline\|online\|Initializing\|register\|registered\|suspend\|resmue\|hibernation\|OKAY*'

syn match   log_date '\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) [ 0-9]\d *'
syn match   log_date '\d\{4}-\d\d-\d\d'

syn match   log_time '\d\d:\d\d:\d\d\s*'
syn match   log_time '\c\d\d:\d\d:\d\d\(\.\d\+\)\=\([+-]\d\d:\d\d\|Z\)'

" use 'highlight' command to available thems
hi def link log_string 		String
hi def link log_number 		Number
hi def link log_date 		Constant
hi def link log_time 		Type
hi def link log_error 		ErrorMsg
hi def link log_warning 	DiffChange
hi def link log_notice	 	Search

let b:current_syntax = "log"
