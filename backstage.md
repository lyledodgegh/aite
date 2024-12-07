# Tips on getting Backstage up and running on WSL

[Creating your Backstage App](https://backstage.io/docs/getting-started/)

``` bash
sudo apt install make build-essential
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install 22
corepack enable
yarn set version stable
yarn install
#start - if you don't have docker installed yet
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
#end - if you don't have docker installed yet
cd ~
npx @backstage/create-app@latest
cd backstage # your app name
yarn dev
```
