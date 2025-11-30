apt-get update
apt-get install apache2 -y

echo '<!DOCTYPE html>
<html>
<head>
    <title>Palantir</title>
</head>
<body>
    <h1>Welcome to Palantir</h1>
</body>
</html>' > /var/www/html/index.html

service apache2 start