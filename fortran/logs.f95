!@author: Vicky Mohammad
!@email: mohammav@uoguelph.ca
!@description: A program that will calculate the log volume.

program main
    ! create struct
    implicit none
    real :: diameterInsideBark, logsLargeEnds, totalLogLength, kerf, boardFootVolume
    ! get logo and calculate
    call getLOGdata(diameterInsideBark, logsLargeEnds, totalLogLength, kerf, boardFootVolume)
    call calcLOGjclark(diameterInsideBark, logsLargeEnds, totalLogLength, kerf, boardFootVolume)

    !----------------------------------------------
    ! functions
    !----------------------------------------------

    contains

    ! a function which reads the relevent log data 
    ! required by calcLOGjclark() and calclLOGvolume()
    ! from user
    subroutine getLOGdata(diameterInsideBark, logsLargeEnds, totalLogLength, kerf, boardFootVolume)
        implicit none
        real, intent(inout) :: diameterInsideBark, logsLargeEnds, totalLogLength, kerf, boardFootVolume
        ! ask for log length
        print *, "LOG’S SCALING DIAMETER (INCHES): "
        read *, diameterInsideBark
        print *, "DIB AT LOG’S LARGE END (INCHES) (0.0 IF 1/2 INCH TAPER): "
        read *, logsLargeEnds
        print *, "TOTAL LOG LENGTH (FEET): "
        read *, totalLogLength
        print *, "KERF: "
        read *, kerf 
        ! assign to the struct
        boardFootVolume = 0.0
    end subroutine getLOGdata

    ! a function which calculates the volume of a log in
    ! cubic metres, using the data obtained by getLOGdata()
    function getLOGvolume(diameterInsideBark, logsLargeEnds, totalLogLength, length) result(volume)
        implicit none
        real, intent(in) :: diameterInsideBark, logsLargeEnds, totalLogLength, length
        real :: tempDL, tempLength 
        real :: volume, radiusSmallEnd, radiusLargeEnd, logLength
        real :: areaSmallEnd, areaLargeEnd, PI

        ! assign values
        tempLength = length
        tempDL = logsLargeEnds
        PI = 3.14159265359
        tempLength = totalLogLength/4

        ! get the logsLargeEnds and totalLogLength
        if (tempDL <= 0) then 
            tempDL = totalLogLength + (tempLength * 0.5)
        end if

        ! calc the volume
        radiusSmallEnd = (diameterInsideBark / 39.37) / 2.0
        radiusLargeEnd = (tempDL / 39.37) / 2.0
        logLength = totalLogLength / 3.2808
        areaSmallEnd = PI * radiusSmallEnd * radiusSmallEnd
        areaLargeEnd = PI * radiusLargeEnd * radiusLargeEnd
        volume = ((areaSmallEnd + areaLargeEnd) / 2) * logLength
    end function getLOGvolume

    ! a function which calculate the volume of a log in board
    ! feet, using the data obtained by getLOGdata()
    ! SUBROUTINE JCLARK (diameterInsideBark,logsLargeEnds,totalLogLength,kerf,boardFootVolume)
    subroutine calcLOGjclark(diameterInsideBark, logsLargeEnds, totalLogLength, kerf, boardFootVolume)
        ! assing param vars
        implicit none 
        real, intent(inout) :: diameterInsideBark, logsLargeEnds, totalLogLength, kerf, boardFootVolume
        ! other vars
        real :: T, SL, D, XI, L
        real :: XL, DEX, VADD, DC
        integer :: i
        real :: V2
        
        ! return if less that four feet
        if (totalLogLength-4.0 < 0) then
            print *, "Total log length is less than four feet."
            print *, "No board foot volume will be computed."
            return
        end if

        ! check if large end is taper
        if (logsLargeEnds <= 0) then
            T = 0.5
        else
            T = 4.0 * (logsLargeEnds-diameterInsideBark) / totalLogLength
        end if

        ! find out how many full foot segment
        do i = 1, 20
            if (totalLogLength-(4*i) >= 0) then
                cycle
            else 
                exit
            end if
        end do
        L = i - 1
        SL = (4 * L)
        D = diameterInsideBark + (T/4.0) * (totalLogLength-SL)

        ! find how manay full feet
        do i = 1, 4
            XI = i
            if ((SL-totalLogLength+XI) > 0 ) then 
                exit
            end if
        end do 

        ! small end of logs 
        XL = XI - 1.0
        DEX = diameterInsideBark + (T/4.0) * (totalLogLength-SL-XL)
        VADD = 0.055 * XL * DEX * DEX - 0.1775 * XL * DEX
        do i = 1, int(L)
            DC = D + T * (i-1)
            boardFootVolume = boardFootVolume + 0.22 * DC * DC - 0.71 * DC
        end do
        boardFootVolume=boardFootVolume+VADD

        ! kerf
        if (kerf > 0) then
            boardFootVolume = 0.905 * boardFootVolume
        end if

        ! get the volume
        V2 = getLOGvolume(diameterInsideBark, logsLargeEnds, totalLogLength, L)

        ! print volume result
        print *, "-----<<( Output )>>-----"
        print *, "The board feet is ", boardFootVolume
        print *, "The volume is ", V2
        print *, "------------------------"

        return
    end subroutine calcLOGjclark
end program