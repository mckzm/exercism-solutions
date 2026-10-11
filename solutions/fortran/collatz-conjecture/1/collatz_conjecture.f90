
module collatz_conjecture
  implicit none
contains

  integer function steps(i)
    integer, intent(in) :: i
    integer :: n
    integer :: count

    if (i < 1) then
      steps = -1
    else
      n = i
      count = 0
      
      do while (n /= 1)
        count = count + 1
        if (mod(n, 2) == 0) then
          n = n / 2
        else
          n = n * 3 + 1
        end if
      end do
      
      steps = count
    end if
  end function steps

end module collatz_conjecture
