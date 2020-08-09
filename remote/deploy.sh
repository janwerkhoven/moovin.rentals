#!/usr/bin/env bash

set -e
set -o pipefail

user=bot
admin=jw
host=sydney.floatplane.dev
domain=moovin.rentals

echo "----------"
echo "Deploying:"
echo $domain
echo $user@$host
echo "----------"

(
  set -x
  scp -i ~/.ssh/$user@$host remote/deploy-remote.sh $admin@$host:~/
  ssh -i ~/.ssh/$user@$host -t $admin@$host "~/deploy-remote.sh $domain; rm -f ~/deploy-remote.sh"
)
