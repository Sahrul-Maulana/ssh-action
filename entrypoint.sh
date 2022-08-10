#!/bin/sh

set -eu

msg() {
  echo -e "\e[1;32m$*\e[0m"
}

figlet Welcome
msg =============================================
msg =•••••••••••••••••Powered By••••••••••••••••=
msg =••••••••••••••••NFS-project™•••••••••••••••=
msg =============================================

SSHPATH="$HOME/.ssh"

if [ ! -d "$SSHPATH" ]
then
  mkdir "$SSHPATH"
fi

if [ ! -f "$SSHPATH/known_hosts" ]
then
  touch "$SSHPATH/known_hosts"
fi

echo "$INPUT_KEY" > "$SSHPATH/deploy_key"
chmod 700 "$SSHPATH"
chmod 600 "$SSHPATH/known_hosts"
chmod 600 "$SSHPATH/deploy_key"

echo "$INPUT_COMMAND" > $HOME/shell.sh
echo "exit \$?" >> $HOME/shell.sh
cat $HOME/shell.sh

echo 💥 Connecting to SSH 💥

if [ "$INPUT_PASS" = "" ]
then
  sh -c "ssh $INPUT_ARGS -i $KEYFILE -o StrictHostKeyChecking=no -p $INPUT_PORT ${INPUT_USER}@${INPUT_HOST} < $HOME/shell.sh"
else
  sh -c "sshpass -p "$INPUT_PASS" ssh $INPUT_ARGS -o StrictHostKeyChecking=no -p $INPUT_PORT ${INPUT_USER}@${INPUT_HOST} < $HOME/shell.sh"
fi

echo SSH execution Done ✅
figlet God Bay
msg =============================================
msg =•••••••••••••••••Powered By••••••••••••••••=
msg =••••••••••••••••NFS-project™•••••••••••••••=
msg =============================================
