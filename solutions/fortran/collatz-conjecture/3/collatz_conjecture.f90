
module collatz_conjecture
  implicit none
contains

  integer function steps(i) result(res)
    integer, intent(in) :: i
    integer :: n

    if (i < 1) then
      res = -1
      return
    end if
    
    n = i
    res = 0
      
    do while (n /= 1)
      if (mod(n, 2) == 0) then
        n = n / 2
      else
        n = n * 3 + 1
      end if
      
      res = res + 1
    end do
  end function steps

end module collatz_conjecture
