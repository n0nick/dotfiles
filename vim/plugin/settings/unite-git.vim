let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.git = {}
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ tig',
        \'!tig'],
    \['▷ git status       (Fugitive)',
        \'Gstatus'],
    \['▷ git diff         (Fugitive)',
        \'Gdiff'],
    \['▷ git commit       (Fugitive)',
        \'Gcommit'],
    \['▷ git blame        (Fugitive)',
        \'Gblame'],
    \['▷ git stage        (Fugitive)',
        \'Gwrite'],
    \['▷ git checkout     (Fugitive)',
        \'Gread'],
    \['▷ git rm           (Fugitive)',
        \'Gremove'],
    \['▷ git mv           (Fugitive)',
        \'exe "Gmove " input("destination: ")'],
    \['▷ git push         (Fugitive, output to buffer)',
        \'Git! push'],
    \['▷ git pull         (Fugitive, output to buffer)',
        \'Git! pull'],
    \['▷ git prompt       (Fugitive, output to buffer)',
        \'exe "Git! " input("git command: ")'],
    \['▷ git cd           (Fugitive)',
        \'Gcd'],
    \]

nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=git -start-insert menu:git<cr>
