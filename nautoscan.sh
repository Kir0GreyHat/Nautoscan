#!/usr/bin/env bash

echo "

███╗░░██╗░█████╗░██╗░░░██╗████████╗░█████╗░░██████╗░█████╗░░█████╗░███╗░░██╗
████╗░██║██╔══██╗██║░░░██║╚══██╔══╝██╔══██╗██╔════╝██╔══██╗██╔══██╗████╗░██║
██╔██╗██║███████║██║░░░██║░░░██║░░░██║░░██║╚█████╗░██║░░╚═╝███████║██╔██╗██║
██║╚████║██╔══██║██║░░░██║░░░██║░░░██║░░██║░╚═══██╗██║░░██╗██╔══██║██║╚████║
██║░╚███║██║░░██║╚██████╔╝░░░██║░░░╚█████╔╝██████╔╝╚█████╔╝██║░░██║██║░╚███║
╚═╝░░╚══╝╚═╝░░╚═╝░╚═════╝░░░░╚═╝░░░░╚════╝░╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝░░╚══╝

- Automatic nuclei scanner by K1r0GreyH4t@N3S
- Find me at : https://dragonforce.io/members/kir0greyh4t.9811/

";

nuclei --update-templates --silent

read -p "Enter domain names seperated by 'space' : " input
for i in ${input[@]}
do

echo "
.
.
.
.
scan started for $i
" | nst 'ALERT' "Scan started for $i"

mkdir $i 

subfinder -d $i | httpx >> $i/subdomains.txt | nst 'ALERT' "Finding subdomains.."

echo "subdomains saved at $i/subdomains.txt." | nst 'ALERT' "subdomains saved."

echo "Scan for CVES started." | nst 'ALERT' "Scan for CVES started..."
nuclei -l $i/subdomains.txt -t cves/ -o $i/cves.txt 
echo "scan for CVES completed." | nst 'ALERT' "Scan for CVES completed..."
echo "scan for default-logins started." | nst 'ALERT' "Scan for default-logins started..."
nuclei -l $i/subdomains.txt -t default-logins/ -o $i/default-logins.txt 
echo "scan for default-logins completed." | nst 'ALERT' "Scan for default-logins completed."
echo "scan for exposures started." | nst 'ALERT' "Scan for exposures started..."
nuclei -l $i/subdomains.txt -t exposures/ -o $i/exposures.txt
echo "scan for exposures completed." | nst 'ALERT' "Scan for exposures completed."
echo "scan for misconfiguration started." | nst 'ALERT' "Scan for misconfiguration started..."
nuclei -l $i/subdomains.txt -t misconfiguration/ -o $i/misconfiguration.txt 
echo "scan for misconfiguration completed" | nst 'ALERT' "Scan for misconfiguration completed."
echo "scan for takeovers started." | nst 'ALERT' "Scan for takeovers started..."
nuclei -l $i/subdomains.txt -t takeovers/ -o $i/takeovers.txt
echo "scan for takeovers completed." | nst 'ALERT' "Scan for takeovers completed."
echo "scan for vulnerabilities started." | nst 'ALERT' "Scan for vulnerabilities started..."
nuclei -l $i/subdomains.txt -t vulnerabilities/ -o $i/vulnerabilities.txt
echo "scan for vulnerabilities completed." | nst 'ALERT' "Scan for vulnerabilities completed."

echo "
.
.
.
Scan finished for $i
" | nst 'ALERT' "Scan finished for $i"
done

