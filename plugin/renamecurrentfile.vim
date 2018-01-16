if exists('g:renamecurrentfile')
    finish
endif
let g:renamecurrentfile = 1

function! RenameFile()
    let old_name = expand('%')
    let new_dir = expand('%:h')
    let new_name = input('New file name: ', expand('%'))

    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>
