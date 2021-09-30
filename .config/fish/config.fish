# https://fishshell.com/docs/current/tutorial.html
# https://github.com/jorgebucaran/awesome-fish

function add_to_path
    if not test -d $argv[1]
        return
    end
    for path in $PATH
        if test $argv[1] = $path
            return
        end
    end
    if test "$argv[2]" = prepend
        set -x PATH $argv[1] $PATH
    else
        set -x PATH $PATH $argv[1]
    end
end

# https://github.com/fish-shell/fish-shell/issues/2639
function remove_from_path
    if set -l ind (contains -i -- $argv[1] $PATH)
        set -e PATH[$ind]
    end
end

remove_from_path ~/bin
add_to_path ~/bin prepend
add_to_path ~/.cargo/bin prepend

add_to_path /opt/homebrew/bin
add_to_path ~/.cask/bin
add_to_path ~/build/depot_tools
add_to_path ~/Library/Android/sdk/tools
add_to_path ~/Library/Android/sdk/platform-tools
set -x GOPATH ~/go
add_to_path $GOPATH/bin
add_to_path /usr/local/Cellar/gettext/0.19.8.1/bin
add_to_path ~/.ebcli-virtual-env/executables
add_to_path ~/.poetry/bin
add_to_path /usr/local/sbin
add_to_path /usr/local/bin
set -x DENO_INSTALL ~/.deno
add_to_path $DENO_INSTALL/bin
add_to_path ~/miniconda3/bin

# tmuxinator / asdf junk
remove_from_path .
# put these in front by sourcing asdf
remove_from_path ~/.asdf/shims
remove_from_path ~/.asdf/bin
remove_from_path $GOPATH/bin

function fish-ssh-agent
    begin
        set -l bmalehorn_hostname (hostname)
        if test -f ~/.keychain/$bmalehorn_hostname-fish
            source ~/.keychain/$bmalehorn_hostname-fish
        end
    end
end

fish-ssh-agent

set -x LANG 'en_US.UTF-8'
set -x LC_ALL 'en_US.UTF-8'
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x HOMEBREW_GITHUB_API_TOKEN "$GITHUB_TOKEN"
set -x BRITE_VERIFY_API_TOKEN f1b4269e-56c4-46ee-8e07-c45714156981
set -x SLUGIFY_USES_TEXT_UNIDECODE yes
set -x OD_CURRENT_USER_EMAIL brian.malehorn@opendoor.com
set -x XDG_CONFIG_HOME $HOME/.config
set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x FZF_FIND_FILE_OPTS "--preview='bat --color=always --style=numbers {}' --height='99%' --preview-window=down:60% --bind='ctrl-space:toggle-preview' --multi"
set -x VAULT_ADDR 'https://vault.services.opendoor.com:8200'
set -x KERL_CONFIGURE_OPTIONS "--disable-debug --disable-silent-rules --without-javac --enable-shared-zlib --enable-dynamic-ssl-lib --enable-hipe --enable-sctp --enable-smp-support --enable-threads --enable-kernel-poll --enable-wx --enable-darwin-64bit --with-ssl=/usr/local/Cellar/openssl/1.0.2p"
set -x AWS_PROFILE od-eng
set -x GITHUB_TOKEN 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
# set -x GOROOT ~/go/src/github.com/golang/go
set -x DOCKER_SCAN_SUGGEST false
set -e GOROOT

set -e CURRENT_USER_EMAIL

# https://github.com/oh-my-fish/theme-bobthefish
set -g theme_newline_cursor yes
set -g theme_title_display_process yes
set -g theme_display_cmd_duration no
set -g theme_nerd_fonts yes
set -g theme_display_date no
set -g theme_display_ruby no
set -g hydro_color_pwd blue
set -g hydro_color_git green
set -g hydro_color_prompt cyan
set -g hydro_symbol_prompt "❱"
set -g fish_greeting

abbr -a yt yarn test
abbr -a ys yarn start
abbr -a yb yarn build
abbr -a yj yarn jest
abbr -a yg yarn generate
abbr -a yds yarn awl dev:start
abbr -a brs bin/rspec
abbr -a brt bin/rails test
abbr -a bss bin/spring stop
abbr -a brc bin/rails console
abbr -a -- - cd -
abbr -a dff git diff --no-index
abbr -a ec 'code ~/.config/fish/config.fish'
abbr -a sb 'source ~/.config/fish/config.fish'
abbr -a sa 'ssh-add -k ~/.ssh/id_rsa'
abbr -a pingt ping 8.8.8.8
abbr -a agu sudo apt update -y
abbr -a agg sudo apt upgrade -y
abbr -a agi sudo apt install -y
abbr -a agr sudo apt remove -y
abbr -a cdr ca reception
abbr -a cds ca seller
abbr -a cdj cd '~/go/src/github.com/opendoor-labs/code/js/'
abbr -a cdp cd '~/go/src/github.com/opendoor-labs/code/py/'
abbr -a cdc cd '~/go/src/github.com/opendoor-labs/code/'
abbr -a cdd cd ~/Dropbox/stow/dotfiles/
abbr -a cdo cd '~/open_listings'
abbr -a cdw cd '~/web'
abbr -a cdm cd '~/mobile'
abbr -a cd0 'cd (git rev-parse --show-toplevel)'
abbr -a sl ls
abbr -a ac ca
abbr -a klisten kafka-console-consumer --bootstrap-server localhost:9092 --topic sell.reception.seller_inputs --from-beginning
abbr -a dex docker run -it --entrypoint /bin/bash
abbr -a dexu docker run -it --entrypoint /bin/bash ubuntu
abbr -a agr sudo apt remove
abbr -a gls git ls-files .
abbr -a gc 'git add -A && git commit'
abbr -a gca 'git add -A && git commit --amend'
abbr -a git-glob 'git add -A && git commit --amend --no-edit'
abbr -a ga 'git merge-base origin/HEAD HEAD'
abbr -a fn 'fd -pFH'
abbr -a fa 'fd -pIFH'
abbr -a uniqc 'sort | uniq -c | sort -n'
abbr -a e code
abbr -a bi bundle install
abbr -a gr 'go run cmd/server/*.go'
abbr -a gyc 'gy && git checkout'
abbr -a gcy 'gy && git checkout'
abbr -a gp 'git push (git-pull-request-remote) --set-upstream (git-cb)'
abbr -a unfuck '/bin/rm -rf ~/go/src/github.com/opendoor-labs/code/go/vendor ~/go/src/github.com/opendoor-labs/code/go/.vendor-new'
abbr -a dc cd
abbr -a y yarn
abbr -a g git
abbr -a k kubectl
abbr -a gomon nodemon --watch . -e go --exec
abbr -a stime hyperfine
abbr -a ff 'find . -type f | sort'
abbr -a rubofix bin/rubocop --safe-auto-correct
abbr -a probe nc -w 1 -v -z

switch $__INTELLIJ_COMMAND_HISTFILE__
    case '*RubyMine*'
        set -x EDITOR 'mine -w'
    case '*GoLand*'
        set -x EDITOR 'goland -w'
    case '*WebStorm*'
        set -x EDITOR 'webstorm -w'
    case '*'
        set -x EDITOR 'code -w'
end

function code
    switch $__INTELLIJ_COMMAND_HISTFILE__
        case '*RubyMine*'
            mine $argv
        case '*GoLand*'
            goland $argv
        case '*WebStorm*'
            webstorm $argv
        case '*'
            command code $argv
    end
end

# rebase + push
function git-bloop
    set -l branch $argv[1]
    if test -z "$branch"
        set branch (git-cb)
    end
    gy
    git checkout $branch
    git rebase origin/HEAD
    git push (git-pull-request-remote) --set-upstream (git-cb) -f
end

function git-cb
    git symbolic-ref -q HEAD | string replace refs/heads/ ""
end

function bstow
    cd ~/Dropbox/stow
    ./stow.sh
end

function git-pull-request-remote
    if git remote | grep -q bmalehorn
        echo bmalehorn
        return
    end
    echo origin
end

function ls --wraps ls
    if type -q lsd
        lsd -A $argv
    else
        command ls $argv
    end
end

function cat --wraps cat
    if type -q bat
        bat --theme GitHub $argv
    else
        command cat $argv
    end
end

function s --wraps rg
    rg \
        --colors line:fg:yellow --colors line:style:bold \
        --colors path:fg:green --colors path:style:bold \
        --smart-case --max-columns 2000 --max-count 100 --hidden \
        --glob '!.git/' --glob '!.repo/' --glob '!.svn/' \
        $argv
end

function less
    command less -R -n $argv
end

function log_history --on-event fish_prompt
    set -l last_status $status
    set -l cmd (history -n 1)
    set -l err ''
    if test $last_status -ne 0
        set err " [$last_status]"
    end
    set -l dir (string replace --regex "^$HOME" '~' $PWD)
    echo (date '+%Y-%m-%d %H:%M:%S') $dir$err \$ "$cmd" >>~/.bashrc-log
end

function hist
    if [ "$argv[1]" ]
        if type -q rg
            /bin/cat ~/.bashrc-log | rg $argv
        else
            /bin/cat ~/.bashrc-log | grep $argv
        end
    else
        /bin/cat ~/.bashrc-log
    end
end

function hs
    set -l grep grep
    if type -q rg
        set grep rg
    end
    $grep $argv ~/.bashrc-log \
        | awk -F '$' '{ gsub(/^ +/, "", $2); print substr($2, 1, 1000) }' \
        | $grep $argv
end

function gaux --wraps grep
    ps aux | head -n 1
    env COLUMNS= ps aux | grep -v grep | grep -i $argv
end

function make --wraps make
    if type -q nproc
        command make -j(nproc) $argv
    else
        command make -j12 $argv
    end
end

function countforks
    set -l before (sh -c 'echo $$')
    eval $argv
    set -l after (sh -c 'echo $$')
    math $after - $before - 1
end

function forkit
    set -l times $argv[1]
    for i in (seq $times)
        /usr/bin/true
    end
end

function unique --wraps awk
    awk '!a[$0]++' $argv
end

function link-legacy
    cd ~/consumer/packages/legacy
    and yarn link
    and cd ~/web/app/assets
    and yarn link @opendoor/consumer-legacy
end

function git-v
    git-victim $argv | less
end

function bootup-init
    if [ (hostname) = sen ]
        if [ -f ~/Dropbox/code/python/thinkled.py ]
            mkdir -p ~/log/thinkled/
            sudo modprobe -r ec_sys
            sudo modprobe ec_sys write_support=1
            sudo ~/Dropbox/code/python/thinkled.py THINKPAD_I_X1 2>&1 | svlogd ~/log/thinkled/ &
            disown %1
        end
    end

    if [ (hostname) = sen ]
        if test -e ~/.Xmodmap
            fixx
        end
    end

    if type -q keychain
        keychain
    end
    fish-ssh-agent
    ssh-add -k ~/.ssh/id_rsa
end

function fixx
    setxkbmap -layout us
    xset r rate 200 40
    xmodmap ~/.Xmodmap
end

function 2mp4
    set -l OUT $argv[2]
    if test "$OUT" = ''
        set OUT (string replace .mov .mp4 $argv[1])
    end
    ffmpeg -i $argv[1] -c:v copy -c:a copy $OUT
end

function desk2mp4
    for f in ~/Desktop/*.mov
        set -l OUT (string replace .mov .mp4 $f)
        if test -f "$OUT"
            continue
        end
        2mp4 $f
    end
end

# https://superuser.com/questions/556029/how-do-i-convert-a-video-to-gif-using-ffmpeg-with-reasonable-quality
function 2gif
    # set -l SCALE 720:-1
    set -l SCALE '-1:-1'
    # if [ (uname) = Darwin ]
    #     # undo 2x pixels
    #     set SCALE 'iw*0.5:-1'
    # end
    set -l IN $argv[1]
    set -l OUT (string replace --regex '\.[^.]*$' .gif $IN)
    ffmpeg -i $IN -map_metadata -1 -vf "fps=15,scale=$SCALE:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 $OUT
end

function desk2gif
    for f in ~/Desktop/*.mov
        set -l OUT (string replace .mov .gif $f)
        if test -f "$OUT"
            continue
        end
        2gif $f
    end
end


function 2webp
    # set -l SCALE 720:-1
    # if [ (uname) = Darwin ]
    #     # undo 2x pixels
    #     set SCALE 'iw*0.5:-1'
    # end
    set -l IN $argv[1]
    # set -l SCALE '-1:-1'
    # set -l OUTPUT_QUALITY 50
    set -l SCALE $argv[2]
    set -l OUTPUT_QUALITY $argv[3]
    echo string replace --regex '\.[^.]*$' _"$SCALE"_"$OUTPUT_QUALITY".webp $IN
    set -l OUT (string replace --regex '\.[^.]*$' _"$SCALE"_"$OUTPUT_QUALITY".webp $IN)
    # echo "@@ OUT" $OUT
    ffmpeg -i $IN \
        -vf "fps=15,scale=$SCALE:flags=lanczos" \
        -vcodec libwebp -lossless 0 -compression_level 6 \
        -q:v $OUTPUT_QUALITY -loop 0 \
        -preset picture -an -vsync 0 $OUT
end

function fzc
    git checkout (git branch -a | fzf | string replace '*' '' | string trim)
end

function fzt
    git checkout (git tag | fzf --tac)
end

function fze
    code (fzf --preview 'bat --color always {}')
end

function fzh
    set -l CMD (fzf --tac < ~/.bashrc-log | string replace --regex '^.* \$ ' '' | string trim)
    echo $CMD
    eval $CMD
end

# git default branch, usually `master` or `main`
function gd
    git symbolic-ref refs/remotes/origin/HEAD | string replace refs/remotes/origin/ ''
end

function gy
    set -l default_branch (gd)
    git checkout $default_branch
    git pull --ff-only -p
    git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D
    # delete ancestor commits
    for refname in (git for-each-ref --format='%(refname)' refs/heads/)
        set -l branch (string replace 'refs/heads/' '' $refname)
        if [ $branch = $default_branch ]
            continue
        end
        set -l common (git merge-base $default_branch $branch)
        if [ "$common" = (git rev-parse $branch) ]
            git branch -D $branch
        end
    end
end

# https://stackoverflow.com/a/4421674
function port
    lsof -nP -i4TCP:$argv[1] | grep LISTEN
end

function turqoise_hello
    set_color '#00AFAF'
    echo hello
    set_color '#000000'
end

function portkill
    port $argv[1]
    set -l pids (port $argv[1] | awk '{ print $2 }')
    if [ $pids ]
        echo "killing $pids"
        kill -9 $pids
    else
        echo "no processes on port $argv[1]"
    end
end

function e
    command code $argv
end

function copy
    if type -q pbcopy
        pbcopy
    else if type -q xclip
        xclip -selection clipboard
    end
end

function rm --wraps rm
    trash $argv
end

function uuid
    python -c 'import uuid; print(uuid.uuid4())'
end

function da
    if [ "$INSIDE_DTACH" ]
        echo "Already in session [$INSIDE_DTACH], exitting"
        return 1
    end

    mkdir -p ~/.dtach
    env INSIDE_DTACH="$argv[1]" dtach -z -A ~/.dtach/"$argv[1]" -r none "$SHELL"
end

function sesh
    mkdir -p ~/.sesh
    if [ "$SESH" ]
        echo "Already inside session \"$SESH\", exitting"
        return 1
    end
    set -l SESH 1
    if [ "$argv[1]" ]
        set SESH "$argv[1]"
    end
    touch ~/.sesh/$SESH.script
    /bin/cat ~/.sesh/$SESH.script
    env SESH=$SESH dtach -A ~/.sesh/$SESH.dtach -r winch script -a ~/.sesh/$SESH.script
end

# https://github.com/fish-shell/fish-shell/issues/5707#issuecomment-467331991
function auto_source --on-event fish_preexec -d 'auto source config.fish if gets modified!'
    set -l fish_config_file ~/.config/fish/config.fish
    if test -f $XDG_CONFIG_HOME/fish/config.fish
        set fish_config_file $XDG_CONFIG_HOME/fish/config.fish
    end

    set -l fish_config_time_new (date -r $fish_config_file)
    if ! set -q FISH_CONFIG_TIME
        set -g FISH_CONFIG_TIME $fish_config_time_new
    else if test "$FISH_CONFIG_TIME" != "$fish_config_time_new"
        set FISH_CONFIG_TIME $fish_config_time_new
        source $fish_config_file
    end
end
auto_source

function baddies
    shellcheck ( git ls-files | grep '\.sh$'; git grep -l '#! */usr/bin/env bash\|#! */bin/bash' | sort | uniq ) | awk '/^In/ {print $2}' | sort | uniq
end

function hyperinator
    cd
    command hyperinator $argv
end

function ya
    yarn bootstrap $argv &&
        yarn build $argv &&
        yarn start $argv
end

function ybs
    yarn bootstrap $argv &&
        yarn start $argv
end

function upsert
    mkdir -p (dirname $argv[1])
    touch $argv[1]
    code $argv[1]
end

function clopen
    cd
    git clone $argv[1]
    set -l path (string replace --regex '^.*/([^/.]*)(\.git)?$' '$1' $argv[1])
    code $path
end

function bk
    $argv >/dev/null 2>/dev/null &
    disown
end

function dora
    cd ~/dora
    bk npm start
    cd -
end

function deadowners
    set patterns (cat .github/CODEOWNERS CODEOWNERS 2>/dev/null | grep -v '^#' | awk '/./ {print $1}')
    for pattern in $patterns
        echo (git ls-files (pwd)/$pattern | wc -l) $pattern
    end | sort -nr
end

function serv
    cat ~/web/.env \
        $GOPATH/src/github.com/opendoor-labs/code/js/packages/reception-bff/.env* \
        $GOPATH/src/github.com/opendoor-labs/code/js/packages/athena/.env.local
end

function flush-abbrs
    for abbreviation in (abbr | sed -e 's/^abbr.* -- \([a-zA-Z_-]*\).*/\1/g')
        abbr -e $abbreviation
    end
end

function tilde
    string replace ~ '~' $argv[1]
end

function ca
    if test -z $argv[1]
        set dir (git rev-parse --show-toplevel)
        echo cd (tilde $dir)
        cd $dir
        return
    end

    set options \
        $argv[1] \
        $GOPATH/src/github.com/opendoor-labs/code/js/packages/$argv[1] \
        $GOPATH/src/github.com/opendoor-labs/code/go/services/$argv[1] \
        $GOPATH/src/github.com/opendoor-labs/code/go/lib/$argv[1] \
        $GOPATH/src/github.com/opendoor-labs/code/py/projects/$argv[1] \
        $GOPATH/src/github.com/opendoor-labs/code/py/lib/$argv[1] \
        $GOPATH/src/github.com/opendoor-labs/code/ex/services/$argv[1] \
        $GOPATH/src/github.com/opendoor-labs/$argv[1] \
        (git rev-parse --show-toplevel)/$argv[1] \
        ~/$argv[1]
    for option in $options
        if [ -d $option ]
            echo cd (tilde $option)
            cd $option
            return
        end
    end
    echo "Could not find '$argv[1]' as these directories:"
    echo
    for option in $options
        echo "    $option"
    end
    echo
end

function co
    ca $argv
    code .
end

function cleanup
    cd

    df | head -2

    yarn cache clean

    command rm -rf ~/miniconda3/
    command rm -rf ~/web/tmp/*
    command rm -rf ~/web/log/*
    command rm -rf ~/Caches/*

    yes | trash -e || true

    yes | docker image prune -a || true

    df | head -2
end

function touchp
    mkdir -p (dirname "$argv[1]")
    touch "$argv[1]"
end

function git-migrate
    set -l source (git rev-parse --abbrev-ref HEAD)
    set -l dest (git rev-parse $argv[1])
    git checkout $dest && git branch -f $source $dest && git checkout $source
end

function kubeexec
    set -l app laser-api
    if ! test -z $argv[1]
        set app $argv[1]
    end
    set -l namespace production
    if ! test -z $argv[2]
        set namespace $argv[2]
    end
    set -l instance (kubectl -n $namespace get pods | grep -Eo "$app-[^ ]+" | head -n 1)
    echo "instance $instance"
    kubectl --namespace=$namespace exec -it $instance /od-secret-env-vol/od-secret-env bash
end

[ -f ~/.config/fish/hostname-$hostname.fish ] && source ~/.config/fish/hostname-$hostname.fish
[ -f ~/.config/fish/secrets.fish ] && source ~/.config/fish/secrets.fish

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/brianmalehorn/go/src/github.com/opendoor-labs/code/js/packages/cloudflare-worker/node_modules/tabtab/.completions/serverless.fish ]
and source /Users/brianmalehorn/go/src/github.com/opendoor-labs/code/js/packages/cloudflare-worker/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/brianmalehorn/go/src/github.com/opendoor-labs/code/js/packages/cloudflare-worker/node_modules/tabtab/.completions/sls.fish ]
and source /Users/brianmalehorn/go/src/github.com/opendoor-labs/code/js/packages/cloudflare-worker/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/brianmalehorn/go/src/github.com/opendoor-labs/code/js/packages/cloudflare-worker/node_modules/tabtab/.completions/slss.fish ]
and source /Users/brianmalehorn/go/src/github.com/opendoor-labs/code/js/packages/cloudflare-worker/node_modules/tabtab/.completions/slss.fish

[ -f /Users/brianmalehorn/go/src/github.com/opendoor-labs/code/scripts/infra/sourced_on_shell_load.fish ] && source '/Users/brianmalehorn/go/src/github.com/opendoor-labs/code/scripts/infra/sourced_on_shell_load.fish'

[ -f /opt/homebrew/opt/asdf/asdf.fish ] && source /opt/homebrew/opt/asdf/asdf.fish
[ -f /usr/local/opt/asdf/asdf.fish ] && source /usr/local/opt/asdf/asdf.fish

######### od shell tooling #########
# these lines added by `code/scripts/development/maybe_install_od_shell_tooling.sh`
set OD_CODE_ROOT "/Users/brianmalehorn/go/src/github.com/opendoor-labs/code"
set OD_TOOL_SOURCE_SCRIPT "$OD_CODE_ROOT/scripts/infra/sourced_on_shell_load.fish"
[ -f "$OD_TOOL_SOURCE_SCRIPT" ] && source "$OD_TOOL_SOURCE_SCRIPT"
######### end of od shell tooling #########

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# [ -f /Users/brianmalehorn/opt/anaconda3/bin/conda ] && eval /Users/brianmalehorn/opt/anaconda3/bin/conda "shell.fish" hook $argv | source
# # <<< conda initialize <<<

export KOPS_STATE_STORE=s3://kops-opendoor-k8s-cluster-state-store

direnv hook fish | source
