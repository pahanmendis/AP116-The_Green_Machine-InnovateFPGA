import os

settings = {
    'host': os.environ.get('ACCOUNT_HOST', 'https://ap116.documents.azure.com:443/'),
    'master_key': os.environ.get('ACCOUNT_KEY', '0lMoABwNPMnD3RT1yIhMohFWHPUmQ2vitn1TM307rK1t5NXYacc1Ysvt81idiyp9dnUktC9m4hQz9eICx4IoJw=='),
    'database_id': os.environ.get('COSMOS_DATABASE', 'GreenMachine1'),
    'container_id': os.environ.get('COSMOS_CONTAINER', 'SensorData'),
}