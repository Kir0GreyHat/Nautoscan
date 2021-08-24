# Nautoscan 🤖💉
Nautoscan is an automation nuclei scanner. It's only for NotSoSecretSec and everyone are prohibited to change the content of the files except with the permission.

## Requirements
- `https://github.com/MikeWent/notify-send-telegram` - To notify the activities
- `https://github.com/projectdiscovery/nuclei` - Nuclei
- `https://github.com/projectdiscovery/subfinder` - To find the subdomains

## Installation

1. First step
- Clone `https://github.com/MikeWent/notify-send-telegram.git`
- cd notify-send-telegram
- pip3 install -r requirements.txt
- ./notify-send-telegram.py -t [Nautoscan_bot_token] -r [Your_user_id] 'HAIII'
- Add system-wide symlink (optional): `sudo ln -s $(pwd)/notify-send-telegram.py /usr/local/bin/nst`

- Nautoscanbot_token:``` 1961479136:AAFHy8KR9Hzvhkl-hQr-BAfp1vyip8MwJXc```
- Get your_user_id: [@get_id_bot](https://t.me/get_id_bot)

- You will get 'HAIII' message from Nautoscan bot. Token and user id will be saved to config file. 
- If you want to override them, just add option `--save`.
- Credit to [@MikeWent](https://github.com/MikeWent/notify-send-telegram)

2. Second step
- Git clone `https://github.com/Kir0GreyHat/Nautoscan.git` 
- cd Nautoscan
- ./nautoscan.sh

## Examples

- ./nautoscan.sh
- enter your target and separated each one by space
- You will get notify by Nauto bot in Telegram

## About

- Credit to [@MikeWent](https://github.com/MikeWent/notify-send-telegram)
- Credit to [@InfosecDaily](https://www.youtube.com/channel/UCanyJdu7tbWxxwirWQhKwjQ)
- Made with 💚 by [@Kir0GreyHat](https://github.com/Kir0GreyHat)

