# Location of history file
HISTFILE=~/.zsh_history

# Number of commands to remember in memory
HISTSIZE=10000

# Number of commands to save to disk
SAVEHIST=10000

# History behavior options
setopt APPEND_HISTORY        # Append history instead of overwriting
setopt HIST_IGNORE_ALL_DUPS  # Remove older duplicate commands in history
setopt HIST_IGNORE_SPACE     # Don't record commands starting with a space
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks
setopt HIST_VERIFY           # Don't execute immediately when using history expansion
setopt INC_APPEND_HISTORY    # Write commands to history immediately
setopt SHARE_HISTORY         # Share history across terminals

# Optional: ignore some commands
HISTIGNORE="ls:bg:fg:history"
