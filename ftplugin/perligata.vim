" Vim filetype plugin file
" Language:    Lingua::Romana::Perligata
" Maintainer:  psvenk
" Last Change: July 18, 2020
" URL:         https://github.com/psvenk/vim-perligata

" Copyright 2020 psvenk

" Permission to use, copy, modify, and/or distribute this software for any
" purpose with or without fee is hereby granted, provided that the above
" copyright notice and this permission notice appear in all copies.

" THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
" WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
" MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
" ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
" WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
" ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
" OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

if exists('b:did_ftplugin')
	finish
endif
let b:did_ftplugin = 1

setlocal comments=b:adnota
setlocal commentstring=adnota\ %s

" Make % command work properly with matchit plugin
let b:match_ignorecase = 1
let b:match_words = '\<if\>:\<elsif\>:\<else\>,\<sic\>:\<cis\>,\<\(si\|nisi\|dum\|donec\)\>:\<fac\>,\<per\>:\<in\>:\<fac\>,'
