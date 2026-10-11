
module collatz_conjecture
  implicit none
contains

  integer function steps(i)
    integer, intent(in) :: i
    integer :: n

    steps = -1
    if (i > 0) then
      steps = 0
      n = i
      
      do while (n > 1)
        if (mod(n, 2) == 0) then
          n = n / 2
        else
          n = n * 3 + 1
        end if

        steps = steps + 1
      end do
    end if
  end function steps

end module
