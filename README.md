# docker-quantica-mariadb

Dockerfile to build asfolcini/quantica-mariadb docker image.

How to build the docker image:</br>
<pre>
  docker build -t asfolcini/quantica-mariadb .
</pre>

 Run the created image with:</br>
<pre>
  docker run -d -p 3306:3306 -e MARIADB_ROOT_PASSWORD=quantica  asfolcini/quantica-mariadb  
</pre>
