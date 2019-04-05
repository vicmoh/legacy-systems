#default

# A4
# c
spigot: fortran

fortran:
	gfortran -Wall ./spigot/spigot.f95
	./a.out
	
c:
	gcc -Wall -std=c11 ./spigot/spigot.c -o ./run	
	./run

python:
	python ./spigot/spigot.py

# ada
#ada: ada_gnat ada_run 

# ada_gnat:
# 	gnatmake -Wall ./ada/ackermann/ackermann.adb

# ada_run:
# 	./ackermann

# fortran
# fortran: fortran_compile_log fortran_run

# fortran_compile_log:
# 	gfortran -Wall ./fortran/logs.f95

# fortran_run:
# 	./a.out

# # cobol
# cob:
# 	cobc -x -free -Wall ./cobol/$(run).cob -o ./cobol/run
# 	./cobol/run

# github
git: git_add git_commit git_push

git_add:
	git add -A

git_commit:
	git commit -m "[AUTO]"

git_push:
	git push

git_pull:
	git pull
