# Check for all hidden starting modules and processes.
pstree -a -u -p | grep .* 
