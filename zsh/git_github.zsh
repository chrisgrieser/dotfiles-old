# git add, commit & push
function acp (){
	commitMsg="$*"
	if [[ "$commitMsg" == "" ]] ; then
		commitMsg="patch"
	fi

	git add -A
	git commit -m "$commitMsg"
	git pull
	git push

	if [[ "$commitMsg" =~ "#" ]] ; then
		issueNo=$(echo "$commitMsg" | grep -Eo "#\d+" |cut -c 2-)
		repoURL=$(git remote -v | grep git@github.com | grep fetch | head -n1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/https:\/\//' -e 's/\.git//' )
		open -g "$repoURL"/issues/"$issueNo"
	fi
}

alias amend='git commit --amend'
alias commit="git commit -m"
alias pull="git pull"
alias push="git push"
alias ignored="git status --ignored"
alias status='git status --short'
alias checkout='git checkout'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# go to git root https://stackoverflow.com/a/38843585
alias .g='r=$(git rev-parse --git-dir) && r=$(cd "$r" && pwd)/ && cd "${r%%/.git/*}"'

# open GitHub repo
alias gh="open \$(git remote -v | grep git@github.com | grep fetch | head -n1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/https:\/\//' -e 's/\.git//' );"
alias ghi="open \$(git remote -v | grep git@github.com | grep fetch | head -n1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/https:\/\//' -e 's/\.git//' )/issues;"

function clone(){
	git clone "$*"
	# shellcheck disable=SC2012
	cd "$(ls -1 -t | head -n1)" || return

	# if it's an Obsidian plugin
	if grep -q "obsidian" package-lock.json ; then
		npm i
		open -R "main.ts"
		npm run dev
	fi
}

# runs a release scripts placed at the git root
function rel(){
	# shellcheck disable=SC2164
	r=$(git rev-parse --git-dir) && r=$(cd "$r" && pwd)/ && cd "${r%%/.git/*}"
	if [[ -f .release.sh ]] ; then
		zsh .release.sh
	else
		echo "No '.release.sh' found."
	fi
}
