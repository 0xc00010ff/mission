install:
	@echo "Installing mission..."
	@chmod +x mission
	@mkdir -p /usr/local/bin
	@cp mission /usr/local/bin
	@echo "Done! Mission is now installed."

uninstall:
	@echo "Uninstalling mission..."
	@rm -f /usr/local/bin/mission
	@echo "Done! Mission has been removed."
