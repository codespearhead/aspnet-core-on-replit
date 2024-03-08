# Check if any visible directory exists in the working directory
VISIBLE_DIR=$(find . -type d -not -path '*/\.*' | wc -l)
if [[ $VISIBLE_DIR -eq 1 ]]
then
    # Create a solution if there isn't
    read -p 'Project name: ' NAME
    echo $NAME > project_name.replit
    dotnet new webapp -o $NAME --no-https
    dotnet new gitignore
    echo "$NAME was created"
else
    # Retrieve its name and run it if there is
    NAME=$(head -n 1 project_name.replit)
    dotnet watch --project $NAME run --urls=http://0.0.0.0:8080
fi
