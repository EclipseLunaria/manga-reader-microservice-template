# install node
npm install
# require project name
while [ -z "$project" ]
do
    read -p "Enter your project name: " project
    #ensure that project name is not empty and contains only lowercase letters and -
    if [[ ! $project =~ ^[a-z-]+$ ]]; then
        echo "Project name must contain only lowercase letters and -"
        project=""

    fi
    if [ -z "$project" ]; then
        echo "Project Name is Invalid"
    fi
done
echo "Project name is $project"
title=$(echo $project | sed -e 's/\b\(.\)/\u\1/g')
echo "Title: $title"    
sed -i "s/# {SERVICETILE}.*/# $title/" README.md
# get project description
read -p "Enter project description (default ''): " description

# get project author
read -p "Enter project author (default ''): " author

sed -i "s/\"author\": \".*\"/\"author\": \"$author\"/" package.json

# replace project description
sed -i "s/{DESCRIPTION}.*/$description/" README.md
sed -i "s/\"description\": \".*\"/\"description\": \"$description\"/" package.json

# select default port
read -p "Enter port number (default 6900): " port
# set default port
PORT=${port:-6900}
echo "PORT=$PORT"

# override package.json name
sed -i "s/\"name\": \".*\"/\"name\": \"$project\"/" package.json

# override README.md title
# Replace {SERVICETITLE} with project name with capotalized first letter
