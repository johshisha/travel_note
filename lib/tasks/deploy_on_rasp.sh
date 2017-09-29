git pull origin master
docker-compose -f docker-compose-raspi.yml down
docker-compose -f docker-compose-raspi.yml run --rm -v "$PWD":/var/www/travel_note server /bin/bash -c "rake assets:precompile && rake db:migrate && rm ./tmp/pids/server.pid"
docker-compose -f docker-compose-raspi.yml up -d
