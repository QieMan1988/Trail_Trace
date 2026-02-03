# Testing Guide

This project uses the [GUT (Godot Unit Test)](https://github.com/bitwes/Gut) framework.

## Setup
1. Open Godot Editor.
2. Go to `AssetLib` tab.
3. Search for "GUT" and download/install it.
4. Enable the plugin in `Project Settings -> Plugins`.

## Running Tests
1. Open the "GUT" panel in the bottom dock.
2. Click "Run All".

## Directory Structure
- `unit/`: Isolated logic tests (managers, utils).
- `integration/`: Scene flow and system interaction tests.
