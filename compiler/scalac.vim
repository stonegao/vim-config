if exists("current_compiler")
  finish
endif
let current_compiler = "scalac"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=scalac\ -cp\ .

CompilerSet errorformat=%f:%l:\ error:\ %m,%-Z%p^,%-C%.%#,%-G%.%#
