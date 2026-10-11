
module collatz_conjecture
  implicit none
contains

  integer function steps(i) result(res)
    integer, intent(in) :: i
    integer :: n
    
    res = -1
    n = i
      
    do while (n >= 1)
      res = res + 1
      
      if (n == 1) then
        return
      end if
      
      if (mod(n, 2) == 0) then
        n = n / 2
      else
        n = n * 3 + 1
      end if
    end do
  end function steps

end module collatz_conjecture
