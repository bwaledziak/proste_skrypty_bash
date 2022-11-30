#!/bin/bash
# Autor: Bolesław Walędziak

echo "Wyniki losowania:"

for (( i=0; i<=5; i++ )); do
    
    los[$i]=$(((RANDOM % 49) +1))

    konflikt=1

    while [[ $konflikt -eq 1 ]]; do
        
        konflikt=0
    
        for (( k=0; k<i; k++ )); do
            if [[ los[$k] -eq los[$i] ]]; then
                konflikt=1
            fi
        done
        
        if [[ $konflikt -eq 1 ]]; then
            los[$i]=$(((RANDOM % 49) +1))
        fi

    done
    
    echo -n "${los[i]} "
done

echo ""

exit 0
