install(){
  set -e
  echo "Creating install directory"
  mkdir /usr/local/share/aptstore
  echo "Copying files"
  cp *.sh /usr/local/share/aptstore
  echo "Removing unneeded files"
  rm /usr/local/share/aptstore/install.sh
  echo "Creating executable binary"
  echo "cd /usr/local/share/aptstore; bash main.sh" > /usr/local/bin/aptstore
  chmod 755 /usr/local/share/aptstore
  echo "Creating uninstall binary"
  echo "echo \"Uninstalling Aptstore...\"; rm -r /usr/local/share/aptstore; rm /usr/local/bin/aptstore; rm /usr/local/bin/aptstore-uninst" > /usr/local/bin/aptstore-uninst
  echo "Aptstore can now be called by running \"aptstore\" in the terminal. To uninstall Aptstore, run \"aptstore-uninst\"
}


echo "Checking for root priviliges..."
if [ $UID = 0 ]
  echo "You are root. Continuing..."
  install
else
  echo "You are not root. Aborting..."
  exit
fi
