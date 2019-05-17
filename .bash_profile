#export ANDROID_HOME="/Users/jacob/Library/Android/sdk"
#export PATH=~/.composer/vendor/bin/:/Applications/MAMP/bin/php/php5.6.2/bin:/Applications/MAMP/bin/php/php5.4.34/bin:/usr/local/mongodb/bin:/usr/local/bin/php-cx-fixer:$ANDROID_HOME/platform-tools:$PATH

export PATH=~/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

shup() {
    cat ~/.bash_bootstrap | ssh $1 "[[ -f .bash_profile ]] && f=.bash_profile || f=.profile && cat >> \$f"
}

#/Library/LaunchDaemons is where to find startup stuffs

eval "`npm completion`"

#alias cds='cd ~/Sites/'
alias cdd='cd ~/Desktop/ && ll'
alias cdn='cd ~/Notes && ll'
alias cn='code ~/Notes/notes.md'

cds() {
   cd ~/Sites/$1
}

alias cdstar='cd ~/.config/StardewValley/Saves/'
alias cdds='cd /Users/jacob/Documents/Klei/DoNotStarveTogether/client_save'

alias npm-bootstrap='npm i -g eslint eslint-config-brian eslint-plugin-html eslint-plugin-vue vue-eslint-parser'

alias vimba="[[ -f ~/.bash_profile ]] && vim ~/.bash_profile || vim ~/.profile"
alias cba="[[ -f ~/.bash_profile ]] && code ~/.bash_profile || code ~/.profile"
alias vimbb="vim ~/.bash_bootstrap"
alias cbb="code ~/.bash_bootstrap"
alias vimhosts="sudo vim /etc/hosts"
alias codehosts="sudo code /etc/hosts"
alias vimssh='vim ~/.ssh/config'
alias ll='ls -lha'
alias count='ls |  wc -l'
alias md='ll | grep \.md'
# Example of colors in terminal
#alias mds='echo -e "\n\x1B[34mDesktop\n\x1B[0m" && ll ~/Desktop | grep \.md && echo -e "\n\x1B[36mSites\n\x1B[0m" && ll ~/Sites | grep \.md && echo -e "\n\x1B[32mJacob\n\x1B[0m" && ll ~/ | grep \.md'
alias mds='ll ~/Notes | grep .md'

lg() {
     ll | grep $1
}

alias search='lg'

alias pbcopy='pbcopy || xclip -selection clipboard'
alias pbpaste='pbpaste || xclip -selection clipboard -o'

alias rba='. ~/.bash_profile'
alias caffeinate="echo 'caffeinate hack...' && pmset noidle"

githubclone() {
    git clone git@github.com:limeandcoconut/$1.git $2 
}

clonedot() {
    githubclone $1 .
}

tag() {
    git tag -a v$1 -m $2
}

vtag() {
    tag $1 $1
}

release() {
    vtag $1
    git push origin v$1
    git push origin master
}

alias clone="githubclone"

alias dev="npm run dev"

alias down="docker-compose down"
alias up="docker-compose up"
alias dup="docker-compose up -d"

run() {
    docker-compose run $1
}

alias dot="cp -a ~/Sites/dotfiles/. ."

alias npmls='npm ls --depth=0'
alias please='sudo $(history -p \!\!)'
alias mip='ipconfig getifaddr en0 | pbcopy && ipconfig getifaddr en0'

nm() {
    ./node_modules/.bin/$1
}

#export PS1="iMac:\w▲ "
export PS1="mac:\w👾 "

getdevtoollink() {
    #while read line; do
        #echo "This is a line : $line"
    #done < "./ecosystem.json"

    #if [ -z "$1" ]; then
        #echo "here"
        #NN=$(pwd | grep -o [^\/]*$)
    #else
        #NN=${1/ /-}
    #fi
    PN=$(sed -n 's/^.*\"name\" *: *\"\(.*\)\".*$/\1/p' ecosystem.json)
    NN=${PN/ /-}
    echo $NN
    tail -n 20 ~/.pm2/logs/$NN-error.log | grep -o chrome-devtools.*node$ | pbcopy
}

alias devtool=getdevtoollink



# OLD ALIASES

#alias ar='sudo apachectl restart'
#alias rstop='sudo apachectl stop'
#alias rstart='sudo apachectl start'
#alias watch='sass --watch scss:css --sourcemap=none'
alias caffeinate="echo 'caffeinate hack...' && pmset noidle"

#alias sshdev='ssh devadmin@southernoregonupholstery.com'
#alias sshret='ssh root@104.131.133.198'
#alias sshmean='ssh root@159.203.242.176'
#alias sshkamp='ssh root@104.131.131.209'
#alias sshsnap='ssh web@snapbeta.com'
#alias sshdev='ssh ec2-user@52.39.77.137 -i ~/ec2windows.pem'
#alias sshtbot='ssh admin@54.68.229.170 -i ~/tbot.pem'

#rf() {
#    echo -e $'Are you sure you want to delete \e[31m' $(realpath $1) $'\e[0m?'
#
#    select yn in "Yes" "No"; do
#        case $yn in
#            Yes ) rm -rf $1; break;;
#            No ) echo "Good call..."; break;;
#        esac
#    done
#
#}

#export PS1="MacbookPro: :\w ${NAMES[(((RANDOM % ${#NAMES[@]})))]}$ "


#pidportfunction() {
#    PID=sudo lsof -t -i :$1
#    echo $PID
#    sudo kill -9 $PID
#}

#alias pidport=pidportfunction


