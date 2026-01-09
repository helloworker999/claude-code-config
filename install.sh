#!/bin/bash

# Claude Code Configuration Installer
# This script copies custom slash commands and prompts to ~/.claude/

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Target directory
CLAUDE_DIR="$HOME/.claude"

echo -e "${BLUE}=== Claude Code Configuration Installer ===${NC}"
echo ""

# Create target directories if they don't exist
echo -e "${YELLOW}Creating target directories...${NC}"
mkdir -p "$CLAUDE_DIR/commands"
mkdir -p "$CLAUDE_DIR/prompt"

# Copy commands
echo -e "${YELLOW}Copying custom slash commands...${NC}"
if [ -d "$SCRIPT_DIR/commands" ]; then
    # Find all files in commands directory (excluding README.md)
    find "$SCRIPT_DIR/commands" -type f ! -name "README.md" | while read -r file; do
        filename=$(basename "$file")
        cp "$file" "$CLAUDE_DIR/commands/"
        echo -e "${GREEN}✓${NC} Copied command: $filename"
    done
else
    echo -e "${YELLOW}⚠${NC} No commands directory found"
fi

# Copy prompts (preserving directory structure)
echo -e "${YELLOW}Copying prompt files...${NC}"
if [ -d "$SCRIPT_DIR/prompt" ]; then
    # Copy entire prompt directory structure
    cp -r "$SCRIPT_DIR/prompt/"* "$CLAUDE_DIR/prompt/" 2>/dev/null || true

    # List what was copied
    find "$SCRIPT_DIR/prompt" -type f | while read -r file; do
        relative_path="${file#$SCRIPT_DIR/prompt/}"
        echo -e "${GREEN}✓${NC} Copied prompt: $relative_path"
    done
else
    echo -e "${YELLOW}⚠${NC} No prompt directory found"
fi

echo ""
echo -e "${GREEN}=== Installation Complete ===${NC}"
echo -e "Commands installed to: ${BLUE}$CLAUDE_DIR/commands/${NC}"
echo -e "Prompts installed to: ${BLUE}$CLAUDE_DIR/prompt/${NC}"
echo ""
echo -e "${YELLOW}Note:${NC} Restart Claude Code or reload your configuration to use the new commands."
