function! ParseJumpLine( jumpLine )
    " Parse one line of output from :jumps into object with count, lnum, col, text.
    let l:parseResult = matchlist(a:jumpLine, '^>\?\s*\(\d\+\)\s\+\(\d\+\)\s\+\(\d\+\)\s\+\(.*\)$')
    return {
    \	'count': get(l:parseResult, 1, 0),
    \	'ln' : get(l:parseResult, 2, 0),
    \	'col'  : get(l:parseResult, 3, 0),
    \	'text' : get(l:parseResult, 4, '')
    \}
endfunction

function! GetCurrentIndex( jumps )
    "echomsg '--------' len(a:jumps)
    let l:currentIndex = -1
    " Note: The linear search starts from the end because it's more likely that
    " the user hasn't navigated to the oldest entries in the jump list.
    for l:i in reverse(range(len(a:jumps)))
	"echomsg '***' l:i a:jumps[l:i]
	if a:jumps[l:i][0] ==# '>'
	    let l:currentIndex = l:i
	    break
	endif
    endfor
    if l:currentIndex < 0
	" XXX: Sometimes, the :changes command just outputs the "change line col
	" text" line, without a ">" line following.
	throw 'EnhancedJumps: jump list does not contain > marker'
    endif
    return l:currentIndex
endfunction

function! GetJumps()
    redir => l:jumpsOutput
    silent! execute 'jumps'
    redir END
    redraw  " This is necessary because of the :redir done earlier.
    return split(l:jumpsOutput, "\n")[1:] " The first line contains the header.
endfunction

function! GetTabs()
    redir => l:tabsOutput
    silent! execute 'tabs'
    redir END
    redraw

    let l:tabs_output = split(l:tabsOutput, '\n')
    let ret = {}
    for l:i in range(1, len(l:tabs_output), 2)
	let l:pr = matchlist(l:tabs_output[l:i], '^>\?\s*\(.*\)$')
	let ret[get(l:pr, 1)] = (l:i + 1) / 2
	"echomsg '^^^^^' get(l:pr, 1) l:i ret[get(l:pr, 1)]
    endfor
    return ret
endfunction

function! NCO()
    let l:jumps = GetJumps()
    let l:tabs_dict = GetTabs()
    let l:x = GetCurrentIndex(l:jumps)
    let l:next = reverse(l:jumps[ : (l:x - 1)])[0]
    let l:jump_dict = ParseJumpLine(l:next)
    let l:text = l:jump_dict['text']
    if l:text[0]=="/" && filereadable(l:text)
	if has_key(l:tabs_dict, l:text)
	    let l:t = l:tabs_dict[l:text]
	    execute 'tabn ' . l:t
	endif
    elseif l:text[0]=="~" && filereadable(expand(l:text))
	if has_key(l:tabs_dict, l:text)
	    let l:t = l:tabs_dict[l:text]
	    execute 'tabn ' . l:t
	endif
    else 
	let l:fp = getcwd() . '/' . l:text
	if filereadable(l:fp) && has_key(l:tabs_dict, l:text)
	    let l:t = l:tabs_dict[l:text]
	    execute 'tabn ' . l:t
	else
	    execute "normal \<C-O>"
	endif
    endif
    execute 'call cursor(' . l:jump_dict['ln'] . ', ' . (l:jump_dict['col'] + 1) . ')'

endfunction
