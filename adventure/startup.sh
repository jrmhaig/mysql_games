#!/bin/bash

DATABASE=Adventure
CREATE_USER=root
CREATE_PASS=root_password
PLAY_USER=Fred
PLAY_PASS=secret
PROMPT="MySQL Text Adventure> "

mysql -u$CREATE_USER -p$CREATE_PASS $DATABASE < tables.sql
mysql -u$CREATE_USER -p$CREATE_PASS $DATABASE < procedures.sql

mysql -u$CREATE_USER -p$CREATE_PASS $DATABASE << PERMISSIONS
GRANT EXECUTE ON PROCEDURE $DATABASE.GIVE_TO TO '$PLAY_USER'@'localhost' IDENTIFIED BY '$PLAY_PASS';
GRANT EXECUTE ON PROCEDURE $DATABASE.GO TO '$PLAY_USER'@'localhost' IDENTIFIED BY '$PLAY_PASS';
GRANT EXECUTE ON PROCEDURE $DATABASE.INVENTORY TO '$PLAY_USER'@'localhost' IDENTIFIED BY '$PLAY_PASS';
GRANT EXECUTE ON PROCEDURE $DATABASE.LOOK_AROUND TO '$PLAY_USER'@'localhost' IDENTIFIED BY '$PLAY_PASS';
GRANT EXECUTE ON PROCEDURE $DATABASE.LOOK_AT TO '$PLAY_USER'@'localhost' IDENTIFIED BY '$PLAY_PASS';
GRANT EXECUTE ON PROCEDURE $DATABASE.PICK_UP TO '$PLAY_USER'@'localhost' IDENTIFIED BY '$PLAY_PASS';
GRANT EXECUTE ON PROCEDURE $DATABASE.PUT_DOWN TO '$PLAY_USER'@'localhost' IDENTIFIED BY '$PLAY_PASS';
GRANT EXECUTE ON PROCEDURE $DATABASE.SAY_TO TO '$PLAY_USER'@'localhost' IDENTIFIED BY '$PLAY_PASS';
GRANT EXECUTE ON PROCEDURE $DATABASE.UNLOCK_DOOR TO '$PLAY_USER'@'localhost' IDENTIFIED BY '$PLAY_PASS';
GRANT EXECUTE ON PROCEDURE $DATABASE.LOCK_DOOR TO '$PLAY_USER'@'localhost' IDENTIFIED BY '$PLAY_PASS';
GRANT EXECUTE ON PROCEDURE $DATABASE.HELP TO '$PLAY_USER'@'localhost' IDENTIFIED BY '$PLAY_PASS';
GRANT EXECUTE ON PROCEDURE $DATABASE.WAIT TO '$PLAY_USER'@'localhost' IDENTIFIED BY '$PLAY_PASS';
PERMISSIONS

echo
echo "A very simple adventure."
echo
echo "You are trapped in a house.  Find the way out."
echo
echo "To start, try:"
echo "  call help;"
echo "  call look_around;"
echo
echo "For commands with arguments:"
echo "  call go('North');"
echo
echo "To finish:"
echo "  quit"
echo

mysql -u$PLAY_USER -p$PLAY_PASS -s -t --prompt "$PROMPT" $DATABASE
