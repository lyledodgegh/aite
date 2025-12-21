vm_name=dev-"$(echo $RANDOM | tr '[0-9]' '[a-z]')"

multipass launch --name "$vm_name" --cpus $(nproc) -d 80g

multipass transfer ./wsl-devtools-install.sh "$vm_name":/home/ubuntu/wsl-devtools-install.sh
multipass exec "$vm_name" -- bash /home/ubuntu/wsl-devtools-install.sh