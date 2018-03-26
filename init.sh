
cont_exist=`docker ps -aqf name=Inventory-app`
if [ -z $cont_exist ]; then
    if [ "$1" = "-p" ]; then
      run_flags="-d"
      echo "Prod"
    else
      echo "DEV"
      run_flags="-it"
    fi

    echo "Creating container with" $run_flags
    docker run \
      --name Inventory-app $run_flags \
      -p 8000:8000 -p 8080-8089:8080-8089 \
      -v ${PWD}:/app/src/github.com/adnanjt \
      -v ${PWD}/nginx.conf:/etc/nginx/nginx.conf \
else
  echo "Running cme container"
  docker start -i Inventory-app
  
fi
