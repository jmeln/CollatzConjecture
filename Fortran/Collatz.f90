program Collatz
!author: jarrett melnick
!program to caluclate the top 10 values with the longest collatz sequences in a range
INTEGER(KIND=8)::curCollatz, iterate
iterate = 9
curCollatz = sequence(iterate)
print *, "seq = ", curCollatz

contains
function sequence(num)
  INTEGER(kind=8)::sequence,num
  sequence = 0
  do while(num >= 2)
    if(MOD(num, 2) == 0) then
      num = (num/2)
      sequence = sequence+1
    else
      num = (3*num+1)
      sequence = sequence+1
    endif
  enddo
  return
end function sequence
logical function hasCollatzSequence()

end function hasCollatzSequence
subroutine sort

end subroutine sort
end program Collatz