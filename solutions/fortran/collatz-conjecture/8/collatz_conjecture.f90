
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
         n = merge(n / 2, 3 * n + 1, mod(n, 2) == 0)
        steps = steps + 1
      end do
    end if
  end function steps

end module
