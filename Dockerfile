#
# docker tag bjoernr/mediacccde:latest bjoernr/mediacccde:old; docker build -t bjoernr/mediacccde . && docker rmi bjoernr/mediacccde:old
#
FROM ruby:2.3.0
RUN apt-get update -qq && apt-get install -y git sqlite3 nodejs redis-server
RUN mkdir /opt/media
WORKDIR /opt/media
EXPOSE 3000
RUN git clone https://github.com/voc/media.ccc.de.git .

#ADD Gemfile /opt/media/Gemfile
#ADD Gemfile.lock /opt/media/Gemfile.lock
RUN bundle install
RUN ./bin/setup && rake db:migrate && rake db:fixtures:load
ADD ./start.sh /opt/media/start.sh
CMD /opt/media/start.sh
#rails s -b 0.0.0.0
#CMD ["rails", "server", "-b", "0.0.0.0"]
#ADD . /myapp
