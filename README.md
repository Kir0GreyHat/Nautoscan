# Nautoscan
Nautoscan is an automation nuclei scanner. It's only for NotSoSecretSec and everyone are prohibited to change the content of the files except with the permission.

## Requirements
- `https://github.com/MikeWent/notify-send-telegram` - To notify the activities
- `https://github.com/projectdiscovery/nuclei` - Nuclei

## Installation

1. First step
- Clone `https://github.com/MikeWent/notify-send-telegram.git`
- cd notify-send-telegram
- pip3 install -r requirements.txt
- ./notify-send-telegram.py -t [Nautoscan_bot_token] -r [Your_user_id] 'HAIII'
- Add system-wide symlink (optional): `sudo ln -s $(pwd)/notify-send-telegram.py /usr/local/bin/nst`

Nautoscanbot_token:``` 1961479136:AAFHy8KR9Hzvhkl-hQr-BAfp1vyip8MwJXc```
Get your_user_id: [@get_id_bot](https://t.me/get_id_bot)

- You will get 'HAIII' message from your bot. Token and user id will be saved to config file. If you want to override them, just add option `--save`.
Credit to [@MikeWent](https://github.com/MikeWent/notify-send-telegram)

2. Second step
- 
