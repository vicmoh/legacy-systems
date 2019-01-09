!@author: Vicky Mohammad
!@email: mohammav@uoguelph.ca

!----------------------------------------------
! main program
!----------------------------------------------

program main

! create struct
implicit none
real :: DS, DL, TL, KERF, V
real :: theResult

! get logo and calculate
call getLOGdata(DS, DL, TL, KERF, V)
call calcLOGjclark(DS, DL, TL, KERF, V)

! print volume result
print "(a30, f10.5)", "The volume is ", V

contains
    ! a function which reads the relevent log data 
    ! required by calcLOGjclark() and calclLOGvolume()
    ! from user
    subroutine getLOGdata(DS, DL, TL, KERF, V)
        implicit none
        real :: DS, DL, TL, KERF, V
        ! ask for log length
        print *, "LOG’S SCALING DIAMETER (INCHES): "
        read *, DS
        print *, "DIB AT LOG’S LARGE END (INCHES) (0.0 IF 1/2 INCH TAPER): "
        read *, DL
        print *, "TOTAL LOG LENGTH (FEET): "
        read *, TL
        print *, "KERF: "
        read *, KERF 
        ! assign to the struct
        V = 0.0
    end subroutine getLOGdata

    ! a function which calculates the volume of a log in
    ! cubic metres, using the data obtained by getLOGdata()
    function getLOGvolume(a1, a2, length) result(volume)
        implicit none
        real, intent(in) :: a1
        real, intent(in) :: a2
        real, intent(in) :: length
        real :: volume
        volume = ((a1 + a2) / 2) * length
    end function getLOGvolume

    ! a function which calculate the volume of a log in board
    ! feet, using the data obtained by getLOGdata()
    ! SUBROUTINE JCLARK (DS,DL,TL,KERF,V)
    subroutine calcLOGjclark(DS, DL, TL, KERF, V)
        ! assing param vars
        implicit none 
        real, intent(in) :: DS, DL, TL, KERF
        real, intent(inout) :: V
        ! other vars
        real :: T, SL, D, XI, L
        real :: XL, DEX, VADD, DC
        integer :: a, b, c
        ! for calc 

        ! volum to start
        V = 0.0

        ! if log is less the 4 feet exit
        if (TL-4.0 < 0) then
            print *, "----------<<( Feedback )>>----------"
            print *, "TOTAL LOG LENGTH IS LESS THAN FOUR FEET"
            print *, "NO BOARD FOOT VOLUME WILL BE COMPUTED."
            print *, "------------------------------------"
            return
        end if
        ! 2nd routine
        if (DL <= 0) then
            T = 0.5
            return
        else
            T = 4.0 * (DL - DS) / TL
            
            ! 3rd routine
            do I = 1, 20
                if (TL - (4.0 * I) >= 0.0) exit
            end do
            L = I - 1
            SL= (4.0 * L)
            ! 4rth routine
            D= DS + (T / 4.0) * (TL - SL)
            ! 5th routine
            do I = 1, 4
                 XI = (I)
                if (SL - TL + XI <= 0) exit
            end do
            ! 8th routine
            XL = XI - 1.0
            DEX = DS + (T / 4.0) * (TL - SL - XL)
            VADD = 0.055 * XL * DEX * DEX - 0.1775 * XL * DEX
            ! 9th routine
            do I = 1, L
                DC=D+T*I-1
                V = V + 0.22 * DC * DC - 0.71 * DC
            end do
            V = V + VADD
            ! 10th routine
            if (KERF > 0) then
                return 
            else
                V = 0.905 * V
                return
            end if
            return
        end if
      

    end subroutine calcLOGjclark
end program