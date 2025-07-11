#!/bin/bash

run_nmap_command() {
    local command="$1"
    echo -e "\nRunning command: $command"
    eval "$command"
}

print_menu() {
    echo "Welcome to the Nmap Command Runner!"
    echo "Available commands:"
    echo "1. Scan a single host"
    echo "2. Scan multiple hosts"
    echo "3. Scan a range of IPs"
    echo "4. Scan an entire subnet"
    echo "5. Scan using a specific port"
    echo "6. Scan all ports"
    echo "7. Aggressive scan"
    echo "8. Service version detection"
    echo "9. Operating system detection"
    echo "10. TCP SYN scan"
    echo "11. UDP scan"
    echo "12. Scan with a specific rate"
    echo "13. Save output to a file"
    echo "14. Exit"
}

while true; do
    print_menu
    read -p "Enter the number for the command you want to run: " choice

    case $choice in
        1)
            read -p "Enter the target IP: " target
            run_nmap_command "nmap $target"
            ;;
        2)
            read -p "Enter the target IPs separated by spaces: " targets
            run_nmap_command "nmap $targets"
            ;;
        3)
            read -p "Enter the IP range (e.g., 192.168.1.1-20): " ip_range
            run_nmap_command "nmap $ip_range"
            ;;
        4)
            read -p "Enter the subnet (e.g., 192.168.1.0/24): " subnet
            run_nmap_command "nmap $subnet"
            ;;
        5)
            read -p "Enter the target IP: " target
            read -p "Enter the port(s) (e.g., 80,443): " port
            run_nmap_command "nmap -p $port $target"
            ;;
        6)
            read -p "Enter the target IP: " target
            run_nmap_command "nmap -p- $target"
            ;;
        7)
            read -p "Enter the target IP: " target
            run_nmap_command "nmap -A $target"
            ;;
        8)
            read -p "Enter the target IP: " target
            run_nmap_command "nmap -sV $target"
            ;;
        9)
            read -p "Enter the target IP: " target
            run_nmap_command "nmap -O $target"
            ;;
        10)
            read -p "Enter the target IP: " target
            run_nmap_command "nmap -sS $target"
            ;;
        11)
            read -p "Enter the target IP: " target
            run_nmap_command "nmap -sU $target"
            ;;
        12)
            read -p "Enter the target IP: " target
            read -p "Enter the scan rate (e.g., 1s): " rate
            run_nmap_command "nmap --scan-delay $rate $target"
            ;;
        13)
            read -p "Enter the target IP: " target
            read -p "Enter the filename to save output (e.g., scan_results.txt): " filename
            run_nmap_command "nmap -oN $filename $target"
            ;;
        14)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid choice, please try again."
            ;;
    esac
done
