#!/bin/bash

users=("younes.bendhiab" "benoit.dessaint" "jugurtha.saada" "cedric.larsonnier")
users_created=()
users_not_created=()

for user in "${users[@]}"; do
  if id "$user" &>/dev/null; then
    if [ ! -d "/home/*/$user" ]; then
      mkhomedir_helper "$user"
      users_created+=("$user")
    fi
  else
    users_not_created+=("$user")
  fi
done

echo "Liste des utilisateurs créés: ${users_created[@]}"
echo "Liste des utilisateurs non créés (inexistant ou autre): ${users_not_created[@]}"
