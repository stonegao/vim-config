if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" Templateを使わない
let b:template_used = 1

" 折り畳み設定 "{{{
setlocal foldmethod=indent
setlocal foldnestmax=10
setlocal nofoldenable
setlocal foldlevel=1
"}}}

" タブ幅設定 "{{{
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
"}}}

" 補完用辞書設定
if exists('g:Scala_Dictionary_File')
  silent! execute 'setlocal dictionary^=' . g:Scala_Dictionary_File
else
  silent! execute 'setlocal dictionary^=' . globpath(&runtimepath, "dict/java.dict")
  silent! execute 'setlocal dictionary^=' . globpath(&runtimepath, "dict/scala.dict")
endif

if !exists("current_compiler")
  if isdirectory("project") && isdirectory("target") &&
        \ ( glob("*.sbt") != "" || glob("project/*.scala") != "" )
    compiler sbt
  else
    compiler scalac
  endif
endif

" vim: foldmethod=marker
