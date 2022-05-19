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
}

# git add & commit
function ac (){
	commitMsg="$*"
	if [[ "$commitMsg" == "" ]] ; then
		commitMsg="patch"
	fi

	git add -A
	git commit -m "$commitMsg"
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
alias root='r=$(git rev-parse --git-dir) && r=$(cd "$r" && pwd)/ && cd "${r%%/.git/*}"'

# open GitHub repo
alias gh="open \$(git remote -v | grep git@github.com | grep fetch | head -n1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/https:\/\//' -e 's/\.git//' );"
alias ghi="open \$(git remote -v | grep git@github.com | grep fetch | head -n1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/https:\/\//' -e 's/\.git//' )/issues;"

function clone(){
	git clone "$*"
	# shellcheck disable=SC2012
	cd "$(ls -1 -t | head -n1)" || return

	# if it's an Obsidian plugin
	if grep -q "obsidian" package.json &> /dev/null ; then
		npm i
		open -R "main.ts"
	fi
}

function sclone(){
	git clone --depth=1 "$*"
	# shellcheck disable=SC2012
	cd "$(ls -1 -t | head -n1)" || return

	# if it's an Obsidian plugin
	if grep -q "obsidian" package.json &> /dev/null ; then
		npm i
		open -R "main.ts"
		npm run dev
	fi
}

function nuke {
	SSH_REMOTE=$(git remote -v | head -n1 | cut -d" " -f1 | cut -d$'	' -f2)

	# go to git repo root
	r=$(git rev-parse --git-dir) && r=$(cd "$r" && pwd)/ && cd "${r%%/.git/*}"
	LOCAL_REPO=$(pwd)
	cd ..

	rm -rf "$LOCAL_REPO"
	echo "Local repo removed."

	git clone "$SSH_REMOTE"
	cd "$LOCAL_REPO" || return 1
}

# runs a release scripts placed at the git root
function rel(){
	# shellcheck disable=SC2164
	r=$(git rev-parse --git-dir) && r=$(cd "$r" && pwd)/ && cd "${r%%/.git/*}"
	if [[ -f .release.sh ]] ; then
		zsh .release.sh "$*"
	else
		echo "No '.release.sh' found."
	fi
}

# view older versions
# https://stackoverflow.com/questions/1964142/how-can-i-list-all-the-different-versions-of-a-file-and-diff-them-also/32849134#32849134
function allversions () {
	for commit in $(git log --pretty=format:%h "$1")
	do
		file_path="$1"
		path_no_ext="${file_path%.*}"
		ext="${file_path##*.}"

		padindex=$(printf %03d "$index")
		out="$path_no_ext.$padindex.$commit.$ext"
		log="$out.logmsg"

		echo "saving version $index to file $out for commit $commit"
		echo "*******************************************************" > "$log"
		git log -1 --pretty=format:"%s%nAuthored by %an at %ai%n%n%b%n" "$commit" >> "$log"
		echo "*******************************************************" >> "$log"
		git show "$commit:./$file_path" > "$out"
		(( index++ )) || true
	done
}

