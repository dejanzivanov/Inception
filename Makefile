ll:
	@sudo hostsed add 127.0.0.1 dzivanov.42.fr && echo "successfully added dzivanov.42.fr to /etc/hosts"
	sudo docker compose -f ./srcs/docker-compose.yml up 

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v
#	uncomment the following line to remove the images too
#	sudo docker system prune -a

fclean: clean
	@sudo ./srcs/requirements/tools/docker_clear.sh
	@sudo hostsed rm 127.0.0.1 dzivanov.42.fr && echo "successfully removed dzivanov.42.fr to /etc/hosts"
	@if [ -d "/home/dzivanov/data/wordpress" ]; then \
	sudo rm -rf /home/dzivanov/data/wordpress/* && \
	echo "successfully removed all contents from /home/dzivanov/data/wordpress/"; \
	fi;

	@if [ -d "/home/dzivanov/data/mariadb" ]; then \
	sudo rm -rf /home/dzivanov/data/mariadb/* && \
	echo "successfully removed all contents from /home/dzivanov/data/mariadb/"; \
	fi;
	@./srcs/requirements/tools/docker_clear.sh

re: fclean all

ls:
	sudo docker image ls
	sudo docker ps

.PHONY: all, clean, fclean, re, ls
