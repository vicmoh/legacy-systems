!@author: Vicky Mohammad
!@email: mohammav@uoguelph.ca

program main
    ! create struct
    implicit none
    real :: DS, DL, TL, KERF, V
    ! get logo and calculate
    call getLOGdata(DS, DL, TL, KERF, V)
    call calcLOGjclark(DS, DL, TL, KERF, V)

    !----------------------------------------------
    ! functions
    !----------------------------------------------

    contains

    ! a function which reads the relevent log data 
    ! required by calcLOGjclark() and calclLOGvolume()
    ! from user
    subroutine getLOGdata(DS, DL, TL, KERF, V)
        implicit none
        real, intent(inout) :: DS, DL, TL, KERF, V
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
    function getLOGvolume(DS, DL, TL) result(volume)
        implicit none
        real, intent(in) :: DS, DL, TL
        real :: volume, mds, mdl, mtl, a1, a2
        mds = (DS / 39.37) / 2.0
        mdl = (DL / 39.37) / 2.0
        mtl = TL / 3.2808
        volume = ((a1 + a2) / 2) * TL
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
        real :: T, SL, D, XI
        real :: XL, DEX, VADD, DC
        integer :: a, b, c, L
        real :: cubicVolume
        
        ! return if less that four feet
        if (TL-4.0 < 0) then
            print *, "Total log length is less than four feet."
            print *, "No board foot volume will be computed."
            return
        end if

        ! check if large end is taper
        if (DL <= 0) then
            T = 0.5
        else
            T = 4.0 * (DL-DS) / TL
        end if

        ! find out how many full foot segment
        do a = 1, 20
            if (TL-(4*a) >= 0) then
                cycle
            else 
                exit
            end if
        end do
        L = a - 1
        SL = (4 * L)
        D = DS + (T/4.0) * (TL-SL)

        ! find how mnay full feet
        do b = 1, 4
            XI = b
            if ((SL-TL+XI) > 0 ) then 
                exit
            end if
        end do 

        ! small end of logs 
        XL = XI - 1.0
        DEX = DS + (T/4.0) * (TL-SL-XL)
        VADD = 0.055 * XL * DEX * DEX - 0.1775 * XL * DEX
        do c = 1, L
            DC = D + T * (c-1)
            V = V + 0.22 * DC * DC - 0.71 * DC
        end do
        V=V+VADD

        ! kerf
        if (KERF > 0) then
            V = 0.905 * V
        end if

        ! calc the volume
        cubicVolume = getLOGvolume(DS, DL, TL)

        ! print volume result
        print *, "-----<<( Output )>>-----"
        print *, "The board feet is ", V
        print *, "The volume is ", cubicVolume
        print *, "------------------------"

        return
    end subroutine calcLOGjclark
end program