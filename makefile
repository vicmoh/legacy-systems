# ada
ada_compile:
	gcc -c ./ada/overview.adb

ada_make:
	gnatmake ./ada/overview.adb

# fortran
fortran: fortran_compile_log fortran_run

fortran_overview: fortran_compile_overview fortran_run

fortran_compile_overview:
	gfortran -Wall ./fortran/overview.f95

fortran_compile_log:
	gfortran -Wall ./fortran/logs.f95

fortran_run:
	./a.out

# github
git: git_add git_commit git_push

git_add:
	git add -A

git_commit:
	git commit -m "[AUTO]"

git_push:
	git push