#!/usr/bin/env bash
# ┌──────────────────────────────────────────┐
# │ mission - one thing at a time            │
# └──────────────────────────────────────────┘

VERSION="1.0.0"
TODO_DIR="${HOME}/.config/mission"
TODO_FILE="${TODO_DIR}/$(basename $(pwd))"

# ANSI color codes for stylish output
CYAN='\033[0;36m'
BRIGHT_CYAN='\033[1;36m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
RESET='\033[0m'
DIM='\033[2m'

# Create the todo directory if it doesn't exist
mkdir -p "$TODO_DIR"

function show_help {
  echo -e "${BRIGHT_CYAN}┌────────────────────────────────────────┐${RESET}"
  echo -e "${BRIGHT_CYAN}│ mission${RESET} ${DIM}v${VERSION}${RESET}                          ${BRIGHT_CYAN}│${RESET}"
  echo -e "${BRIGHT_CYAN}│${RESET} A singular todo for multitaskers.      ${BRIGHT_CYAN}│${RESET}"
  echo -e "${BRIGHT_CYAN}└────────────────────────────────────────┘${RESET}"
  echo -e ""
  echo -e "${WHITE}USAGE:${RESET}"
  echo -e "  mission [your task]      ${DIM}Set your current mission${RESET}"
  echo -e "  mission                  ${DIM}Show your current mission${RESET}"
  echo -e "  mission complete         ${DIM}Complete your mission with option to commit${RESET}"
  echo -e "  mission clear            ${DIM}Clear your mission without completing${RESET}"
  echo -e "  mission commit           ${DIM}Commit your mission to git${RESET}"
  echo -e "  mission --help           ${DIM}Show this help message${RESET}"
}

function read_todo {
  if [ -f "$TODO_FILE" ]; then
    local todo=$(cat "$TODO_FILE")
    echo -e "\n${CYAN}◆  ${WHITE}${todo}${RESET}\n"
    return 0
  else
    return 1
  fi
}

function write_todo {
  echo "$*" > "$TODO_FILE"
  echo -e "\n${BRIGHT_CYAN}◇  ${WHITE}${*}${RESET}\n"
}

function remove_todo {
  if [ -f "$TODO_FILE" ]; then
    rm "$TODO_FILE"
  fi
}

function prompt_for_commit {
  local todo=$(cat "$TODO_FILE")
  echo -e "${WHITE}Completed mission: ${GREEN}${todo}${RESET}"
  echo -e "${WHITE}Commit this mission? [y/N]${RESET} "
  read -n 1 -s response
  echo ""
  
  case "$response" in
    y|Y|" ")
      do_commit "$todo"
      ;;
    *)
      echo -e "${GREEN}Mission completed!${RESET} ✓"
      ;;
  esac
}

function do_commit {
  echo -e "${CYAN}Committing to git...${RESET}"
  git commit -m "$*" && echo -e "${GREEN}Committed successfully!${RESET} ✓"
}

# Main logic
if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "help" ]; then
  show_help
  exit 0
fi

if [ "$1" = "complete" ]; then
  if read_todo; then
    local todo=$(cat "$TODO_FILE")
    echo -e "${GREEN}✓  Mission accomplished: ${WHITE}${todo}${RESET}"
    prompt_for_commit
  else
    echo -e "${DIM}No active mission to complete.${RESET}"
  fi
  remove_todo
  exit 0
fi

if [ "$1" = "clear" ] || [ "$1" = "cancel" ]; then
  if [ -f "$TODO_FILE" ]; then
    echo -e "${CYAN}Mission aborted.${RESET} ○"
    remove_todo
  else
    echo -e "${DIM}No active mission to clear.${RESET}"
  fi
  exit 0
fi

if [ "$1" = "commit" ]; then
  if [ -f "$TODO_FILE" ]; then
    todo=$(cat "$TODO_FILE")
    do_commit "$todo"
    remove_todo
  else
    echo -e "${DIM}No active mission to commit.${RESET}"
  fi
  exit 0
fi

# If there are arguments, set the todo
if [ $# -gt 0 ]; then
  write_todo "$*"
  exit 0
fi

# If no arguments and todo exists, show it
if read_todo; then
  exit 0
fi

# If we get here, show help
show_help
exit 0
