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
        parameter PI = (3.14159265359)

        ! assign values
        tempLength = length
        tempDL = logsLargeEnds
        tempLength = totalLogLength/4

        ! get the logsLargeEnds and totalLogLength
        if (tempDL <= 0) then 
            tempDL = diameterInsideBark + (tempLength * 0.5)
        end if

        ! calculate the volume
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
        real :: taperRate, segLog, diameterScale, numOfFullFeet, numLogs
        real :: tempFullFeet, DiaEnds, volumeAdded, DiaCalc
        integer :: i
        real :: cubicResult
        
        ! return if less that four feet.
        ! if total logs length is less than 4 feet, no boards foot volume will be  computed
        if (totalLogLength-4.0 < 0) then
            print *, "Total log length is less than four feet."
            print *, "No board foot volume will be computed."
            return
        end if

        ! check if large end is taper
        ! if the log's large end diameter is furnished to jclark a taper rate will be computed
        ! if dl=0 the standard  assumption of half a inch per feet of log length will be used
        if (logsLargeEnds <= 0) then
            taperRate = 0.5
        else
            taperRate = 4.0 * (logsLargeEnds-diameterInsideBark) / totalLogLength
        end if

        ! find out how many full four foot segment the log contains.
        do i = 1, 20
            if (totalLogLength-(4*i) >= 0) then
                cycle
            else 
                exit
            end if
        end do
        numLogs = i - 1
        segLog = (4 * numLogs)
        diameterScale = diameterInsideBark + (taperRate/4.0) * (totalLogLength-segLog)

        ! find how manay full feet of length are in the segment
        ! less than four four feet long
        do i = 1, 4
            numOfFullFeet = i
            if ((segLog-totalLogLength+numOfFullFeet) > 0 ) then 
                exit
            end if
        end do 

        ! moves the scaling diameter down to the end of the 4 foot segments
        ! and increase according to the taper then calculate log volumes
        ! at the small ends
        tempFullFeet = numOfFullFeet - 1.0
        DiaEnds = diameterInsideBark + (taperRate/4.0) * (totalLogLength-segLog-tempFullFeet)
        volumeAdded = 0.055 * tempFullFeet * DiaEnds * DiaEnds - 0.1775 * tempFullFeet * DiaEnds
        
        ! calculate volumeese in the portion  of the log containing whole
        ! four foot segment
        do i = 1, int(numLogs)
            DiaCalc = diameterScale + taperRate * (i-1)
            boardFootVolume = boardFootVolume + 0.22 * DiaCalc * DiaCalc - 0.71 * DiaCalc
        end do
        boardFootVolume=boardFootVolume+volumeAdded

        ! if kerf is greater than 0, international 1/8 inch volume is converted to 
        ! the international 1/4 inch volume
        if (kerf > 0) then
            boardFootVolume = 0.905 * boardFootVolume
        end if

        ! get the volume cubic result
        cubicResult = getLOGvolume(diameterInsideBark, logsLargeEnds, totalLogLength, numLogs)

        ! print the volume and board feet
        print *, "-----<<( Output )>>-----"
        print "(A, F10.2)", "The board feet is ", boardFootVolume
        print "(A, F10.2)", "The volume is ", cubicResult
        print *, "------------------------"

        return
    end subroutine calcLOGjclark
end program