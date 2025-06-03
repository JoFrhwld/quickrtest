subroutine convolve(a, b, ab, a__len_, b__len_) bind(c)
  use iso_c_binding, only: c_double, c_int, c_ptrdiff_t
  implicit none

  ! manifest start
  ! sizes
  integer(c_ptrdiff_t), intent(in), value :: a__len_
  integer(c_ptrdiff_t), intent(in), value :: b__len_

  ! args
  real(c_double), intent(in) :: a(a__len_)
  real(c_double), intent(in) :: b(b__len_)
  real(c_double), intent(out) :: ab(((a__len_ + b__len_) - 1))

  ! locals
  integer(c_int) :: i
  integer(c_int) :: j
  ! manifest end


  ab = 0
  do i = 1, size(a)
    do j = 1, size(b)
      ab(((i + j) - 1_c_int)) = (ab(((i + j) - 1_c_int)) + (a(i) * b(j)))
    end do
  end do
end subroutine
