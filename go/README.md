<script>
const whereTo = new URLSearchParams(window.location.search).get('to');
switch(whereTo)
{
    case 'azure-aks':
    window.location = 'https://www.microsoft.com/';
    break;

    default:
    window.location = 'https://azureintheenterprise.com/';
    break;
}
</script>