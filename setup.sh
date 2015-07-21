directoryname="esljobs"
dbname="esljobsdb"
password="123456"
user="root"

if [ ! -d "$directoryname" ]; then
git clone http://github.com/Mashpy/esl_jobs.git
fi
cd esl_jobs
git checkout newsite
sudo apt-get install libxml2 libxslt-dev libxml2-dev build-essential libcurl3-dev libmysqlclient-dev libpq-dev imagemagick php5-imagick
bundle install
cd nbase
dbfilename="$(ls -1t | head -1)"
mysql --user="$user" --password="$password" -e "DROP DATABASE $dbname; CREATE DATABASE $dbname CHARACTER SET utf8 COLLATE utf8_general_ci;"
gunzip < $dbfilename | mysql --user="$user" --password="$password" $dbname
cd ..
cd config
echo -e "development:\n  adapter: mysql2 \n  encoding: utf8 \n  database: $dbname \n  pool: 5 \n  username: $user \n  password: \"$password\" \n" > database.yml
cd ..
rake db:migrate
rails s -p 4000