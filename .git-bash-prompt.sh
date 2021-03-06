
git_check_changes ()
{
git status | sed -n '
1h
1!H
$ {
  g
  s/Untracked files:/\?/
  s/Changed but not updated/\*/
  s/Changes to be committed/\^/
  s/[^\^\?*]//g
  p
}
'
}

git_remote_changes ()
{
local branch="$(git branch | grep '^*' | sed -e 's/^\* *//')"
git log --pretty=oneline $branch...origin/$branch 2>/dev/null | sed -n '
1h
1!H
$ {
  g
  s/.*/>/g
p
}
'
}

# Lars: a copy of the __git_ps1 script for git-completion.bash modified to add
# ? - untracked files
# * - changed but not added to commit
# ^ - changed and to be committed
git_bash_prompt ()
{
        local g="$(git rev-parse --git-dir 2>/dev/null)"
        if [ -n "$g" ]; then
                local r
                local b
                if [ -d "$g/../.dotest" ]
                then
                        if test -f "$g/../.dotest/rebasing"
                        then
                                r="|REBASE"
                        elif test -f "$g/../.dotest/applying"
                        then
                                r="|AM"
                        else
                                r="|AM/REBASE"
                        fi
                        b="$(git symbolic-ref HEAD 2>/dev/null)"
                elif [ -f "$g/.dotest-merge/interactive" ]
                then
                        r="|REBASE-i"
                        b="$(cat "$g/.dotest-merge/head-name")"
                elif [ -d "$g/.dotest-merge" ]
                then
                        r="|REBASE-m"
                        b="$(cat "$g/.dotest-merge/head-name")"
                elif [ -f "$g/MERGE_HEAD" ]
                then
                        r="|MERGING"
                        b="$(git symbolic-ref HEAD 2>/dev/null)"
                else
                        if [ -f "$g/BISECT_LOG" ]
                        then
                                r="|BISECTING"
                        fi
                        if ! b="$(git symbolic-ref HEAD 2>/dev/null)"
                        then
                                if ! b="$(git describe --exact-match HEAD 2>/dev/null)"
                                then
                                        b="$(cut -c1-7 "$g/HEAD")..."
                                fi
                        fi
                fi

                #if [ -n "$1" ]; then
                #        printf "$1" "${b##refs/heads/}$r"
                #else
                        printf "(%s$(git_check_changes)$(git_remote_changes))" "${b##refs/heads/}$r"
                #fi
        fi
}
# \h:\W \u\$
PS1='[\u@\h]:\w\e[0;33;49m\]$(git_bash_prompt)\[\e[0;0m\]$ '
