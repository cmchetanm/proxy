lease follow the steps to setup:

1.) Install ruby version 2.5.1

2.) Install rails version 5.2.3

3.) Install postgresql

5.) On the project root directory:

  a.) Run `bundle install`

  b.) Run `bundle exec figaro install`

  c.) Set ENV variable in `config/application.yml`
      PROXY_SERVICE_DATABASE_HOST
	  PROXY_SERVICE_DATABASE_USERNAME
	  PROXY_SERVICE_DATABASE_PASSWORD
	  FORWARD_TO_URL

  d.) Run `rake db:create`

  e.) run `rake db:migrate`

  f.) run `rspec spec`

6.) run `rails s`
