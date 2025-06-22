#!/bin/bash

# Prompt for MySQL root password
echo "Enter MySQL root password:"
read -s MYSQL_PWD

# Prompt for geogame_user password
echo "Enter password for new MySQL user 'geogame_user':"
read -s DB_PASS

# Set up variables
DB_NAME="geogame"
DB_USER="geogame_user"
SQL_DUMP="./geogame.sql"

# Create DB and user
mysql -u root -p"$MYSQL_PWD" <<EOF
CREATE DATABASE IF NOT EXISTS \`$DB_NAME\` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

# Import schema and data
echo "Importing schema and data from $SQL_DUMP..."
mysql -u root -p"$MYSQL_PWD" "$DB_NAME" <"$SQL_DUMP"

echo "✅ Database setup complete."
