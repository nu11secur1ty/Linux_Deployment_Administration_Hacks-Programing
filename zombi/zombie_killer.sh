#!/usr/bin/bash
# nu11secur1ty
# Colors for better display
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to find and display zombie processes
find_zombies() {
    echo -e "${BLUE}=== Searching for Zombie Processes ===${NC}"
    
    # Find all processes with status 'Z' and extract PID, PPID, and command
    zombie_list=$(ps -eo pid,ppid,stat,comm | awk '$3 ~ /Z/ {print $1, $2, $4}')
    
    if [ -z "$zombie_list" ]; then
        echo -e "${GREEN}No zombie processes found. System is clean.${NC}"
        return 1
    else
        echo -e "${YELLOW}Found zombies:${NC}"
        echo -e "${YELLOW}PID\tPPID\tCOMMAND${NC}"
        
        # Store in array to avoid sub-shell issues
        zombie_array=()
        while IFS= read -r line; do
            zombie_array+=("$line")
        done <<< "$zombie_list"
        
        for line in "${zombie_array[@]}"; do
            pid=$(echo "$line" | awk '{print $1}')
            ppid=$(echo "$line" | awk '{print $2}')
            cmd=$(echo "$line" | awk '{print $3}')
            echo -e "${RED}$pid${NC}\t$ppid\t$cmd"
        done
        return 0
    fi
}

# Function to attempt killing a zombie process through its parent
kill_zombie() {
    local zombie_pid=$1
    
    # First find the PPID of the zombie
    local ppid=$(ps -o ppid= -p $zombie_pid 2>/dev/null | tr -d ' ')
    
    if [ -z "$ppid" ]; then
        echo -e "${RED}Error: Process with PID $zombie_pid does not exist.${NC}"
        return 1
    fi
    
    echo -e "${YELLOW}Attempting to kill zombie process $zombie_pid (PPID: $ppid)...${NC}"
    
    # Send SIGCHLD to parent process to make it clean up the zombie
    if kill -s SIGCHLD $ppid 2>/dev/null; then
        echo -e "${GREEN}✓ Sent SIGCHLD signal to parent process $ppid.${NC}"
        echo -e "${GREEN}The zombie should now be removed from the system.${NC}"
        
        # Check if zombie disappeared after a moment
        sleep 1
        if ps -p $zombie_pid 2>/dev/null | grep -q 'Z'; then
            echo -e "${RED}! Zombie still exists. Trying alternative method...${NC}"
            # Alternative: Send SIGTERM to parent (more aggressive)
            if kill -s TERM $ppid 2>/dev/null; then
                echo -e "${YELLOW}Sent SIGTERM to parent process $ppid.${NC}"
                echo -e "${YELLOW}Note: This may also kill the parent process.${NC}"
                sleep 1
                if ps -p $zombie_pid 2>/dev/null; then
                    echo -e "${RED}Zombie still alive! Try killing the parent with: kill -9 $ppid${NC}"
                else
                    echo -e "${GREEN}✓ Zombie successfully removed!${NC}"
                fi
            else
                echo -e "${RED}Failed to kill parent. Try: kill -9 $ppid${NC}"
            fi
        else
            echo -e "${GREEN}✓ Zombie successfully removed!${NC}"
        fi
    else
        echo -e "${RED}✗ Failed to send signal. No permissions or process doesn't exist.${NC}"
        return 1
    fi
}

# Main menu
main_menu() {
    while true; do
        echo
        echo -e "${BLUE}━━━ ZOMBIE CONTROLLER ━━━${NC}"
        echo " 1. List all zombie processes"
        echo " 2. Kill a zombie process (by PID)"
        echo " 3. Exit"
        echo
        read -p "Choose option (1-3): " choice
        
        case $choice in
            1)
                find_zombies
                echo
                read -p "Press ENTER to continue..."
                ;;
            2)
                find_zombies
                if [ $? -eq 0 ]; then
                    echo
                    read -p "Enter PID of zombie to kill: " zombie_pid
                    if [[ $zombie_pid =~ ^[0-9]+$ ]]; then
                        kill_zombie $zombie_pid
                    else
                        echo -e "${RED}Invalid PID. Please enter a number.${NC}"
                    fi
                else
                    echo -e "${YELLOW}No zombies to kill.${NC}"
                fi
                echo
                read -p "Press ENTER to continue..."
                ;;
            3)
                echo -e "${GREEN}Exiting. Stay healthy!${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid option. Please choose 1, 2, or 3.${NC}"
                sleep 1
                ;;
        esac
    done
}

# Script startup
if [ "$EUID" -ne 0 ]; then 
    echo -e "${YELLOW}Warning: For best results, run the script with root privileges (sudo).${NC}"
    echo
fi

main_menu
