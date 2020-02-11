""" Below only works for vim
function! UploadComplete(channel)
    execute  "cfile! " . g:uploadOutput
    echo "Upload complete"
    unlet g:uploadOutput
endfunction

function! Upload(file)
    if exists('g:uploadOutput')
        echo "Already running task in background."
    else
        let g:uploadOutput = tempname()
        call job_start(['upload', a:file], {'close_cb': 'UploadComplete', 'out_io': 'file', 'out_name': g:uploadOutput})
    endif
endfunction

nnoremap <Leader>r :call Upload(expand('%'))<CR>
nnoremap <Leader>R :call Upload(expand('%:h'))<CR>
nnoremap <Leader>T :call Upload(expand('.'))<CR>
