! Name: Vicky Mohammad
! Email: mohammav@uoguelph.ca
! Description: Spigot in Fortran

program main
    ! Declare variables for spigot function
    implicit none
    integer :: length=0, nines=0, predigit=0
    integer :: numOfDec = 1000
    integer :: q, x, i, k, j
    integer, dimension(0: 3333) :: array
    Character (len = 9999) :: input, result

    ! Open file to write data to a text file
    open(1, file = 'fortran_output.txt', status = 'new')

    ! Define the length of the array
    length = (10 * numOfDec/3) + 1
    do i = 0, 2000
        array(i) = 2
    end do
    
    ! Loop and each decimals to the string
    ! to be ablee to print as PI.
    do j = 1, 1000
        q = 0

        ! For loop each until the i is zero
        i = length
        do i = length, 1
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
            write(1, *) predigit+1
            do k = 0, nines
                write(1, *) 0
            end do
            predigit = 0
            nines = 0
        else
            write(1, *) predigit
            predigit = q
            if (nines /= 0) then
                do k = 0, nines
                    write(1, *) 9
                end do
                nines = 0
            end if 
        end if
    end do

    ! write the final result and close the file 
    write(1, *) predigit, "\n"
    close(1)
end program main