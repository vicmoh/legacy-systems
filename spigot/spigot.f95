! Name: Vicky Mohammad
! Email: mohammav@uoguelph.ca
! Description: Spigot in Fortran

program main
    ! Declare variables for spigot function
    implicit none
    integer :: length=0, nines=0, predigit=0
    integer :: numOfDec = 1000
    integer :: q, x, i, k, j
    integer, dimension(0: 9999) :: array
    character (len = 9999) :: result = ""
    character (len = 256) :: input = ""

    ! input file
    print *, "Enter the file name for output: "
    read *, input

    ! Open file to write data to a text file
    open(1, file = input, status = 'new')

    ! Define the length of the array
    length = (10 * numOfDec/3) + 1
    do i = 0, length-1, 1
        array(i) = 2
    end do
    
    ! Loop and each decimals to the string
    ! to be ablee to print as PI.
    do j = 1, 1000
        q = 0

        ! For loop each until the i is zero
        do i = length, 1, -1
            x = 10 * array(i-1) + q*i;
            array(i-1) = mod(x, (2*i-1));
            q = x / (2*i-1);
        end do 

        ! Find the remainder of q from mod 10
		! then assign to the fist index.
        array(0) = mod(q, 10)
        q = q / 10

        ! If q is nine the counter the number of nine
		! else if it's 10 print the predigit plus 1 and so on.
        ! Basically find the next PI sequence and assign it to a string.
        if (q == 9) then
            nines = nines + 1
        else if (q == 10) then
            result = trim(result) // trim(convert(predigit+1))
            do k = 0, nines-1
                result = trim(result) // "0"
            end do
            predigit = 0
            nines = 0
        else
            result = trim(result) // trim(convert(predigit))
            predigit = q
            if (nines /= 0) then
                do k = 0, nines-1
                    result = trim(result) // "9"
                end do
                nines = 0
            end if 
        end if
    end do

    ! write the final result and close the file 
    write(1, '(a)') result
    close(1)

    !----------------------------------------------
    ! functions
    !----------------------------------------------

    contains

    ! Function that convert a single int into
    ! a string to be able to print
    function convert(val) result(result)
        implicit none
        Integer, intent(in) :: val 
        Character :: result
        if ( val == 0) then 
            result = "0"
        else if (val == 1) then
            result = "1"
        else if (val == 2) then
            result = "2"
        else if (val == 3) then
            result = "3"
        else if (val == 4) then
            result = "4"
        else if (val == 5) then
            result = "5"
        else if (val == 6) then
            result = "6"
        else if (val == 7) then
            result = "7"
        else if (val == 8) then
            result = "8"
        else
            result = "9"
        end if
    end function
end program main