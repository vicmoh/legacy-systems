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
print "(a99, f10.5)", "The volume is ", V

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
        real :: inchPerFeetOfLog, segLog, scaleDown, feetsLessThanFour 
        real :: XL, DEX, VADD, DC
        integer :: a, b, c, numOfLogs
        ! for calc 

        ! volum to start
        V = 0.0

        ! if log is less the 4 feet exit
        if (TL < 4) then
            print *, "----------<<( Feedback )>>----------"
            print *, "TOTAL LOG LENGTH IS LESS THAN FOUR FEET"
            print *, "NO BOARD FOOT VOLUME WILL BE COMPUTED."
            print *, "------------------------------------"
            return
        end if

        ! check the jack taper rate
        if (DL == 0.0) then
            inchPerFeetOfLog = 0.5
        else 
            inchPerFeetOfLog = 4.0*(DL-DS)/TL
        end if

        ! found out how many full
        do a = 1, 20
            if ((TL-(4.0*a)) < 0) then
                numOfLogs = a - 1
                segLog = 4 * numOfLogs
                scaleDown = DS + (inchPerFeetOfLog/4.0) * (TL-segLog)
                ! finds how many full feets
                do b = 1, 4
                    feetsLessThanFour = b
                    if (segLog - TL + feetsLessThanFour <= 0) then
                        continue
                    else
                        XL = feetsLessThanFour - 1.0
                        DEX = DS + (inchPerFeetOfLog/4.0) * (TL - segLog - XL)
                        VADD = 0.055 * XL * DEX * DEX - 0.1775 * XL * DEX
                        do c = 1, numOfLogs 
                            DC = scaleDown + inchPerFeetOfLog * c - 1
                            V = V + 0.22 * DC * DC - 0.71 * DC
                        end do
                        V = V + VADD
                        if (KERF <= 0) then 
                            stop
                        else
                            V = 0.905 * V
                        end if
                    end if
                end do
            else
                continue
            end if
        end do


    end subroutine calcLOGjclark
end program