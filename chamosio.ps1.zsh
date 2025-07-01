# Use ANSI-C quoting so \e becomes ESC character
C_RESET=$'%{\e[0m%}'
C_MAIN=$'%{\e[1;38;5;45m%}'
C_EXIT=$'%{\e[0;38;5;208m%}'
C_USER_PWD=$'%{\e[1;38;5;240m%}'
C_PATH=$'%{\e[1;4;38;5;214m%}%~%{\e[0m%}'
C_DATE=$'%{\e[0;38;5;245m%}'
PIPE_HORIZONTAL='─'
PIPE_VERTICAL='│'
CORNER_TOP_LEFT='╭'
CORNER_TOP_RIGHT='╮'
CORNER_BOTTOM_LEFT='╰'
CORNER_BOTTOM_RIGHT='╯'
ARROW='┤'

PROMPT="${C_RESET}${C_MAIN}${CORNER_TOP_RIGHT} [${C_EXIT}%?${C_MAIN}] ${C_USER_PWD}%n ${C_PATH}
${C_MAIN}${PIPE_VERTICAL} ${C_DATE}$(date "+%d:%m:%Y %H:%M:%S.$(date +%N | cut -c1-4)")${C_RESET}
${C_MAIN}${CORNER_BOTTOM_LEFT}${PIPE_HORIZONTAL}${ARROW} ${C_RESET}"
