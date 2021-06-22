print:		##Printing the help messages
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

frontend:	##Installing frontend component
	@sh		components/frontend.sh

mongodb:	##Installing mongodb component
	@sh		components/mongodb.sh

catalogue:	##Installing catalogue component
	@sh 	components/catalogue.sh

redis:		##Installing redis component
	@sh		components/redis.sh

user:		##Installing user component
	@sh		components/user.sh

cart:		##Installing cart component
	@sh 	components/cart.sh

mysql:		##Installing mysql component
	@sh 	components/mysql.sh
shipping:	##Installing shipping component
	@sh 	components/shipping.sh
rabbitmq:	##Installing rabbitmq component
	@sh 	components/rabbitmq.sh
payment:	##Installing payment component
	@sh		components/payment.sh
