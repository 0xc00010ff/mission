# mission

Do what you said you would.

`mission` keeps track of the **one thing** you should be focusing on in your current project directory. It's a single-line todo list for multitaskers who need clarity in chaos.

## Why mission?

If you're like me, you have a bunch of different projects that you're messing with at any given time. This is a simple tool that lets you create a single todo for each project directory, recall what you were doing, then mark it as complete, or commit the todo to git. You know TDD? It's like that, but for your brain. 

## Installation

```bash
git clone https://github.com/yourusername/mission.git
cd mission
make install
```

## Usage

### Set the mission
Recommendation: Use a title for the hypothetical commit that accomplishes the mission. 

```bash
> mission User can add widget to widgetlist

◇  User can add widget to widgetlist

```

### Check what you're supposed to be doing
```bash
> mission

◆ User can add widget to widgetlist

```

### Complete the mission

```bash
> mission complete

✓  Mission accomplished: User can add widget to widgetlist
Commit this mission? [Y/n]
```

###  Directly commit to git
```bash
> mission commit

Committing to git...
Committed successfully! ✓ User can add widget to widgetlist
```

### Clear without completing
```bash
> mission abort

Mission aborted: User can add widget to widgetlist

```

## Features

- **Directory-scoped todos**: Each directory has its own mission
- **Git integration**: Easily commit your completed mission as a commit message
- **Universal compatibility**: Written in Bash for maximum compatibility
- **Minimal footprint**: Tiny script with no dependencies
- **Stylish interface**: Clean, modern terminal output

## License

MIT

TODO: 
- When a mission is active, typing something besides the commands verifies that you're changing the mission
- Make the theme red/green like TDD
