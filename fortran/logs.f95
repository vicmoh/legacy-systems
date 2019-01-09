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
  integer :: age;
  integer :: n = 0, m = 1
  integer :: secret_num = 7
  ! declarnig array
  integer, dimension(1:5) :: a1, a2, a3 !to call a1(x, y)
  real, dimension(1:50) :: array1
  integer, dimension(5, 5) :: a4
  integer, dimension(:), allocatable :: a5
  integer, dimension(1:9) :: a6 = (/ 1,2,3,4,5,6,7,8,9 /) !insert value
  integer, dimension(1:3, 1:3) :: a7 !2d array
  integer :: num_vals

  ! to check the size of the type
  print *, "----- size -----"
  print *, "Biggest Real ", huge(r_num1)
  print *, "Biggest int ", huge(i_num1)
  print *, "Smallest Real ", tiny(r_num1)
  ! return number of bytes
  print "(a4, i1)", "Int", kind(i_num1)
  print "(a5, i1)", "Real", kind(i_num1)
  print "(a7, i1)", "Double", kind(dbl_num)
  print "(a8, i1)", "Logical", kind(can_vote)

  ! printing in fortran, RiW
  print *, "----- number -----"
  print *, "A number ", 10
  print "(3i5)", 7, 6, 8
  print "(3i5)", 7, 6, 8 !five spaces between the digit
  ! float, RfW
  print "(2f8.5)", 3.1415, 1.234
  print "(/, 2a8)", "Name", "Age" !new lines
  ! print "(e10, 3)", 123.456, 

  ! condition
  print *, "----- condition -----"
  if((age >= 5) .and. (age <= 6 )) then
    print *, "Kindergaerten "
  else if((age >= 7) .and. (age <= 13)) then
    print *, "Middle school"
  else if((age >= 14) .and. (age <= 18)) then
    print *, "High school"
  else
    print *, "Stay school"
  end if
  
  ! boolean
  print *, "----- boolean -----"
  print *, .true. .or. .false.
  print *, .not. .true.
  print *, 5 /= 9
  print *, "a" < "b"

  ! print 
  print *, "----- input -----"
  print *, "What's your name "
  read *, f_name, l_name
  ! read input and store and then print
  print *, "Hello, ", trim(f_name), " ", trim(l_name)

  ! select case
  print *, "----- incase -----"
  select case (age)
  case (5)
    print *, "Kindergarten "
  case (6:13) ! range between 6 and 13
    print *, "Middle school"
  case(14, 15, 16, 17, 18)
    print *, "High school"
  case default 
    print *, "stay home"
  end select

  ! do loop
  ! do n = [start], [end at], [how much it increment]
  print *, "----- do loop -----"
  do n = 1, 10, 2
    print "(i1)", n
  end do

  ! do while loop
  print *, "----- do while loop -----"
  do while (m < 20)
    if(mod(m, 2) == 0) then
      print "(i1)", m
      m = m + 1
      cycle !same as continue
    end if
    m = m + 1
    if (m >= 10) then
      exit
    end if
  end do

  ! print array in range
  print *, "----- print in range -----"
  print "(3i2)", a1(1:3)
  print "(2i2)", a1(1:3:2)

  ! implied do loop
  do n = 1, 5
    print "(5i1)", (a4(n,m), m = 1, 5)
  end do

  ! allocate array
  print *, "Size of array?"
  read *, num_vals
  allocate(a5(1:num_vals))
  
  ! print allocate array
  print *, "----- print allocate array -----"
  do n = 1, num_vals
    a5(n) = n
    print "(i1)", a5(n)
  end do
  do n = 1, num_vals
    print "(i1)", a5(n)
  end do

  ! assign at once
  print *, "----- assign all at once -----"
  a2 = (/1,2,3,4,5/)
  print "(5i1)", (a2(m), m = 1, 6)
  ! reshape dimension to 3 by 3
  print *, "----- reshape an array -----"
  a7 = reshape(a6, (/ 3, 3 /))

  ! other neat stuff
  print *, "----- check if all are equal -----"
  print "(l1)", all(a1 == a2, 1)
  print *, "----- check if any is equal -----"
  print "(l1)", any(a1 == a2, 1)
  print *, "----- count the num that is the same ------"
  print "(l1)", count(a1 == a2, 1)
  print *, "----- max and min of array -----"
  print "(i1)", maxval(a1)
  print "(i1)", minval(a1)
  print *, product(a1)
  

  ! important
  print *, "----- implicit loop for array -----"
  do n = 1, 5
    print "(5i7)", (a2(m), m = 1, 5)
  end do
  
  ! print size of array
  print *, "----- print size of array -----"
  print "(i2)", size(a1)
  print "(i2)", size(a4)
  
  ! print number of dimension 
  print *, "----- number of dimension -----"
  print "(i2)", rank(a4)
  print *, "----- number of elements for x and y"
  print "(i2)", shape(a4)

  

  
end program fortrantut
