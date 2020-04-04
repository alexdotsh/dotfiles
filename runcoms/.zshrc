# Thanks Sorin Ionescu
# https://github.com/sorin-ionescu/prezto

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Switch between different JDK versions
jdk() {
  version=$1
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  java -version

  # Can change version by running 
  # `jdk 13` in the terminal
}
