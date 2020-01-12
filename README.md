# Le GAG - Site

This meta project aims at simplifying the setup of a full Le GAG's website.


## Installation

````shell script
PROJECT_ROOT=$(pwd)
git clone --recurse-submodules git@github.com:Le-GAG/site.git
ddev start

# API setup
echo '{ "super_admin_token": "" }' > api/core/config/__api.json
ddev dc install
ddev directus install:config -n db -u db -p db -h db
ddev directus install:database -k _
ddev directus install:install -k _ -e <email@address> -p password

# APP setup
echo '/.env' >> $PROJECT_ROOT/.git/modules/app/info/exclude
cd $PROJECT_ROOT/app
echo 'API_URL=https://le-gag.ddev.site' > .env
npm install
npm run serve
````


## Running
````shell script
PROJECT_ROOT=$(pwd)
ddev start
cd $PROJECT_ROOT/app
npm run dev --open
````

## Deployment
