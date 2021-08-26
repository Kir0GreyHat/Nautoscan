#!/usr/bin/env bash

echo "

███╗░░██╗░█████╗░██╗░░░██╗████████╗░█████╗░░██████╗░█████╗░░█████╗░███╗░░██╗
████╗░██║██╔══██╗██║░░░██║╚══██╔══╝██╔══██╗██╔════╝██╔══██╗██╔══██╗████╗░██║
██╔██╗██║███████║██║░░░██║░░░██║░░░██║░░██║╚█████╗░██║░░╚═╝███████║██╔██╗██║
██║╚████║██╔══██║██║░░░██║░░░██║░░░██║░░██║░╚═══██╗██║░░██╗██╔══██║██║╚████║
██║░╚███║██║░░██║╚██████╔╝░░░██║░░░╚█████╔╝██████╔╝╚█████╔╝██║░░██║██║░╚███║
╚═╝░░╚══╝╚═╝░░╚═╝░╚═════╝░░░░╚═╝░░░░╚════╝░╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝░░╚══╝

";

printf "\e[1;37m Automatic nuclei scanner by

\e[1;31m@K1r0GreyH4t\e[0m\n
\e[1;33m@lu21n\e[0m\n"

printf "\e[0;34m Find us at:\e[0m\n" 
printf "\e[1;37m https://dragonforce.io/members/kir0greyh4t.9811\e[0m\n"
printf "\e[1;37m https://dragonforce.io/members/lu21n.9494\e[0m\n"

nuclei --update-templates --silent

read -p "Enter file name : " input
while IFS= read -r i;
do

nst 'ALERT' "Scan started for $i"

mkdir $i 

 if subfinder -d $i | httpx >> $i/subdomains.txt | nst 'ALERT' "Finding subdomains.."
then
echo "subdomains saved at $i/subdomains.txt." | cat $i/subdomains.txt | nst "Found subdomains of $i" --stdin
fi

printf "\e[0m\e[1;33mNuclei is starting\e[0m\n"

sleep 4

echo "scan for CVES started." | nst 'ALERT' "Scan for CVES started..."
nuclei -l $i/subdomains.txt -t cves/ -o $i/cves.txt 
echo "scan for CVES completed." | cat $i/cves.txt | nst "CVES:$i" --stdin

echo "scan for default-logins started." | nst 'ALERT' "Scan for default-logins started..."
nuclei -l $i/subdomains.txt --silent -t default-logins/ -o $i/default-logins.txt 
echo "scan for default-logins completed." | cat $i/default-logins.txt | nst "default-logins:$i" --stdin

echo "scan for exposures started." | nst 'ALERT' "Scan for exposures started..."
nuclei -l $i/subdomains.txt --silent -t exposures/ -o $i/exposures.txt
echo "scan for exposures completed." | cat $i/exposures.txt | nst "exposures:$i" --stdin

echo "scan for misconfiguration started." | nst 'ALERT' "Scan for misconfiguration started..."
nuclei -l $i/subdomains.txt --silent -t misconfiguration/ -o $i/misconfiguration.txt 
echo "scan for misconfiguration completed" | cat $i/misconfiguration.txt | nst "misconfiguration:$i" --stdin

echo "scan for takeovers started." | nst 'ALERT' "Scan for takeovers started..."
nuclei -l $i/subdomains.txt --silent -t takeovers/ -o $i/takeovers.txt
echo "scan for takeovers completed." | cat $i/takeovers.txt | nst "takeovers:$i" --stdin

echo "scan for vulnerabilities started." | nst 'ALERT' "Scan for vulnerabilities started..."
nuclei -l $i/subdomains.txt --silent -t vulnerabilities/ -o $i/vulnerabilities.txt
echo "scan for vulnerabilities completed." | cat $i/vulnerabilities.txt | nst "vulnerabilities:$i" --stdin

printf "\e[0m\e[1;33m The scan for $i is finished.\e[0m\n" | nst "The scan for $i is finished."
done < "$input"
