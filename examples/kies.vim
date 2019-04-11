" Kies fuzzy file finder
function! Kies()
  let selection = system('bash -c "(git ls-files -co --exclude-standard || ls) 2>/dev/null  | kies -p \"open:\""')
  if empty(selection) | echo "Canceled" | return | end

  exec ":e " . selection
endfunction

nnoremap <C-P> :call Kies()<CR>
