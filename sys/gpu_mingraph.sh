#!/bin/bash

# Define the maximum utilization value (100%)
max_utilization=100

# Define the width of the graph
graph_width=60

# Define the length of the x-axis
x_length=100

# Define the y-axis range
y_min=0
y_max=100

# Check if the "tiny" argument was provided
if [[ "$1" == "tiny" ]]; then
    # Loop indefinitely
    while true; do
        # Use the nvidia-smi command to get GPU utilization values
        utilization=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader | awk '{ print $1 }')

        # Calculate the percentage utilization
        utilization_percent=$(echo "scale=2; $utilization / $max_utilization * 100" | bc)

        # Determine the color of the graph indicators
        if (($(echo "$utilization_percent >= 85" | bc -l))); then
            color='\e[31m' # Red
        else
            color='\e[32m' # Green
        fi

        # Create the ASCII graph with colored indicators
        graph=""
        for i in $(seq 1 10); do
            if (($(echo "$utilization_percent >= $((i * 10))" | bc -l))); then
                graph="${graph}${color}#"
            else
                graph="${graph}-"
            fi
        done

        # Reset the color after the graph indicators
        graph="${graph}\e[0m"

        # Print the graph and utilization value on the same line
        echo -en "\rGPU Utilization: ${utilization_percent}% ${graph}"

        # Wait for 1 second before updating the graph
        sleep 1
    done
else
    # Initialize the data array
    declare -a data

    # Loop indefinitely
    while true; do
        # Use the nvidia-smi command to get GPU utilization values
        utilization=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader | awk '{ print $1 }')

        # Calculate the percentage utilization
        utilization_percent=$(echo "scale=2; $utilization / $max_utilization * 100" | bc)

        # Add the utilization value to the data array
        data+=("$utilization_percent")

        # Truncate the data array to the specified length
        if [ ${#data[@]} -gt $x_length ]; then
            data=("${data[@]:1}")
        fi

        # Clear the terminal and print the plot
        clear
        printf "GPU Utilization\n"

        # Print the y-axis labels
        for y in $(seq $y_max -10 $y_min); do
            printf "%3d | " $y
            for ((i = 0; i < 10; i++)); do
                index=$((${#data[@]} - 1 - $i))
                if [ $index -ge 0 ] && (($(echo "${data[$index]} >= $y" | bc -l))); then
                    if (($(echo "${data[$index]} >= 80" | bc -l))); then
                        printf "\e[31m\u2588\e[0m"
                    else
                        printf "\e[32m\u2588\e[0m"
                    fi
                else
                    printf " "
                fi
            done
            printf "\n"
        done

        # Print the x-axis labels
        printf "    +"
        for ((i = 0; i < 10; i++)); do
            printf "-"
        done
        printf ">\n     "

        for ((i = 0; i < 10; i++)); do
            index=$((${#data[@]} - 1 - $i))
            if (($index % 10 == 0)); then
                printf "%-3d" $index
            else
                printf "   "
            fi
        done

        # Wait for 1 second before updating the plot
        sleep 1
    done
fi
