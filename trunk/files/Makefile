DIRS = bin cfg pages servers

install:
	@for DIR in $(DIRS); do (echo $$DIR ; cd $$DIR ; make install); done;

clean:
	@for DIR in $(DIRS); do (echo $$DIR ; cd $$DIR ; make clean); done;

uninstall:
	@for DIR in $(DIRS); do (echo $$DIR ; cd $$DIR ; make uninstall); done;
