# mission

A minimalist todo manager for developers who context-switch between projects.

`mission` keeps track of the **one thing** you should be focusing on in your current project directory. It's a single-line todo list for multitaskers who need clarity in chaos.

## Why mission?

When you're juggling multiple projects, remembering where you left off in each is challenging. `mission` solves this by maintaining a separate todo for each directory, helping you quickly re-orient yourself when you return to a project.

## Installation

```bash
git clone https://github.com/yourusername/mission.git
cd mission
sudo make install
```

## Usage

```bash
# Set your current focus
mission implementing user profile picture upload

# Check what you're supposed to be doing
mission
◆  implementing user profile picture upload

# Mark as complete (with option to commit)
mission complete
✓  Mission accomplished: implementing user profile picture upload
Commit this mission? [y/N]

# Directly commit to git
mission commit
Committing to git...
Committed successfully! ✓

# Clear without completing
mission clear
Mission aborted. ○
```

## Features

- **Directory-scoped todos**: Each directory has its own mission
- **Git integration**: Easily commit your completed mission as a commit message
- **Universal compatibility**: Written in Bash for maximum compatibility
- **Minimal footprint**: Tiny script with no dependencies
- **Stylish interface**: Clean, modern terminal output

## License

MIT
