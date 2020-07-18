" Vim syntax file
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

if exists('b:current_syntax')
	finish
endif

runtime! syntax/perl.vim
syn region perligataRegion matchgroup=perligataStatementInclude
	\ start='use Lingua::Romana::Perligata' end='\%$'
	\ contains=@Perligata

syn cluster Perligata
	\ contains=perligataStatementInclude,perligataComment,perligataNumber,
	\ perligataKeyword,perligataIf,perligataFor,perligataWhile,perligataGroup,
	\ perligataString

" TODO make this case-insensitive where allowed by Perligata

" ute strict, ute warnings, etc.
syn match perligataStatementInclude 'ute [a-zA-Z: ]\+'
" ute 5.032, etc.
syn match perligataStatementInclude 'ute [0-9.]\+\.\@='

syn match perligataComment 'adnota\s.*' contains=perlTodo,@Spell

syn match perligataNumber '\s\@<=(*[MDCLXVI]\+)*\(imum\)\?\s\@='
syn keyword perligataNumber
	\ nullum unum duo tres quattuor quinque sex septem octo novem decem
	\ nullimum primum secundum tertium quartum quintum sextum septimum
	\ octavum nonum decimum

syn keyword perligataKeyword meo meis

" TODO add support for sic ... cis dictum
" TODO add support for (... tum)* ... inquementum
syn region perligataString matchgroup=perligataKeyword
	\ start='\<dictum sic\>' end='\<cis\>'

" si and nisi (if and unless)
syn region perligataIf matchgroup=perligataKeyword
	\ start='\<\(ni\)\?si\>' end='\<fac\>'
	\ transparent
" per and per quisque (for and foreach)
syn region perligataFor matchgroup=perligataKeyword
	\ start='\<per\( quisque\)\?\>' end='\<fac\>'
	\ transparent contains=perligataForIn
syn keyword perligataForIn in contained
" dum and donec (while and until)
syn region perligataWhile matchgroup=perligataKeyword
	\ start='\<\(dum\|donec\)\>' end='\<fac\>'
	\ transparent
syn region perligataGroup matchgroup=perligataKeyword
	\ start='\<sic\>' end='\<cis\>'
	\ transparent contains=@Perligata

hi def link perligataStatementInclude Statement
hi def link perligataComment Comment
hi def link perligataNumber Number
hi def link perligataKeyword Keyword
hi def link perligataString String

hi def link perligataForIn perligataKeyword
