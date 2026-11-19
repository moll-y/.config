#!/bin/sh
# Left part of the tmux bar (tmux.conf), like Neovim's statusline:
#   git-branch.sh DIR CMD   after the "TMUX" block:   main » claude [~/g/m/.ai]
#   the git branch (with the branch icon, dim like in Neovim; only in a git repo), a lime », the running
#   command in white, and the folder in [brackets]: absolute but short like fish, parents cut to their
#   first letter (two for hidden ones)
if cd "$1" 2>/dev/null && branch=$(git branch --show-current 2>/dev/null); then
	[ -n "$branch" ] || branch=$(git rev-parse --short HEAD 2>/dev/null)
	printf ' #[fg=#828bb8] %s #[fg=#9bd40b,bold]»#[nobold]' "$branch"
fi
printf ' #[fg=#ffffff]%s [%s]' "$2" "$(printf '%s' "$1" | sed -E "s#^$HOME#~#; s#(\\.?[^/])[^/]*/#\\1/#g")"
