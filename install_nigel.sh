#!/usr/bin/env bash

### Installs nigel and all of its dependencies to the proper directories (requires perl and basic bash knowledge)
### By Joey Marburger
### http://joseph-jam.es/nigel
### 06/21/2013
### v1.0 beta

echo "Installing nigel... aka awesome..."

### nigel core
cp nigel /usr/local/bin/
chmod u+x /usr/local/bin/nigel
chmod 775 /usr/local/bin/nigel
echo "Copying nigel to /usr/local/bin..."

### battery percentage script
cp battery /usr/local/bin/
chmod u+x /usr/local/bin/battery
chmod 775 /usr/local/bin/battery
echo "Copying battery to /usr/local/bin..."

### inbox count script
cp inbox-count /usr/local/bin/
chmod u+x /usr/local/bin/inbox-count
chmod 775 /usr/local/bin/inbox-count
echo "Copying inbox-count to /usr/local/bin..."

### yweather scripts and dependencies
cp -rf yweather-dir ~/bin/yweather-dir/
echo "Copying yweather-dir to ~/bin/..."
cp yweather /usr/local/bin/
chmod u+x /usr/local/bin/yweather
chmod 775 /usr/local/bin/yweather
echo "Copying yweather to /usr/local/bin..."

### Test
echo "Testing setup..."
sleep 1
### Update yweather
yweather --update
sleep 1

echo "Current temperature in $(yweather -lc), $(yweather -lr) is $(yweather -ct)."
echo "Battery power is $(/usr/local/bin/battery) percent."
echo "Inbox count is $(/usr/local/bin/inbox-count -u)."

sleep 1

### Install crontabs
# write out current crontab
crontab -l > mycron

echo "# Update yweather data package every 3 minutes"
echo "*/3 * * * * ~/bin/yweather-dir/./yweather.pl --update"
echo "# Run nigel every morning at 7 am"
echo "0 7 * * * /usr/local/bin/nigel"

#install new cron file
crontab mycron
rm mycron

### ALL DONE!
echo "Installation... Complete!"
echo "You can run nigel at anytime from the command line by simply typing nigel and hitting enter."
say -v Alex "Thank you. Your humble servant nigel."

exit 1