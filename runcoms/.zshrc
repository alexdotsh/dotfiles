# Thanks Sorin Ionescu
# https://github.com/sorin-ionescu/prezto

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  # shellcheck source="${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  # shellcheck disable=SC1091
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Switch between different JDK versions
jdk() {
  version=$1
  JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  export JAVA_HOME
  java -version

  # Can change version by running 
  # `jdk 13` in the terminal
}

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline

eval "$(dircolors ~/.dir_colors/dircolors.256dark)"
