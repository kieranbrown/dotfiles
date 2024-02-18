#!/usr/bin/env bash
set -euxo pipefail

# '-s false' is meant to hide the application when launched, but it doesn't work
# there is a potential solution on the macrumours forums suggesting LaunchAgent plists might work
# https://forums.macrumors.com/threads/login-items-hide.2366349/page-4

# loginitems -a '1Password' -s false # handled by the app itself
loginitems -a 'Alfred 5' -s false
# loginitems -a 'Docker' -s false # handled by the app itself
loginitems -a 'MacMediaKeyForwarder' -s false
loginitems -a 'Mail' -p '/System/Applications/Mail.app' -s false
loginitems -a 'MeetingBar' -s false
loginitems -a 'Microsoft Teams (work or school)' -s false
loginitems -a 'Slack' -s false
# loginitems -a 'Spotify' -s false # handled by the app itself
