# commands to run aspire standalone dashboard

``` bash

#run the dashboard
docker run --rm -it -d -p 18888:18888 -p 4317:18889 --name aspire-dashboard mcr.microsoft.com/dotnet/aspire-dashboard:9.0

# get the login url/token
sudo docker logs aspire-dashboard | grep login

```