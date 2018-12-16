! Vicky Mohammad
! syntax from https://www.youtube.com/watch?v=__2UgFNYgf8

program fortrantut
  ! force to declare all var
  ! in fortran when defining a var
  ! var is case insensitive
  ! put it at the top
  implicit none
  character*20 :: name
  character (len = 20) :: f_name, l_name
  real, parameter :: PI = 3.1415
  real :: r_num1 = 0.0, r_num2 = 0.0
  double precision :: dbl_num = 1.123456789012345
  integer :: i_num1 = 0, i_num2 = 0
  logical :: can_vote = .true.
  character (len = 10) :: month

  ! to check the size of the type
  print *, "Biggest Real ", huge(r_num1)
  print *, "Biggest int ", huge(i_num1)
  print *, "Smallest Real ", tiny(r_num1)
  ! return number of bytes
  print "(a4, i1)", "Int", kind(i_num1)
  print "(a5, i1)", "Real", kind(i_num1)
  print "(a7, i1)", "Double", kind(dbl_num)
  print "(a8, i1)", "Logical", kind(can_vote)

  ! printing in fortran, RiW
  print *, "A number ", 10
  print "(3i5)", 7, 6, 8
  print "(3i5)", 7, 6, 8 ! five spaces between the digit
  ! float, RfW
  print "(2f8.5)", 3.1415, 1.234
  print "(/, 2a8)", "Name", "Age" ! new lines
  ! print "(e10, 3)", 123.456, 


  ! print 
  print *, "What's your name "
  read *, f_name, l_name
  ! read input and store and then print
  print *, "Hello, ", trim(f_name), " ", trim(l_name)

end program fortrantut
