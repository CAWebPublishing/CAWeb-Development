wplaunch:
	@echo "Launching CAWeb WordPress Instance..."
	docker-compose up -d

wpstop:
	@echo "Shutting Down CAWeb WordPress Instance..."
	docker-compose down -v --remove-orphans
 
wpclean: wpstop
	@echo "Removing docker containers, images, volumes..."
	docker system prune -af
	@echo "Cleanup Complete..."