source_dir = ./dir
destination_dir =  ./backupdir 
interval_secs = 3
max_backups = 3

all:    prerequisit	
	./backupd.sh $(source_dir) $(destination_dir) $(interval_secs) $(max_backups) 
	
prerequisit:	
	@mkdir -p $(destination_dir);	
