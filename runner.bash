# Check if any visible directory exists in working directory
VISIBLE_DIR=$(find . -type d -not -path '*/\.*' | wc -l)
if [[ $VISIBLE_DIR -eq 1 ]]
then
  read -p 'Project name: ' NAME
  echo $NAME > project_name.replit
  dotnet new webapp -o $NAME --no-https
	dotnet new gitignore
	echo "$NAME was created"
else
  # Retrieve the name of the solution
  NAME=$(head -n 1 project_name.replit)
	dotnet watch --project $NAME run --urls=http://0.0.0.0:8080
fi
