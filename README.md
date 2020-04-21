# Le GAG - Site

This meta project aims at simplifying the setup of a full Le GAG's website.


## Installation

````shell script
PROJECT_ROOT=$(pwd)
git clone --recurse-submodules git@github.com:Le-GAG/site.git .
ddev start

# API setup
echo '{ "super_admin_token": "" }' > api/core/config/__api.json
ddev dc install
ddev directus install:config -n db -u db -p db -h db
ddev directus install:database -k _
ddev directus install:install -k _ -e <email@address> -p <password>

# Extensions
cd $PROJECT_ROOT/api/extensions/orders-module
npm install
npm run build -- --no-source-maps --output=$PROJECT_ROOT/api/core/public/extensions/custom/modules/le-gag-orders
cp -r $PROJECT_ROOT/api/extensions/le-gag-hooks $PROJECT_ROOT/api/core/public/extensions/custom/hooks/LeGAG

# APP setup
echo '/.env' >> $PROJECT_ROOT/.git/modules/app/info/exclude
cd $PROJECT_ROOT/app
echo 'API_URL=https://le-gag.ddev.site' > .env
yarn
yarn serve
````


## Running

````shell script
PROJECT_ROOT=$(pwd)
ddev start
cd $PROJECT_ROOT/app
yarn serve --open
````

## Deployment
