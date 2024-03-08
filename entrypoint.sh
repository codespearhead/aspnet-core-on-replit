# Check for existing project directory (excluding hidden ones)
VISIBLE_DIR=$(find . -type d -not -path '*/\.*' | wc -l)

# If only one project directory exists:
if [[ $VISIBLE_DIR -eq 1 ]]
then
    read -p 'Project name: ' PROJECT_NAME
    echo $PROJECT_NAME > project_name.replit
    dotnet new webapp -o $PROJECT_NAME --no-https
    dotnet new gitignore
    echo "$PROJECT_NAME was created"
else
    # Retrieve project name from file (assuming the first line)
    PROJECT_NAME=$(head -n 1 project_name.replit)
    dotnet watch --project $PROJECT_NAME run --urls=http://0.0.0.0:8080
fi
