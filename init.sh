
cont_exist=`docker ps -aqf name=Inventory-app`
if [ -z $cont_exist ]; then
    if [ "$1" = "-p" ]; then
      run_flags="-d"
      echo "Prod"
    else
      echo "DEV"
      run_flags="-it"
    fi

    echo "Creating container with" 
    docker run \
      --name Inventory-app  \
      -p 8000:8000 -p 8080-8089:8080-8089 \
      -v ${PWD}:/app/src/github.com/adnanjt \
else
  echo "Running cme container"
  docker start -i Inventory-app
  
fi
