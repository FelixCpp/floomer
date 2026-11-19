# floomer

Zoomer Application written in Flutter.

## Getting Started

This project is a desktop utility app that lets you zoom into a screenshot of your current desktop.

## How it works

Pressing a shortcut immediately takes a screenshot of the current desktop and opens a borderless fullscreen window
containing it. Afterwards you can zoom in/out, pan around, activate a flashlight effect to show certain parts of the desktop to other people or draw shapes onto the image using your mouse.

## Shortcuts

Press `H` while floomer is open to see this list on screen. It also shows up on
its own for a few seconds after startup.

| Control | What it does |
| --- | --- |
| Scroll / Drag | Zoom and pan |
| `0` | Reset zoom, pan and mirroring |
| `F` | Toggle the flashlight |
| Shift + Scroll | Resize the light |
| `M` | Mirror at the cursor |
| Right-drag | Draw on the image |
| `Cmd` + `Z` | Undo the last stroke |
| `C` | Clear the drawing |
| `H` | Show or hide the shortcut list |
| `Esc` | Quit floomer |

## What is it good for?

It's more like a learning tool for me to get a closer look on how somewhat native-interops work in flutter. Besides that it's a good tool to share / highlight certain parts of your current desktop with other people
during a screen-sharing session
