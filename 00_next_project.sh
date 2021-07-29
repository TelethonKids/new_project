#!/bin/bash

# Clone TelethonKids/new_project GitHub repository and set-up for
# `00_Next project.R`

echo "Project name:"
read project_name

echo "Do you wish to initiate a Full or Basic project template (enter corresponding number)?"
select yn in Full Basic
do
    case $yn in
        Full)
            git -c http.sslVerify=false clone --branch main https://github.com/TelethonKids/new_project $project_name
            cd $project_name
            mv sample_.gitignore .gitignore
            rm -rf .git
            git init
            break;;
        Basic)
            git -c http.sslVerify=false clone --branch basic https://github.com/TelethonKids/new_project $project_name
            cd $project_name
            rm .gitignore
            rm -rf .git
            break;;
    esac
done
