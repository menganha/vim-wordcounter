" wordcounter Plugin
"
" Counts number of words written per session. Additionally, it stores a 
" *.stats file with the opening date, closing date, initial number of words,
" and words written on that file. The plugins loads only when setting up the
" variable g:wordcount_ext which specifies the extension of the file where the
" plugin shoud work.

if &compatible
            \ || v:version < 700
            \ || exists('g:loaded_wordcounter')
    finish
endif
let g:loaded_wordcounter = 1


" WordCountWrapper is a wrapper over the vim native's wordcount() function. It
" returns the number of words or the number of words offset by and argumetn
"
" Arguments:
" mode: 0 counts and returns the number of words
"       1 does the same but offsets the number by the argument input
" Optional: 
" offset (int): offset number of words

function! s:WordCountWrapper(mode,...)
    let counts = wordcount()['words']
    let nWords = counts
    let offset = get(a:, 1, 0)
    if counts == '--No lines in buffer--'
        let nWords = 0
    endif
    if a:mode == 0
        return nWords
    elseif offset
        return nWords - offset
    endif
endfunction


augroup wordCounter
autocmd! 
autocmd BufRead,BufNewFile *_n.md let b:initWords = s:WordCountWrapper(0)
autocmd BufRead,BufNewFile *_n.md let b:initTime = localtime()
autocmd BufRead,BufNewFile *_n.md setlocal cmdheight=2
autocmd BufWritePost *_n.md let b:nWords = s:WordCountWrapper(1, b:initWords)
    \ | echo "Number of written words: " b:nWords
autocmd BufWritePost *_n.md let b:endTime = localtime()
autocmd VimLeave *_n.md  let b:fname = substitute(@%, '\..*$', '\.stats', '')
    \ | if exists("b:nWords")
    \ | execute "silent !echo" b:initTime b:endTime b:initWords b:nWords ">>" b:fname
    \ | endif
augroup END

