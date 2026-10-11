
module collatz_conjecture
  implicit none
contains

  integer function steps(i)
    integer, intent(in) :: i
    integer :: current
    
    current = i
    steps = -1
    
    do while (current >= 1)
      steps = steps + 1
      
      if (current == 1) then
        return
      end if
      
      if (mod(current, 2) == 0) then
        current = current / 2
      else
        current = current * 3 + 1
      end if
    end do
  end function steps

end module collatz_conjecture
