# MEGSO_Tracker

## Introduction ##

Our team has been tasked with creating a web application for the Mechanical Engineering Graduate Student Organization (MEGSO) at 
Texas A&M University. This application will allow MEGSO student members to sign up for events, as well as enable the organization officers keep track of members' attendance and award points based on the events atteneded. In addition, our web app functions as an alumni tracker, where MEGSO officers can see detailed information about the past MEGSO members that held office in the organization. Alumni will be tracked mainly through basic information such as graduation year, current company, current job position held, and occupation. 


## Requirements ##

This code has been run and tested on:

* Ruby - 3.0.2p107
* Rails - 6.1.4.1
* Ruby Gems - Listed in `Gemfile`
* PostgreSQL - 13.3 
* Nodejs - v16.9.1
* Yarn - 1.22.11


## External Deps  ##

* Docker - Download latest version at https://www.docker.com/products/docker-desktop
* Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
* Git - Download latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

## Installation ##

Download this code repository by using git:

 `git clone https://github.com/austinptran/MEGSO-Tracker.git`


## Tests ##

An RSpec test suite is available and can be ran using:

  `rspec spec/`

## Execute Code ##

Run the following code in Powershell if using windows or the terminal using Linux/Mac

  `cd MEGSO-Tracker`

  `docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`
  
  `if in windows replace '$(pwd)' with '${PWD}'`

  `cd rails_app`

Install the app

  `bundle install && rails webpacker:install && rails db:create && rails db:migrate`

Run the app
  `rails server --binding=0.0.0.0`

The application can be seen using a browser and navigating to http://localhost:3000/

## Environmental Variables/Files ##

There is currently one environment variable that needs to be configured. It can be set manually in the `config/local_env.yml` for local development, but for other environments, one should configure this variable in Heroku deployment config variables.

* GMAIL_USERNAME

## Deployment ##

Setup a Heroku account: https://signup.heroku.com/

From the heroku dashboard, click the `New` button in the top right of your app list and select `Create New Pipline`

Name the pipeline, and connect the respective git repo to the pipline. Be sure to click the `Create Pipeline` button

Our application does not need any extra options, so select `Enable Review Apps` right away

Click `New app` under review apps, and link whatever your test branch from your repo is

We also need to create an app for staging, so under staging app, select `Create new app` and link your main branch from your repo

Now once your pipeline has built the apps, select `Open app` to open the app

With the staging app, if you would like to move the app to production, click the two up and down arrows and select `Move to production`

And now your application is setup and in production mode!


## CI/CD ##

For continuous development, we set up Heroku to automatically deploy our apps when their respective github branches are updated.

  `Review app: revised_app_test branch`

  `Production app: main branch`

For continuous integration, we set up a Github action via workflows to run our specs, security checks, linter, etc. after every push or pull-request. This allows us to automatically ensure that our code is working as intended.

## Support ##

Admins looking for support should first look at the application help page.
Users looking for help seek out assistance from the customer.
